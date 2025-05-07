from django.urls import path
from .views import HelloWorldView

urlpatterns = [
    path('helloworld/', HelloWorldView.as_view(), name='api-helloworld'),
]
