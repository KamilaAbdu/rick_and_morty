import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/service/shared_prefs.dart';

void setup({required GetIt di}) {
  di.registerSingleton(SharedPrefs());
}
