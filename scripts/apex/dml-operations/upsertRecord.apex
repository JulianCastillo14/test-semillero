// Insertamos el contacto Josh en la base de datos
Contact josh = new Contact(FirstName='Josh',LastName='Kaplan',Department='Finance');
insert josh;
// Josh es un registro persistido en la base de datos
// Entonces la variable josh.Id contiene el Id del registro
// cuando usamos upsert, Salesforce sabe que debe actualizar este registro
josh.Description = 'Josh ha sido actualizado con una operación upsert.';
// Creamos el contacto Kathy, pero este no persiste en la base de datos
Contact kathy = new Contact(FirstName='Kathy',LastName='Brown',Department='Technology');
List<Contact> contacts = new List<Contact> { josh, kathy };
upsert contacts;
// Resultado: Josh es actualizado y Kathy es insertada.