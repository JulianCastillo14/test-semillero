// Creando una lista de contactos para insertar
List<Contact> conList = new List<Contact> {
    new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
        new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
        new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
        new Contact(FirstName='Kim',LastName='Shain',Department='Education')};
// Insertando la lista de contactos en la base de datos
insert conList;
// Actualizando un campo para unos contactos en la lista
List<Contact> listToUpdate = new List<Contact>();

for(Contact con : conList) {
    if (con.Department == 'Finance') {
        con.Title = 'Financial analyst';
        listToUpdate.add(con);
    }
}
update listToUpdate;