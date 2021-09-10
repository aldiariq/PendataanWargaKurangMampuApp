part of 'halamanmasuk_cubit.dart';

@immutable
abstract class HalamanmasukState {}

class HalamanmasukInitial extends HalamanmasukState {}

class PeringatanMasuk extends HalamanmasukState {
  final String peringatan;
  PeringatanMasuk({this.peringatan});
}

class ProsesMasuk extends HalamanmasukState {}

class SelesaiProsesMasuk extends HalamanmasukState {
  final Login dataLogin;
  SelesaiProsesMasuk(this.dataLogin);
}

class SelesaiProsesMasukSharedpred extends HalamanmasukState {}
