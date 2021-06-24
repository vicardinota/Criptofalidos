global with sharing class SchedulerGetPreco implements Schedulable {
    public SchedulerGetPreco() {}

    global void execute(SchedulableContext sc) {
        SchedulerGetPrecoHelper.AtualizaCotacaoAtualTodosMercadosAtivos();
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