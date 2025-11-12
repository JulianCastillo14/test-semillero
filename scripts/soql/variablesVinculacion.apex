Integer maxHomeValue = 200000;
List<Property__c> property = [SELECT Name, Price__c FROM Property__c WHERE Price__c < :maxHomeValue];

