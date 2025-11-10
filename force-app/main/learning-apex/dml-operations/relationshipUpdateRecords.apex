// Consulta el contacto asociado con la cuenta
Contact queriedContact = [SELECT Account.Name
                          FROM Contact
                          WHERE FirstName = 'Mario' AND LastName='Castillo'
                          LIMIT 1];
// Actualiza el número de teléfono del contacto
queriedContact.Phone = '(415)555-1213';
// Actualiza el campo Industry de la cuenta relacionada
queriedContact.Account.Industry = 'Technology';
// Hacemos dos llamadas DML separadas
// 1. Hacemos la primera llamada DML para actualizar el número de teléfono del contacto
update queriedContact;
// 2. Hacemos la segunda llamada DML para actualizar la cuenta relacionada
update queriedContact.Account;