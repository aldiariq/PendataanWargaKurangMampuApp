import 'package:apppendataanwargakurangmampu/model/login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:apppendataanwargakurangmampu/utils/Sharedpref.dart';

part 'halamandashboard_state.dart';

class HalamandashboardCubit extends Cubit<HalamandashboardState> {
  Sharedpref sharedpref;

  HalamandashboardCubit(this.sharedpref) : super(HalamandashboardInitial());

  void clearSharedprefcubit() {
    try {
      sharedpref.clearDatalogin();
      emit(HalamandashboardberhasilKeluar());
    } catch (error) {
      emit(HalamandashboardPeringatan(peringatan: "Gagal Keluar"));
    }
  }

  void setDatalogin() async {
    await sharedpref.getDatalogin().then((dataLoginsharedpred) {
      if (dataLoginsharedpred != null && dataLoginsharedpred.status) {
        emit(HalamandashboardsetDatalogin(dataLogin: dataLoginsharedpred));
      }
    });
  }

  Login getDatalogin() {
    sharedpref.getDatalogin().then((dataLoginsharedpred) {
      if (dataLoginsharedpred != null && dataLoginsharedpred.status) {
        Login dataLogin = dataLoginsharedpred;
        print("CUBIT");
        print(dataLogin.pesan);
        return dataLogin;
      }
    });
    return null;
  }
}
