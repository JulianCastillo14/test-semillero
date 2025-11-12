public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String findClause) {
        List<List<SObject>> searchList = [FIND :findClause IN NAME FIELDS RETURNING Contact(Id, Name, Email), Lead(Id, Name, Email)];
        return searchList;
    }
}