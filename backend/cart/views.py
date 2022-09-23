import os
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from products.models import Product
from products.serializers import ProductSerializer
import jwt


class CartListApiView(APIView):
    def get(self, request):
        token = request.headers.get("token")[7:]
        user = jwt.decode(token, os.getenv("JWT_SECRET"), algorithms=["HS256"])
        product = Product.objects.filter(userId=user.get("id"))
        serializer = ProductSerializer(product, many=True)
        return Response(
            serializer.data,
            status=status.HTTP_200_OK,
        )


class CartDetailsApiView(APIView):
    def put(self, request, product_id):
        token = request.headers.get("token")[7:]
        user = jwt.decode(token, os.getenv("JWT_SECRET"), algorithms=["HS256"])
        product_instance = Product.objects.get(id=product_id)
        if not product_instance:
            return Response(
                {"message": "product does not exists"},
                status=status.HTTP_400_BAD_REQUEST,
            )
        data = {"userId": user.get("id"), "quantity": 1}
        serializer = ProductSerializer(
            instance=product_instance, data=data, partial=True
        )
        if serializer.is_valid():
            serializer.save()
            return Response(
                {"message": "product has been added to cart"}, status=status.HTTP_200_OK
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, product_id):
        product_instance = Product.objects.get(id=product_id)
        if not product_instance:
            return Response(
                {"message": "product does not exists"},
                status=status.HTTP_400_BAD_REQUEST,
            )
        data = {"userId": "", "quantity": 0}
        serializer = ProductSerializer(
            instance=product_instance, data=data, partial=True
        )
        if serializer.is_valid():
            serializer.save()
            return Response(
                {"message": "product has been removed to cart"},
                status=status.HTTP_200_OK,
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
