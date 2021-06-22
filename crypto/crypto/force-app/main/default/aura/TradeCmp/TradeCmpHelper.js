({
    retrievePrice : function(component, event, helper) {
        var action = component.get("c.getPrice");
        action.setParams({
            "mercadoId" : component.get("v.recordId")
        });

        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
               //alert('O preço atual é: ' + response.getReturnValue());
               component.set("v.currentPrice", response.getReturnValue());
               component.set("v.price", response.getReturnValue());
            }else{
                console.log("Erro: " + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(action);
    }
})