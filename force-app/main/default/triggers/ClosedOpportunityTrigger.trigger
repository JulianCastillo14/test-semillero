trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasksToInsert = new List<Task>();

    for(Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Closed Won') {
            tasksToInsert.add(new Task(
                WhatId = opp.Id,
                Subject = 'Follow Up Test Task'
            ));
        }
    }

    if (!tasksToInsert.isEmpty()) {
        insert tasksToInsert;
    }
}