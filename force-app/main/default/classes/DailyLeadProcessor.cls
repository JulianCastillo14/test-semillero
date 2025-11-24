public with sharing class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext sc){
        String LeadSource = '';
        List<Lead> leads = [SELECT Id, Name, Email FROM Lead WHERE LeadSource=:LeadSource LIMIT 200];
        for (Lead lead : leads){
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}