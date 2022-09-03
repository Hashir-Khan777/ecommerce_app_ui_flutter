from django.urls import path
from .views import ProductsListApiView, ProductsDetailApiView

urlpatterns = [
    path("", ProductsListApiView.as_view()),
    path("<int:product_id>/", ProductsDetailApiView.as_view()),
]
