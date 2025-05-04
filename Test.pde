public class Test { // test klasse der binder rollerne og resultaterne sammen

  private String Name; // brugernavnet
  private HashMap<Role, ArrayList<Float>> Scores = new HashMap<Role, ArrayList<Float>>(); // vi danner scores som er en hashmap der mapper rollerne med resultaterne som brugeren indgiver

  public Test(String name) { // constructor som modtager brugerens navn
    this.Name = name;
    this.Scores = new HashMap<Role, ArrayList<Float>>();
    InitializeScores();
  }

  public void InitializeScores() { // initializer resultaterne medmindre rollen er neutral
    for (Role role : Role.values()) {
      if (role == Role.Neutral)
        continue;
      this.Scores.put(role, new ArrayList<Float>()); // for hver rolle danner man en tom arrayliste
    }
  }

  public void AddScore(Role role, Float score) { // man ligger resultaterne til arraylisten for den tilhørende rolle
    if (role == Role.Neutral) // vi sikre os at der ikke er score på neutral
      return;

    if (this.Scores.containsKey(role)) { // vi tjekker om rollen er i vores scores keys og hvis den er det, tilføjer vi score til rollen
      ArrayList<Float> previousScores = this.Scores.get(role);
      previousScores.add(score);
      this.Scores.put(role, previousScores);
    }
  }

  // returner et nummer mellem 0 og 1 som repræsentere procenten som brugeren matcher rollen med
  public Float GetPercentage(Role role) { // man tjekker den gennemsnitlige procent af score for spørgsmålene til de enkelte roller
    if (role == Role.Neutral) // hvis rollen er neutral return 0 procent
      return 0f;
    if (!this.Scores.containsKey(role)) // hvis rollen ikke er i scores listen, return 0 procent
      return 0f;

    ArrayList<Float> scores = this.Scores.get(role); // tag resultaterne fra de forskellige roller
    int arraySize = scores.size(); // tjek størrelse på arraylisten af resultater til rollerne

    if (arraySize == 0) // avoider division med 0
      return 0f;

    // regner resultaterne sammen for hvert spørgsmål og gemmer den i sum
    Float sum = 0f;
    for (Float score : scores) {
      sum += score;
    }
    return sum/arraySize; // vi dividere summen med størrelsen af arrayet og returner resultaten
  }
}
