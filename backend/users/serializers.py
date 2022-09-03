from rest_framework import serializers
from .models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "name",
            "gender",
            "email",
            "password",
            "image",
            "created_at",
            "updated_at",
        ]
