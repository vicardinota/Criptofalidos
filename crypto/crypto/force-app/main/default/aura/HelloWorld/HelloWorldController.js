({
    handleClick : function(component, event, helper) {
        var uName = component.get("v.nome");
        alert("Bem vindo " + uName);
        component.set("v.nome", "World");
    }
})