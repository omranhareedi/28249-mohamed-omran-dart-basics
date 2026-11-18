// Student: Omran Nasir Abdelmoiem Mohamed
// Reg no:  28249
const String regNo = '28249';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

const String fullName = 'Omran Nasir Abdelmoiem Mohamed';

// by O.M
int countVowels(String text) {
  // by O.M
  String lower = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
    i++;
  }
  return count;
}

// by O.M
String initials(String fullName) {
  // by O.M
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';
  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < parts.length) {
    result += parts[i][0].toUpperCase() + '.';
    i++;
  }
  return result;
}

// by O.M
void drawTriangle(int height) {
  // by O.M
  int row = 1;
  while (row <= height) {
    int spaces = height - row;
    String line = '';
    int s = 0;
    while (s < spaces) {
      line += ' ';
      s++;
    }
    String symbol = row.isOdd ? '*' : '#';
    int c = 0;
    while (c < row) {
      line += symbol;
      c++;
    }
    print(line);
    row++;
  }
}

// by O.M
int momoFee(int amount) {
  // by O.M
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by O.M
String maskPhone(String phone) {
  // by O.M
  if (phone.length != 10) return 'INVALID';
  String result = phone.substring(0, 3);
  int i = 3;
  while (i < 8) {
    result += '*';
    i++;
  }
  result += phone.substring(8, 10);
  return result;
}

// by O.M
void main() {
  // by O.M
  print('Reg no: $regNo | D = $d | T = $t');

  print('$fullName has ${countVowels(fullName)} vowels');
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}
