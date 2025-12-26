@isTest
private class AnimalsCalloutsTest {

    @isTest
    static void testGetCallout() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json; charset=UTF-8');
        // Asociamos la llamada con el mock
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse result = AnimalsCallouts.makeGetCallout();
        Assert.areNotEqual(null, result, 'La respuesta no debe ser nula');
        Assert.areEqual(200, result.getStatusCode(), 'El código de estado debe ser 200');
        Assert.areEqual('application/json; charset=UTF-8', result.getHeader('Content-Type'), 'El tipo de contenido debe ser JSON');
        //Verificamos la cantidad de animales en la respuesta
        Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        Assert.areEqual(3, animals.size(), 'Debe haber 3 animales en la respuesta');    
    }

    @isTest
    static void testPostCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());

        HttpResponse response = AnimalsCallouts.makePostCallout();

        String contentType = response.getHeader('Content-Type');
        Assert.isTrue(contentType == 'application/json; charset=UTF-8');
        String actualValue = response.getBody();
        System.debug('Response Body: ' + actualValue);
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        Assert.areEqual(expectedValue, actualValue);
        Assert.areEqual(200, response.getStatusCode());
    }
}