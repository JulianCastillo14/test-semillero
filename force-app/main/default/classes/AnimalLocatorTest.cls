@isTest
private class AnimalLocatorTest {

    @isTest
    static void testGetAnimalNameByIdSuccess() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String animalName = AnimalLocator.getAnimalNameById(1);
        Assert.areEqual('chicken', animalName);
    }

    @isTest
    static void testGetAnimalNameByIdFailure() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMockFailure());
        String animalName = AnimalLocator.getAnimalNameById(1);
        Assert.areEqual(null, animalName);
    }
}