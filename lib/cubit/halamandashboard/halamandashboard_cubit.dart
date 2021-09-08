import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'halamandashboard_state.dart';

class HalamandashboardCubit extends Cubit<HalamandashboardState> {
  HalamandashboardCubit() : super(HalamandashboardInitial());
}
