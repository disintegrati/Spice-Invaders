class Funzionalita {
  String nome;
  String functionality;

  PVector location;
  PVector dimen;

  PFont nomeFont;
  PFont funzFont;

  TestiFunzionalita testi;

  Funzionalita() {
    nome = "Manuale per ristrutturare casa";
    functionality = "Questo manuale per ristrutturare casa vi insegnerà il giusto approccio a tale impresa, i trucchi per farlo senza impazzire, il modo per risparmiare soldi e come strangolare la suocera se si impiccia troppo. Si raccomanda di prestare attenzione alla normativa vigente perché, come sempre accade in Italia, se stai facendo qualcosa senza pagare una tassa, è probabile che ti arriverà presto una multa. Tenete comunque a portata di mano del contante: tornerà utile durante le verifiche dei vigili urbani, dei beni culturali, della forestale, dei pompieri, dei carabinieri, della polizia e dell'Autorità portuale, anche se la vostra abitazione è a Bolzano.";

    location = new PVector(0, 0);
    dimen = new PVector(400, 200);

    testi = new TestiFunzionalita(location.x, location.y, dimen.x, dimen.y, 24, nome + "\n" + functionality);
  }

  void display(PVector loc) {
    location = loc;

    pushMatrix();
    translate(location.x, location.y);
    fill(0);
    stroke(#06171e);
    strokeWeight(3);
    rectMode(CORNER);
    rect(0, 0, dimen.x, dimen.y);
    testi.scroll();
    testi.display(location);
    popMatrix();
  }

  void move(int my, int pmy) {
    testi.update(my, pmy);
  }
}
