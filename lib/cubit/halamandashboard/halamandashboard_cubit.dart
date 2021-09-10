import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:apppendataanwargakurangmampu/utils/Sharedpref.dart';

part 'halamandashboard_state.dart';

class HalamandashboardCubit extends Cubit<HalamandashboardState> {

  Sharedpref sharedpref = Sharedpref();

  HalamandashboardCubit() : super(HalamandashboardInitial());

  void clearSharedprefcubit() {
    try{
      sharedpref.clearDatalogin();
      emit(HalamandashboardberhasilKeluar());
    }catch(error){
      emit(HalamandashboardPeringatan(peringatan: "Gagal Keluar"));
    }
  }
}
