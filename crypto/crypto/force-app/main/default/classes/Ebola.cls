public class Ebola extends Virus 
{
    
    public Ebola()
    {
        super('Ebola');
    }
    
    public override void infectar()
    {
        system.debug('Transmitindo o por contato com fluidos corporais'); 
    }
}