({
    retrievePrice : function(component, event, helper) {
        helper.retrievePrice(component, event, helper);
    },

    handleChange : function(component, event, helper) {
        //console.log(event.getParam("checked"));
        component.set("v.opMercado", !event.getParam("checked"));
        helper.retrievePrice(component, event, helper);
    },

    handleSuccess : function(component, event, helper){
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title" : 'Sucesso!',
            "message" : 'Registro inserido!',
            "type" : "success",
            "duration" : 3000
        });
        toastEvent.fire();

        component.find("ordField").forEach(function(f){
            f.reset();
        });
    },

    handleOrder : function(component, event, helper) {
        event.preventDefault();
        var fields = event.getParam("fields");
        
        var action = component.get("c.getRecordTypeId");
        action.setParams({
            "orderType" : "Compra"
        });

        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
               var rtId = response.getReturnValue();
               fields["RecordTypeId"] = rtId;
               if(fields["OperacaoMercado__c"] == false){
                    fields["Status__c"] = "Aguardando";
               }else{
                    fields["Status__c"] = "Executada";
               }
               if(fields["Preco__c"] == undefined){
                    fields["Preco__c"] = component.get("v.currentPrice");
               }
               component.find('orderForm').submit(fields);
            }else{
                console.log("Erro: " + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(action);
    },

    handleQuantityPriceChange : function(component, event, helper) {
        var price = component.get("v.price");
        var quantity = component.get("v.quantity");
        var total = price*quantity;

        component.set("v.total", total);
    },

    handleTotalChange : function(component, event, helper) {
        var price = component.get("v.price");
        var total = component.get("v.total");
        var quantity = total/price;

        component.set("v.quantity", quantity);
    }
})