part of 'halamandashboard_cubit.dart';

@immutable
abstract class HalamandashboardState {}

class HalamandashboardInitial extends HalamandashboardState {}

class HalamandashboardPeringatan extends HalamandashboardState{
  final String peringatan;
  HalamandashboardPeringatan({this.peringatan});
}

class HalamandashboardberhasilKeluar extends HalamandashboardState{}