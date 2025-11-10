public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String LastName, String MailPostalCode){
        List<Contact> contacts = [SELECT Id, Name FROM Contact WHERE (LastName = :LastName AND MailingPostalCode = :MailPostalCode)];
        return contacts;
    }
}

List<Contact> contacts = ContactSearch.searchForContacts('Rogers','27215');
for(Contact con : contacts){
    System.debug('Contact Found: ' + con.Id + ' ' + con.Name);
}