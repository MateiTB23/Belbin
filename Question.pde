public class Question { // Question klasse som repræsentere et spørgsmål der bliver bundet  sammen med en rolle
  private String Text; // Spørgsmål tekst
  private Role Role; // Rollen
  
  public Question(String text, Role role) { // Constructor 
    this.Text = text;
    this.Role = role;
  }
  
  public String GetText() { // returner teksten for spørgmsålet
    return this.Text;  
  }
  
  public Role GetRole() { // returner rollen assosiceret med spørgmsålet
    return this.Role;  
  }
}
