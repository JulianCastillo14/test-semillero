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