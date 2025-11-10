Account[] accts = [SELECT Name, Phone FROM Account LIMIT 5];
for (Account a : accts) {
    System.debug('Account Name: ' + a.Name + ', Phone: ' + a.Phone);
}