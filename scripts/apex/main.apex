List<Contact> contacts = RandomContactFactory.generateRandomContacts(12, 'Castillo');
for(Contact c : contacts){
    System.debug('Contact generated: ' + c.FirstName + ' ' + c.LastName);
}