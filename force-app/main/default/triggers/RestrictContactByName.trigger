trigger RestrictContactByName on Contact (before insert, before update) {
  // Chekeamos que el apellido no sea 'INVALIDNAME'
  for(Contact c : Trigger.New) {
    if(c.LastName == 'INVALIDNAME') {
      // Lanzamos un error si el apellido es 'INVALIDNAME'
      c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
    }
  }
}