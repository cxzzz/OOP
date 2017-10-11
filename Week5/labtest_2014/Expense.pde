public class Expense {
  String name;
  String party;
  String city;
  float amountRet;
  float amountClaim;
  float total;
  color colour;
  
  Expense(TableRow row) {
    name = row.getString("Adams, Gerry");
    party = row.getString("SF");
    city = row.getString("Louth");
    amountRet = row.getFloat("0.00");
    amountClaim = row.getFloat("48643.52");
    total = amountClaim - amountRet;
    colour = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  String toString() {
    return "Name: " +name + " Party: " + party + " City: " + city + " amount returned: " + amountRet + " amount claimed: " + amountClaim + " total: " + total;  
  }
}