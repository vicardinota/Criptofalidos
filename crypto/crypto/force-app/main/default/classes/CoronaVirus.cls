public class CoronaVirus extends Virus 
{
    public string variante;
    
    public CoronaVirus()
    {
        super('Corona Virus');
    }
    
    public override void infectar()
    {
        system.debug('Transmitindo o virus pelo ar'); 
    }
    
    public void CausarTosse()
    {
        system.debug ('causando tosse no infectado');
    }
}