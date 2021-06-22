public with sharing class OrderTriggerHandler extends TriggerHandler
{
    public OrderTriggerHandler() {}

    protected override void beforeInsert()
    {
        for (Ordem__c o : (List<Ordem__c>) trigger.new)
        {
            OrderDomain order = new OrderDomain(o);
            
            if(order.getTotal() == null) order.recalculaTotal();
            else order.recalculaQuantidade();
        }
    }
    protected override void beforeUpdate()
    {
        for (Ordem__c o : (List<Ordem__c>) trigger.new)
        {
            OrderDomain order = new OrderDomain(o);
            Ordem__c ordemAntiga= (Ordem__c) trigger.oldMap.get(o.id);

            if(order.isFieldDifferent(Schema.Ordem__c.Total__c, ordemAntiga)) 
            {
                o.adderror('O total não pode ser alterado manualmente depois que a ordem foi criada');
            }
            
            if(order.isFieldDifferent(Schema.Ordem__c.quantidade__c, ordemAntiga) || order.isFieldDifferent(Schema.Ordem__c.preco__c, ordemAntiga))
            {
                order.recalculaTotal();
            }
        }
    }
}