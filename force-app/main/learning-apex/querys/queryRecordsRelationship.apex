Account[] accounts = [SELECT Name, (SELECT LastName FROM Contacts) FROM Account WHERE Name = 'SFDC Computing'];
for (Account acc : accounts) {
    System.debug('Account Name: ' + acc.Name);
    for (Contact con : acc.Contacts) {
        System.debug('  Contact Last Name: ' + con.LastName);
    }
}
