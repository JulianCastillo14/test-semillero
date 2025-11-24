public with sharing class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String BillingState;
    public AddPrimaryContact(Contact contact, String BillingState) {
        this.contact = contact;
        this.BillingState = BillingState;
    }
    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id, Name, BillingState FROM Account WHERE BillingState = :BillingState LIMIT 200];

        List<Contact> contactsClone = new List<Contact>();

        for (Account acc : accounts) {
            Contact c = contact.clone();
            c.AccountId = acc.Id;
            contactsClone.add(c);
        }
        insert contactsClone;
    }
}