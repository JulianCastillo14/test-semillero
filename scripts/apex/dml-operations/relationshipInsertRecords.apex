Account acct = new Account(Name='SFDC Account');
insert acct;
// podemos obtener el ID de la cuenta insertada
ID acctID = acct.ID;
// insertar un contacto relacionado con la cuenta
Contact mario = new Contact(
    FirstName='Mario',
    LastName='Castillo',
    Phone='415.555.1212',
    AccountId=acctID);
insert mario;