from django.http import JsonResponse

def index(request):
    data = {
        "message": "Hello, API!"
    }
    return JsonResponse(data)
