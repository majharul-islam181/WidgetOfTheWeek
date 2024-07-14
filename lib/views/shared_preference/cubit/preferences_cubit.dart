import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit() : super(PreferencesInitial());

  Future<void> isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String name = sharedPreferences.getString('Name') ?? '';
    emit(PreferencesLoaded(name: name));
  }

  Future<void> updateName(String newName) async {
   SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('Name', newName);
    emit(PreferencesLoaded(name: newName));
  }
}
