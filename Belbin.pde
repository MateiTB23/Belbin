import controlP5.*; // Importer ControlP5 library for GUI controls som buttons and sliders

// Declarer variabler ControlP5 GUI komponenter

private ControlP5 cp5;
private Textlabel resultsLabel;  // Text label for at vise resultater
private Textfield nameTextfield;  // Text input for brugernavn
private Quiz quiz = new Quiz(); // New object quiz af klassen Quiz som bliver brugt for at store spørgsmål
private Test test = new Test("USER"); // New object test af klassen Test, som bliver brugt til at binde spørgsmålene med resultaterne
private int x = 10; // oprendelige x position
private int y = 10; // // oprendelige y position
private int width = 120; // bredde af slider
private int height = 24; // højde af slider
private int distance = 5; // afstand mellem slidere
private int ticks = 5; // antallet af ticks på sliderne

void setup() {
  size(1280, 720); //størrelse på canvas
  noStroke(); //ingen stroke for de forskellige former
  cp5 = new ControlP5(this); // initializer cp5

  // Add title
  PFont pfont = createFont("Arial", 20, true); // danner fonten
  ControlFont font = new ControlFont(pfont, 30);
  cp5.addLabel("Belbin 9 teamroller")
    .setFont(font)
    .setValue(0)
    .setPosition(x, y)
    .setSize(width, height);
  y = y + height + distance;

  // label ved siden af der hvor brugeren kan indtaste sit navn, som siger indtast dit navn
  cp5.addLabel("Enter your name:")
    .setValue(0)
    .setPosition(x, y+8)
    .setSize(width, height);

  // text input
  nameTextfield = cp5.addTextfield("name")
    .setValue("<your name>")
    .setPosition(x+80, y)
    .setSize(width, height);
  y = y + height + distance;

  // displayer hvert spørgsmål i GetQuestions array fra the quiz klassen
  for (Question question : quiz.GetQuestions()) {
    cp5.addSlider(question.GetText())
      .setRange(0, ticks)
      .setValue(0)
      .setPosition(x, y)
      .setSize(width, height)
      .setNumberOfTickMarks(ticks)
      .showTickMarks(true)
      .snapToTickMarks(true);

    y = y + height + distance;
  }

  // viser results button
  cp5.addButton("showResults")
    .setPosition(x, y)
    .setSize(width, height)
    .setLabel("Show Results")
    //.setFont(createFont("Arial-BoldMT", 16)) // Set font and size
    .setColorBackground(color(185))
    .setColorActive(color(200));
  y = y + height + distance;

  // label for at display results
  resultsLabel = cp5.addLabel("results")
    .setValue("")
    .setPosition(x, y)
    .setSize(width, height);
  y = y + height + distance;
}


void draw() {
  background(0); // sltter baggrunds farve til 0 
}

void controlEvent(ControlEvent event) {
  if (event.isAssignableFrom(Button.class)) { // tjekker hvis at hvis kontrollen der bliver brugt et en knap
    if (event.getName().equals("showResults")) { // tjekker hvis knappen man trykker på er showResults knappen
      showResults();
    }
  }
}

void showResults() {
  test.InitializeScores(); // initializer test

  for (Question question : quiz.GetQuestions()) { // for loop for alle spørgsmål i arraylisten questions inde i quiz klassen. Denne loop finder alle spørgsmålene
    float floatScore = cp5.getController(question.GetText()).getValue(); // gemmer værdien af slidersene til det specifikke spørgsmål i float floatScore
    float score = floatScore; // man sætte float score til floatScore
    test.AddScore(question.GetRole(), score/ticks); // man adder scoren til den specfikke rolle som spørgsmålet tilhører til
  }

  Role winningRole = Role.Neutral; // siden vi arbejder med en enum, bliver vi nød at sætte winningRole lig med en værdi, så den ikke bliver tom
  float winningPercentage = 0;
  for (Role role : Role.values()) { // looper igennem de forskellige roller for hvilke værdier de har
    float percentage = test.GetPercentage(role); // gemmer den højeste procent for den rolle med mest værdi
    // hvis procenten er større end winningPercentage sætter vi winningRole til at være rollen med den høje procenten og winningPercentage til at være den nye højeste procent
    if (percentage > winningPercentage)
    {
      winningRole = role;
      winningPercentage = percentage;
    }
  }
  String final1 = "The user: " + nameTextfield.getText() + " matches " + winningRole + " with " + round(winningPercentage * 100) + "%"; // gemmer en vinder besked i string final1
  resultsLabel.setText(final1); //displayer vinder beskeden
}
