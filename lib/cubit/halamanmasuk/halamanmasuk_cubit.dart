import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'halamanmasuk_state.dart';

class HalamanmasukCubit extends Cubit<HalamanmasukState> {
  HalamanmasukCubit() : super(HalamanmasukInitial());
}
