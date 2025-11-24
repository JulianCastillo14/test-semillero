public with sharing class LeadProcessor implements Database.Batchable<sObject> {
    public Integer recordsProcessed = 0;
    // Obtenemos todos los registros de los leads
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name, Email, LeadSource FROM Lead');
    }
    // Realizamos el procesamiento del lote
    public void execute(Database.BatchableContext bc, List<Lead> leads) {
        for (Lead lead : leads){
            lead.LeadSource = 'Dreamforce';
            recordsProcessed++;
        }
        update leads;
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('Total records processed: ' + recordsProcessed);
    }      
}