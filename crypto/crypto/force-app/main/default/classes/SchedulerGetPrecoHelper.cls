public with sharing class SchedulerGetPrecoHelper {
    public SchedulerGetPrecoHelper() 
    {}

    @future (callout=true)
    public static void AtualizaCotacaoAtualTodosMercadosAtivos()
    {
        Map<string,double> priceMap = new Map<string,double>();
        List<BinanceAPI.SymbolPrice> spList = BinanceAPI.getPrice();
        for(BinanceAPI.SymbolPrice sp : spList)
        {
            priceMap.put(sp.symbol, Double.valueof(sp.price));
        }
        List<Mercado__c> mercList = [SELECT name, ContinuousName__c FROM Mercado__c WHERE ativo__c = true AND ContinuousName__c in :priceMap.keyset()];
        for(Mercado__c mer : mercList)
        {
            mer.CotacaoAtual__c =priceMap.get(mer.ContinuousName__c);
        }
        update mercList;
    }
}