@isTest
global class AnimalLocatorMockFailure implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json; charset=UTF-8');
        res.setBody('{"error": "Not Found"}');
        res.setStatusCode(404);
        return res;
    }
}