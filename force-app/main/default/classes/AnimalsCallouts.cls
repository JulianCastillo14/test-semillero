public with sharing class AnimalsCallouts {
    public static HttpResponse makeGetCallout(){
        Http http =  new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //Si la respuesta es exitosa
        if(response.getStatusCode() == 200){
            //Deserializamos la respuesta JSON
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            //Obtenemos la lista de animales
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Animales obtenidos: ' + animals);
            for(Object animal: animals){
                System.debug('Animal: ' + animal);
            }
        }
        return response;
    }

    public static HttpResponse makePostCallout(){
       Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        //Creamos el cuerpo de la solicitud JSON
        request.setBody('{"name": "mighty moose"}');
        HttpResponse response = http.send(request);
        //Si la respuesta es exitosa
        if(response.getStatusCode() != 201){
            //Deserializamos la respuesta JSON
            System.debug('El estado retornado no es el esperado: ' + response.getStatusCode() + ' ' + response.getStatus());
        }else {
            System.debug(response.getBody());
        }
        return response;
    }
}
