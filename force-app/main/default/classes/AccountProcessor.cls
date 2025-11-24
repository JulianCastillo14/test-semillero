public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountsIDs){
        Integer numberOfContacts = 0;
        Account[] accountsToUpdate = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountsIDs];

        for(Integer i = 0; i < accountsToUpdate.size(); i++){
            numberOfContacts = accountsToUpdate[i].Contacts.size();
            accountsToUpdate[i].Number_of_Contacts__c = numberOfContacts;
        }
        update accountsToUpdate;
    }
}