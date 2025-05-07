from django.shortcuts import render

# Create your views here.
def index(request):
    context = {
        "msg": "반가워요!"
    }
    return render(request, 'sample/index.html', context)
