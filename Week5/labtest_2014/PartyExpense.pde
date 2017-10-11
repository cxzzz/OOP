public class PartyExpense {
  String partyName;
  float total;
  color colour;
  
  PartyExpense() {
    colour = color(random(0, 255), random(0, 255), random(0, 255));  
  }
  
  String toString() {
    return "Party name: " + partyName + " total: " + total;  
  }
}