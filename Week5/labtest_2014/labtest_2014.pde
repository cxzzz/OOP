// Lab test 2014
// Author : Chenxi Zhang
// Date: 11/10/17

ArrayList<Expense> expense = new ArrayList<Expense>();
ArrayList<PartyExpense> partyExpense = new ArrayList<PartyExpense>();
float maxExpense = 0;
boolean exist;

void loadExpenses() {
  //int j = 0;
  Table table = loadTable("expenses.txt", "header, tsv");
  // load a row
  for (TableRow r : table.rows()) {
      // exist default to false since doesnt know does it exist or not
      exist = false;    
      // create instances of object
      Expense ex = new Expense(r);
      // check if party name exist
      for (PartyExpense p : partyExpense) {
        if (ex.party.equals(p.partyName)) {
          exist = true; 
          p.total += ex.total;
          break;
        }
      }
      
      // if doesn't exist in list, add in list
        if (!exist) {
          PartyExpense pEx = new PartyExpense();        
          pEx.partyName = ex.party;
          pEx.total = ex.total;
          // assign random color to PartyExpense
          pEx.colour = color(random(0, 255), random(0, 255), random(0, 255));        
          partyExpense.add(pEx);
      }
      
      // add it into the expenses arraylist
      expense.add(ex);
      
      // find max expense for graphing
      if (ex.total > maxExpense) {
        maxExpense = ex.total; 
      }
  }
}
void printExpense() {
 for (Expense e : expense) {
   println(e);
 }
 
 for (PartyExpense p : partyExpense) {
   println(p);  
 }
}
  

void drawExpenseBars() {  
  // position
  float x;
  float h;
  // draw graph
  for (int i = 0; i < expense.size(); i ++) {
    Expense e = expense.get(i);
    x = map(i, 0, expense.size(), 0, width);
    h = map(e.total, 0, maxExpense, 0, -height);
    stroke(e.colour);
    fill(e.colour);
    rect(x, height, width / expense.size(), h);
  }
}

void drawPartyExpenseBars() {
  // positions
  float x;
  float h;
  
  // find max party expense
  float maxPartyExpense = 0;
  for (PartyExpense p : partyExpense) {
    if (p.total > maxPartyExpense) {
      maxPartyExpense = p.total;  
    }
  }
  // draw graph
  for (int i = 0; i < partyExpense.size(); i++) {
    PartyExpense p = partyExpense.get(i);
    x = map(i, 0, partyExpense.size(), 0, width);
    h = map(p.total, 0, maxPartyExpense, 0, -height);
    // write party names on screen
    fill(p.colour);
    stroke(p.colour);
    // plot rectangle
    rect(x, height, width / partyExpense.size(), h);
    fill(255);
    // print party name to screen
    textAlign(CENTER, CENTER);
    text(p.partyName, x + width / partyExpense.size() / 2, height - 35);
  }
}


void setup() {
  size(700, 700);
  exist = false;
  loadExpenses();
  printExpense();
}

void draw() {
  background(0);
  
  if (keyPressed) {
    if(key == '0') {
      drawExpenseBars();    
    }
    
    if(key == '1') {
      drawPartyExpenseBars();  
    }
  }
}