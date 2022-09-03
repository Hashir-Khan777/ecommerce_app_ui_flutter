from django.urls import path
from .views import UsersDetailApiView, UsersListApiView

urlpatterns = [
    path("", UsersListApiView.as_view()),
    path("<int:user_id>/", UsersDetailApiView.as_view()),
]
