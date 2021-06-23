@istest
public class OrderDomainTest {
    
    @istest
    static void recalculaQuantidadeTest() 
    {
        //Criação do cenário de teste

        Ordem__c testOrdem = new Ordem__c(preco__c = 100, Total__c=1000);
        OrderDomain od = new OrderDomain(testOrdem);
        Test.startTest();
        od.recalculaQuantidade();
        Test.stopTest();
        System.assertEquals(10, od.order.quantidade__c, 'O recalculo de quantidade não está correto');
    }


    @istest
    static void recalculaQuantidadeSemPrecoTest() 
    {
        //Criação do cenário de teste

        Ordem__c testOrdem = new Ordem__c(preco__c = null, Total__c=1000);
        OrderDomain od = new OrderDomain(testOrdem);
        Test.startTest();
        od.recalculaQuantidade();
        Test.stopTest();
        System.assertEquals(1, od.order.getErrors().size(), 'O recalculo de quantidade não está correto');
    }

    @istest
    static void TestFodase() 
    {
        OrderDomain.aaa();
    }
}
