from django.urls import path
from .views import CartDetailsApiView, CartListApiView

urlpatterns = [
    path("", CartListApiView.as_view()),
    path("<int:product_id>/", CartDetailsApiView.as_view()),
]
