from django.db import models
from users.models import User


class Product(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, null=False)
    description = models.CharField(max_length=255, null=False)
    image = models.CharField(max_length=255, null=True)
    price = models.IntegerField(null=False)
    stock = models.IntegerField(default=0, null=True)
    quantity = models.IntegerField(default=0, null=True)
    brand = models.CharField(max_length=255, null=False)
    userId = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
