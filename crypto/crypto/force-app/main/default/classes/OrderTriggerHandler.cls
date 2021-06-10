public with sharing class OrderTriggerHandler extends TriggerHandler
{
    public OrderTriggerHandler() {}

    protected override void beforeInsert()
    {
        for (Ordem__c o : (List<Ordem__c>) trigger.new)
        {
            Ordem__c ordemFoda = o;
            /*CALCULO DO TOTAL*/
            if(ordemFoda.Total__c == null)
            {
                if(ordemFoda.preco__c != null && ordemFoda.quantidade__c != null)
                {
                    ordemFoda.Total__c = ordemFoda.quantidade__c * ordemFoda.preco__c;
                }
                else 
                {
                    ordemFoda.adderror('Os valores de quantidade e preço não foram preenchidos.');
                }
            }
            //CALCULO DA QUANTIDADE
            else {
                if(ordemFoda.preco__c!=null)
                {
                    ordemFoda.quantidade__c = ordemFoda.Total__c  / ordemFoda.preco__c;
                }
                else {
                    ordemFoda.adderror('Os valores de total e preço não foram preenchidos.');
                }
            }
        }

    }
    protected override void beforeUpdate()
    {
        for (Ordem__c o : (List<Ordem__c>) trigger.new)
        {
            Ordem__c ordemFoda = o;
            //Map<id,Ordem__c> oldMap;
            Ordem__c ordemMerda = (Ordem__c) trigger.oldMap.get(ordemFoda.id);
            //Erro de alteração de total
            if(ordemFoda.quantidade__c!= null && ordemFoda.preco__c!= null)
            {
                if(ordemMerda.Total__c != ordemFoda.Total__c  && ordemFoda.Total__c != (ordemFoda.quantidade__c * ordemFoda.preco__c))
                {
                    ordemFoda.adderror('O total não pode ser alterado manualmente depois que a ordem foi criada');
                }
                //Recalculo do total
                if(ordemMerda.quantidade__c != ordemFoda.quantidade__c || ordemMerda.preco__c != ordemFoda.preco__c)
                {
                    ordemFoda.total__c = ordemFoda.quantidade__c * ordemFoda.preco__c;
                }
            }
            else {
                ordemFoda.adderror('Os valores de quantidade e preço não foram preenchidos.');
            }

        }
    }

}
