public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer animalId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + String.valueOf(animalId));
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            Map<String,Object> result = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,Object> animal = (Map<String,Object>) result.get('animal');
            String name = (String) animal.get('name');
            return name;
        } else {
            System.debug('Error: ' + response.getStatusCode() + ' ' + response.getStatus());
            return null;
        }
    }
}