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
private class DailyLeadProcessorTest {

    @TestSetup
    static void setup(){
        List<Lead> leadlist = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
            Lead lead = new Lead(
                FirstName = 'Test ' + i,
                LastName = 'Test ' + i,
                Company = 'Test ' + i,
                Email = 'test' + i + '@test.com',
                Phone = '1234567890',
                Status = 'Open',
                Country = 'United States - Lead Soucrce Empty',
                LeadSource = '');
            leadlist.add(lead);
        }
        insert leadlist;
    }

    @isTest
    static void updateLeadSourceEmpty() {
        DailyLeadProcessor dailyLead = new DailyLeadProcessor();
        String cronExp = '0 52 9 * * ? *';
        Test.startTest();
        String jobId = System.schedule('Actualizando campos en blanco de LeadSource', cronExp, dailyLead);
        Test.stopTest();

        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE Country = 'United States - Lead Soucrce Empty' LIMIT 200];
        for(Lead lead : leads) {
            System.Assert.areEqual('Dreamforce', lead.LeadSource);
        }
    }
}