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