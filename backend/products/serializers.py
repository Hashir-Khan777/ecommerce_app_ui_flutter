from rest_framework import serializers
from .models import Product


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = [
            "id",
            "name",
            "description",
            "image",
            "price",
            "brand",
            "userId",
            "created_at",
            "updated_at",
        ]
