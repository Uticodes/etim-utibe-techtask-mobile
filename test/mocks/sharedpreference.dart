import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_task/data/cache/sharedpreferences.dart';

class MockSharedPreferences extends Mock implements SharedPreference {

  static const String launchDate = 'launchDate';

  Map<String, dynamic> _prefs = {};


  dynamic getAll(String key) {
    return _prefs[key];
  }

  Future<bool> setString(String key, String value) async {
    _prefs[key] = value;
    return true;
  }

  /// clear shared preferences
  @override
  Future<void> clear() async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.clear();
  }

  /// cache LaunchDate
  @override
  saveLaunchDate(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(launchDate, id);
    notifyListeners();
  }
  /// get user LaunchDate
  @override
  Future<String> getLaunchDate() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(launchDate) ?? '';
  }

  /// remove cache user LaunchDate
  @override
  removeSaveLaunchDate() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove(launchDate);
    notifyListeners();
  }
}