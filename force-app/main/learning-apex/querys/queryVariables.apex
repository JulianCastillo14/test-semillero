String targetDepartment = 'Wingo';
Contact[] contacts = [SELECT FirstName, LastName, Email FROM Contact WHERE Department = :targetDepartment];
for (Contact c : contacts) {
    System.debug('Contact Name: ' + c.FirstName + ' ' + c.LastName);
}