import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'halamangantipassword_state.dart';

class HalamangantipasswordCubit extends Cubit<HalamangantipasswordState> {
  HalamangantipasswordCubit() : super(HalamangantipasswordInitial());
}
