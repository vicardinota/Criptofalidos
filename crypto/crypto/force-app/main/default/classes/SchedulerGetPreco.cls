global with sharing class SchedulerGetPreco implements Schedulable {
    public SchedulerGetPreco() {}

    global void execute(SchedulableContext sc) {
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
        this.ReagendaEmUmMinuto();

    }
    


    private void ReagendaEmUmMinuto()
    {
        DateTime nextRunTime = DateTime.now().addMinutes(1);
        
        String cronString = '' + nextRunTime.second() + ' ' + nextRunTime.minute() + ' ' + 
            nextRunTime.hour() + ' ' + nextRunTime.day() + ' ' + 
            nextRunTime.month() + ' ? ' + nextRunTime.year();
        
        System.schedule(SchedulerGetPreco.class.getName() + '-' + nextRunTime.format(), cronString, new SchedulerGetPreco());
    }
}
