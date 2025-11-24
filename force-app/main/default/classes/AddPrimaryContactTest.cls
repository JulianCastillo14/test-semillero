/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class AddPrimaryContactTest {
    @TestSetup
    static void setup(){
        List<Account > accountNY = new List<Account>();
        List<Account > accountCA = new List<Account>();

        for(Integer i = 0; i < 50;i++){
            Account acc = new Account();
            acc.Name = 'Account ' + i;
            acc.BillingState = 'NY';
            accountNY.add(acc);
        }
        for(Integer i = 0; i < 50;i++){
            Account acc = new Account();
            acc.Name = 'Account ' + i;
            acc.BillingState = 'CA';
            accountCA.add(acc);
        }
        insert accountNY;
        insert accountCA;
    }

    @isTest
    static void insertContactToBillingState() {
        Contact contactTest = new Contact();
        contactTest.FirstName = 'Julian';
        contactTest.LastName = 'Castillo';
        String BillingStateTest = 'NY';
        AddPrimaryContact addPrimaryContact = new AddPrimaryContact(contactTest, BillingStateTest);  
        Test.startTest();
        System.enqueueJob(addPrimaryContact);
        Test.stopTest();

        List<Account>  accounts = [SELECT Id, Name, BillingState FROM Account WHERE BillingState = :BillingStateTest LIMIT 50];
        List<Contact> contacts = [SELECT Id, Name, AccountId, LastName FROM Contact WHERE AccountId IN :accounts LIMIT 50];
        Integer countContacts = [SELECT COUNT() FROM Contact WHERE AccountId IN :accounts];
        for (Integer i = 0; i < accounts.size(); i++) {
            System.assertEquals('Castillo', contacts[i].LastName);
        }
        System.assertEquals(50, countContacts);
    }
}