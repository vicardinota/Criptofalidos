public class OrderController {
    
    @AuraEnabled
    public static List<Ordem__c> getOrderList(String marketId) {
        List<Ordem__c> ordemList = [SELECT Id, Name, OperacaoMercado__c, Preco__c, Tipo__c, Status__c, Quantidade__c, Total__c, Validade__c 
                                    FROM Ordem__c 
                                    WHERE Mercado__c = :marketId
                                    Order by createdDate DESC];
        
        for( Ordem__c ordem : ordemList){
            ordem.Link__c = '/' + ordem.Id;
        }
        return ordemList;
    }
}
