import 'package:apppendataanwargakurangmampu/model/login_model.dart';
import 'package:apppendataanwargakurangmampu/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:apppendataanwargakurangmampu/utils/Sharedpref.dart';

part 'halamanmasuk_state.dart';

class HalamanmasukCubit extends Cubit<HalamanmasukState> {
  final Repository repository;
  final Sharedpref sharedpref;

  HalamanmasukCubit(this.repository, this.sharedpref)
      : super(HalamanmasukInitial());

  void prosesMasuk(String email, String password) async {
    print("PROSES MASUK CUBIT");
    if (email.isEmpty || password.isEmpty) {
      emit(PeringatanMasuk(peringatan: "Pastikan Email dan Password Terisi"));
      return;
    }

    emit(ProsesMasuk());

    try {
      await repository.fungsiLogin(email, password).then((datalogin) {
        if (datalogin != null && datalogin.status) {
          emit(SelesaiProsesMasuk(datalogin));
        } else {
          emit(
              PeringatanMasuk(peringatan: "Pastikan Email dan Password Benar"));
          return;
        }
      });
    } catch (error) {
      emit(PeringatanMasuk(peringatan: error.toString()));
      return;
    }
  }

  bool getDatalogin() {
    sharedpref.getDatalogin().then((dataLoginsharedpred) {
      if (dataLoginsharedpred != null && dataLoginsharedpred.status) {
        return true;
      }
    });
    return false;
  }

  void setDatalogin(Login dataLogin) {
    sharedpref.setDatalogin(dataLogin);
  }
}
