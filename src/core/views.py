import os
from django.template import loader
from django.http import JsonResponse, HttpRequest


#def healthcheck_view(_request: HttpRequest) -> JsonResponse:
#    return JsonResponse({'status':'Love','hostname': os.getenv('HOSTNAME', 'unspecified')})

#@login_required(login_url="/login/")
def index(request):

    html_template = loader.get_template('index.html')
    context = {'powerchip' :'Eset - SmartIt Importer',
           }
    return HttpResponse(html_template.render(context, request))
