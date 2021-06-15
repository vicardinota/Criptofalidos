public class BinanceAPI {
    
    @AuraEnabled
    public static String getPrice(String mercadoId){
        Mercado__c mercado = [SELECT Id, MoedaPrimaria__c, MoedaSecundaria__c 
                              FROM Mercado__c
                              WHERE Id = :mercadoId];

        String pair = mercado.MoedaPrimaria__c + mercado.MoedaSecundaria__c;
        pair = pair.replace('USD', 'USDT');

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.binance.com/api/v3/ticker/price?symbol=' + pair);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            SymbolPrice sp = (SymbolPrice)JSON.deserialize(response.getBody(), SymbolPrice.class);
            return sp.price;
        }else{
            return 'Erro ao acessar a API da Binance!';
        }
    }

    private Class SymbolPrice{
        String symbol;
        String price;
    }
}
