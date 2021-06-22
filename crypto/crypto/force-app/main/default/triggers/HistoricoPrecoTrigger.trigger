trigger HistoricoPrecoTrigger on HistoricoPreco__c (after insert)
{
    (new HistoricoPrecoTriggerHandler()).run();
}