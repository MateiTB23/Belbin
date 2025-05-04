// der dannes en public classe med navn Quiz
public class Quiz {
  private ArrayList<Question> questions; // declare en ArrayList questions af typen Question

  public Quiz () { // constructor til Quiz klassen
    this.questions = new ArrayList<Question>(); // man adder spørgsmål til arrraylisten

    AddQuestion(new Question("How good are you at finding resources?", Role.ResourceInvestigator));
    AddQuestion(new Question("How good are you at being co-operative?", Role.TeamWorker));
    AddQuestion(new Question("How well do you coordinate tasks?", Role.Coordinator));
    AddQuestion(new Question("How creative are you?", Role.Plant));
    AddQuestion(new Question("How well do you evaluate ideas?", Role.MonitorEvaluator));
    AddQuestion(new Question("How much of a specialist are you?", Role.Specialist));
    AddQuestion(new Question("How good are you at thriving through preassure?", Role.Shaper));
    AddQuestion(new Question("How practical and good at implementing stuff are you?", Role.Implementer));
    AddQuestion(new Question("How good are you at polishing and perfecting work?", Role.CompleterFinisher));
    AddQuestion(new Question("How outgoing and enthusiastic are you?", Role.ResourceInvestigator));
    AddQuestion(new Question("How perceptive and diplomatic are you?", Role.TeamWorker));
    AddQuestion(new Question("How mature and confident are you?", Role.Coordinator));
    AddQuestion(new Question("How good are you at problem solving and generating ideas?", Role.Plant));
    AddQuestion(new Question("How sober, discerning, and strategic are you?", Role.MonitorEvaluator));
    AddQuestion(new Question("How self-starting and dedicated are you with your work?", Role.Specialist));
    AddQuestion(new Question("How challenging can you be to your coworkers ideas?", Role.Shaper));
    AddQuestion(new Question("How efficient and organized are you?", Role.Implementer));
    AddQuestion(new Question("How much of a perfections are you??", Role.CompleterFinisher));
  }

  private void AddQuestion(Question question) { // tilføj et Question objekt til listen
    this.questions.add(question);
  }

  private ArrayList<Question> GetQuestions() { // return listen af questions
    return this.questions;
  }
}
