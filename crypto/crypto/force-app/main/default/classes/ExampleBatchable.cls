public with sharing class ExampleBatchable implements Database.Batchable<sObject>{ 
    public ExampleBatchable() {}
    
    public Database.QueryLocator start(Database.BatchableContext info){ 
        system.debug('###START###');
        return Database.getQueryLocator('SELECT id, revisao__c FROM HistoricoPreco__c'); 
    }     
    public void execute(Database.BatchableContext info, List<HistoricoPreco__c> scope)
    {
        system.debug('###EXECUTE###');
        system.debug('###SIZE = '+scope.size()+'###');
        for(HistoricoPreco__c hp : scope)
        {
            if(hp.revisao__c == null)
            {
                hp.revisao__c = 0;
            }
            else{
                hp.revisao__c++;
            }
        }
        update scope;
    }     
    public void finish(Database.BatchableContext info){
        system.debug('###FINISH###');     
    } 
}
