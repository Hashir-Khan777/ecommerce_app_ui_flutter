import os
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import User
from .serializers import UserSerializer
import jwt
from dotenv import load_dotenv

load_dotenv()


class UsersListApiView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            token = jwt.encode(serializer.data, os.getenv("JWT_SECRET"))
            return Response(
                {**serializer.data, "token": token}, status=status.HTTP_200_OK
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UsersDetailApiView(APIView):
    def get(self, request, user_id):
        user = User.objects.get(id=user_id)
        serializer = UserSerializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def put(self, request, user_id):
        user_instance = User.objects.get(id=user_id)
        if not user_instance:
            return Response(
                {"message": "user does not exists"}, status=status.HTTP_400_BAD_REQUEST
            )
        serializer = UserSerializer(
            instance=user_instance, data=request.data, partial=True
        )
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserLoginApiView(APIView):
    def post(self, request):
        user_instance = User.objects.get(email=request.data.get("email"))
        if not user_instance:
            return Response(
                {"message": "user does not exists"}, status=status.HTTP_400_BAD_REQUEST
            )
        serializer = UserSerializer(
            instance=user_instance, data=request.data, partial=True
        )
        if serializer.is_valid() and request.data.get(
            "password"
        ) == serializer.data.get("password"):
            token = jwt.encode(serializer.data, os.getenv("JWT_SECRET"))
            return Response(
                {**serializer.data, "token": token}, status=status.HTTP_200_OK
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
