part of 'halamandashboard_cubit.dart';

@immutable
abstract class HalamandashboardState {}

class HalamandashboardInitial extends HalamandashboardState {}

class HalamandashboardPeringatan extends HalamandashboardState {
  final String peringatan;
  HalamandashboardPeringatan({this.peringatan});
}

class HalamandashboardsetDatalogin extends HalamandashboardState {
  final Login dataLogin;
  HalamandashboardsetDatalogin({this.dataLogin});
}

class HalamandashboardberhasilKeluar extends HalamandashboardState {}
