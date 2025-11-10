public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String findClause) {
        List<List<SObject>> searchList = [FIND :findClause IN NAME FIELDS RETURNING Contact(Id, Name, Email), Lead(Id, Name, Email)];
        return searchList;
    }
}

//Probando el método searchContactsAndLeads
List<List<SObject>> searchResult = ContactAndLeadSearch.searchContactsAndLeads('Smith');
List<Contact> contacts = (List<Contact>)searchResult[0];
List<Lead> leads = (List<Lead>)searchResult[1];

for (Contact c : contacts) {
    System.debug('Contact: ' + c.Name + ', Email: ' + c.Email);
}
for (Lead l : leads) {
    System.debug('Lead: ' + l.Name + ', Email: ' + l.Email);
}
//Consultando leads que tengan 'Smith' en el apellido
SELECT Id, Name, Email FROM Lead WHERE LastName LIKE '%Smith%'
//Creando un lead de prueba
Lead lead = new Lead(FirstName = 'John', LastName = 'Smith', Company = 'Acme Corp');
insert Lead;