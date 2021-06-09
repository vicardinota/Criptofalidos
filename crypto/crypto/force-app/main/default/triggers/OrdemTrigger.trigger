trigger OrdemTrigger on Ordem__c (before insert) // before ou after -- insert, update, delete, undelete
{
    for(Ordem__c o : trigger.new)
    {
        o.adderror('deu ruim');
    }
}