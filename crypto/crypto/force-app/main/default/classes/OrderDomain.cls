public with sharing class OrderDomain {
    
    private Ordem__c order;

    public double getTotal()
    {
        return order.Total__c;
    }

    public OrderDomain(Ordem__c order) 
    {
        this.order = order;
    }

    public void recalculaTotal()
    {  
        if(order.preco__c != null && order.quantidade__c != null)
        {
            order.Total__c = order.quantidade__c * order.preco__c;
        }
        else 
        {
            order.adderror('Os valores de quantidade e preço não foram preenchidos.');
        }
    }

    public void recalculaQuantidade()
    {
        if(order.preco__c!=null && order.Total__c != null)
        {
            order.quantidade__c = order.Total__c  / order.preco__c;
        }
        else {
            order.adderror('Os valores de total e preço não foram preenchidos.');
        }
    }

    public boolean isFieldDifferent(Schema.sObjectField field, Ordem__c compareOrder)
    {
        return order.get(field) != compareOrder.get(field);
    }
}
