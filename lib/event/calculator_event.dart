abstract class CalculatorEvent {
  final String angka1;
  final String angka2;

  CalculatorEvent(this.angka1, this.angka2);
}

class TambahEvent extends CalculatorEvent {
  TambahEvent(super.angka1, super.angka2);
}

class KurangEvent extends CalculatorEvent {
  KurangEvent(super.angka1, super.angka2);
}

class KaliEvent extends CalculatorEvent {
  KaliEvent(super.angka1, super.angka2);
}

class BagiEvent extends CalculatorEvent {
  BagiEvent(super.angka1, super.angka2);
}
class ResetEvent extends CalculatorEvent {
  ResetEvent() : super('0', '0');
}

