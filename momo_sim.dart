// Student: Omran Nasir Abdelmoiem Mohamed
// Reg no:  28249
const String regNo = '28249';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

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
String formatRwf(int amount) {
  // by O.M
  bool negative = amount < 0;
  int n = negative ? -amount : amount;
  String digits = n.toString();
  String grouped = '';
  int i = digits.length;
  while (i > 0) {
    int start = i - 3;
    if (start < 0) start = 0;
    grouped = digits.substring(start, i) + (grouped.isEmpty ? '' : ',') + grouped;
    i = start;
  }
  return '${negative ? '-' : ''}$grouped RWF';
}

// by O.M
bool isValidPin(String pin) {
  // by O.M
  if (pin.length != 5) return false;
  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) return false;
    i++;
  }
  if (pin == '12345') return false;
  bool allSame = true;
  int j = 1;
  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      allSame = false;
      break;
    }
    j++;
  }
  if (allSame) return false;
  return true;
}

// by O.M
int sendMoney(int balance, int amount) {
  // by O.M
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  balance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(balance)}');
  return balance;
}

// by O.M
int buyAirtime(int balance, int amount) {
  // by O.M
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  balance = balance - amount;
  print('Bought ${formatRwf(amount)} airtime. New balance: ${formatRwf(balance)}');
  return balance;
}

// by O.M
void main() {
  // by O.M
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int i = 0;
  while (i < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    i++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);
  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(0)); // expected: 0 RWF
  print(formatRwf(999)); // expected: 999 RWF
  print(formatRwf(1000)); // expected: 1,000 RWF
  print(formatRwf(1250000)); // expected: 1,250,000 RWF
  print(formatRwf(-5000)); // expected: -5,000 RWF
  print(formatRwf(-0)); // expected: 0 RWF (edge: negative zero is the same int as 0)
  print(isValidPin('11111')); // expected: false
  print(isValidPin('54321')); // expected: true
  print(isValidPin('12a45')); // expected: false
  print(isValidPin(' 1234')); // expected: false (space is not a digit)
  print(isValidPin('48219')); // expected: true
}
