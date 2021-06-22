public with sharing class HistoricoPrecoTriggerHandler extends TriggerHandler 
{
    public HistoricoPrecoTriggerHandler() {}
/*
    protected override void afterInsert()
    {
        this.atualizaPrecoMercado();
    }

    private void atualizaPrecoMercado()
    {
        Map<id,Mercado__c> napPrecosMercado = new Map<id,Mercado__c>();
        for(HistoricoPreco__c hp : (List<HistoricoPreco__c>) trigger.new )
        {
            napPrecosMercado.put(hp.Mercado__c, new Mercado__c(id = hp.mercado__c, cotacaoAtual__c = hp.preco__c));
        }
        update napPrecosMercado.values();
    }

*/



























/*
    //Desenvolvedor Salesforce que além de não fazer falta ainda atrapalha. Desenvolvedor Valdemort
    protected override void afterInsert()
    {
        HistoricoPreco__c hp = trigger.new[0];
        update new Mercado__c(id = hp.mercado__c, cotacaoAtual__c = hp.preco__c);
    }

*/







//Desenvolvedor Salesforce paga boquete
protected override void afterInsert()
{
    system.debug('Passei aqui');
    for(HistoricoPreco__c hp : (List<HistoricoPreco__c>) trigger.new)
    {
        //update new Mercado__c(id = hp.mercado__c, cotacaoAtual__c = hp.preco__c);
    }
}














































}
