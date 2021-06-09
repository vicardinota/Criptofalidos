public virtual class Virus implements IInfeccioso
{
    public string nome;
    public integer tamanho;
    
    public Virus(string nome)
    {
         system.debug('Construindo com parametro name');
         this.nome = nome;
    }
    
    public Virus(){system.debug('Construindo');}
    
    public string getNome()
    {
        return this.nome;
    }
    
    public virtual void infectar()
    {
        system.debug('Transmitindo o virus');  
    }
    
    public static void InfeccaoGeral(list<IInfeccioso> virulenta)
    {
        for(IInfeccioso vr : virulenta)
        {
            vr.infectar();
        }
    }
}