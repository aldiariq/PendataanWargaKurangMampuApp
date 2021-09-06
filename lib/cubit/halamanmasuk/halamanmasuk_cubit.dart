
import 'package:apppendataanwargakurangmampu/model/login_model.dart';
import 'package:apppendataanwargakurangmampu/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'halamanmasuk_state.dart';

class HalamanmasukCubit extends Cubit<HalamanmasukState> {
  
  final Repository repository;

  HalamanmasukCubit(this.repository) : super(HalamanmasukInitial());

  void prosesMasuk(String email, String password) async{
    print("PROSES MASUK CUBIT");
    if(email.isEmpty || password.isEmpty){
      emit(PeringatanMasuk(peringatan: "Pastikan Email dan Password Terisi"));
      return;
    }

    emit(ProsesMasuk());

    try{
      await repository.fungsiLogin(email, password).then((datalogin){
        if(datalogin != null && datalogin.status){
          emit(SelesaiProsesMasuk(datalogin));
        }else {
          emit(PeringatanMasuk(peringatan: "Pastikan Email dan Password Benar"));
          return;
        }
      });
    }catch(error){
      emit(PeringatanMasuk(peringatan: error.toString()));
      return;
    }
  }
}
