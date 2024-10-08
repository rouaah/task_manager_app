import 'package:easy_localization/easy_localization.dart';
import 'package:task_manager_app/core/helpers/enums.dart';
import 'package:task_manager_app/core/routes/barrel.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit({required this.preferencesBox}) : super(PreferencesInitial());
  final PreferencesBox preferencesBox;
  void changeLanguage(BuildContext context, EnumLanguage newLanguage) async {
    await context.setLocale(Locale(newLanguage.name));

    preferencesBox.setLanguage(EnumLanguage.values.byName(newLanguage.name).index);
  }

  String? getLanguageName() {
    switch (preferencesBox.getLanguageCode()) {
      case 1:
        return 'en';
      case 2:
        return 'fr';
      case 3:
        return 'ar';
      default:
        return 'en';
    }
  }
}
