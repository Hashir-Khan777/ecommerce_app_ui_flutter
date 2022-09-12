from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Product
from .serializers import ProductSerializer


class ProductsListApiView(APIView):
    def get(self, request):
        products = Product.objects.all()
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        serializer = ProductSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ProductsDetailApiView(APIView):
    def put(self, request, product_id):
        product_instance = Product.objects.get(id=product_id)
        if not product_instance:
            return Response(
                {"message": "product does not exists"},
                status=status.HTTP_400_BAD_REQUEST,
            )
        serializer = ProductSerializer(
            instance=product_instance, data=request.data, partial=True
        )
        if serializer.is_valid():
            serializer.save()
            return Response(
                serializer.data, status=status.HTTP_200_OK
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, product_id):
        product = Product.objects.get(id=product_id)
        serializer = ProductSerializer(product)
        return Response(serializer.data, status=status.HTTP_200_OK)
