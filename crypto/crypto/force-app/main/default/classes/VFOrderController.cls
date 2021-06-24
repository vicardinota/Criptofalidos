public class VFOrderController {
    
    public List<Ordem__c> ordemList {get; set;}
    public String currentValue {get; set;}
    public List<BinanceAPI.SymbolPrice> priceList {get; set;}
    public String html {get; set;}
    public DateTime currentDate {get; set;}
    
    public VFOrderController(){
        
    }

    public VFOrderController(ApexPages.StandardController controller){
        Mercado__c mercado = (Mercado__c) controller.getRecord(); 

        ordemList = [SELECT Id, Name,OperacaoMercado__c, Preco__c, toLabel(Tipo__c), Status__c, Quantidade__c, Total__c, Validade__c  
                     FROM Ordem__c 
                     WHERE Mercado__c =:mercado.Id
                    ];

        for(Ordem__c o : ordemList){
            o.Quantidade__c = o.Quantidade__c.setScale(6);
            o.Total__c = o.Total__c.setScale(6);
        }

        currentValue = BinanceAPI.getPrice(mercado.Id);
        priceList = BinanceAPI.getPrice();
        currentDate = DateTime.Now();
    }
}