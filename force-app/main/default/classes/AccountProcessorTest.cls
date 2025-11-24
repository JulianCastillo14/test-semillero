// ...existing code...
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
private class AccountProcessorTest {

    @isTest
    static void numberOfContacts() {
        // Crear cuentas de prueba
        List<Account> accts = new List<Account>{
            new Account(Name='Acct A'),
            new Account(Name='Acct B'),
            new Account(Name='Acct C')
        };
        insert accts;

        // Crear contactos: 1, 2 y 3 contactos por cada cuenta
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName='C1', LastName='L1', AccountId=accts[0].Id));
        contacts.add(new Contact(FirstName='C2', LastName='L2', AccountId=accts[1].Id));
        contacts.add(new Contact(FirstName='C3', LastName='L3', AccountId=accts[1].Id));
        contacts.add(new Contact(FirstName='C4', LastName='L4', AccountId=accts[2].Id));
        contacts.add(new Contact(FirstName='C5', LastName='L5', AccountId=accts[2].Id));
        contacts.add(new Contact(FirstName='C6', LastName='L6', AccountId=accts[2].Id));
        insert contacts;

        // Preparar lista de Ids
        List<Id> accountIds = new List<Id>();
        for (Account a : accts) accountIds.add(a.Id);

        Test.startTest();
        // Llamada al método bajo prueba (asumiendo que es void)
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        // Consultar valores actualizados y comparar con el esperado
        List<Account> updated = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id IN :accountIds];
        Map<Id, Decimal> expected = new Map<Id, Decimal>();
        expected.put(accts[0].Id, 1);
        expected.put(accts[1].Id, 2);
        expected.put(accts[2].Id, 3);

        for (Account ua : updated) {
            System.assertEquals(expected.get(ua.Id), ua.Number_of_Contacts__c, 'Mismatch for account ' + ua.Id);
        }
    }
}