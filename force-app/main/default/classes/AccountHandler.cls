public with sharing class AccountHandler {
    public static Account insertNewAccount(String Name){
        try{
            Account acc = new Account(Name = Name);
            insert acc;
            return acc;
        } catch (DmlException e){
            System.debug('Error: ' + e.getMessage());
            return null;
        }
    }
}