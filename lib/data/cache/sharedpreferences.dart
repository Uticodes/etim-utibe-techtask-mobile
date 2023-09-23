import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class SharedPreference extends ChangeNotifier {

  static const String launchDate = 'launchDate';

  /// clear shared preferences
  Future<void> clear() async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.clear();
  }

  /// cache LaunchDate
  saveLaunchDate(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(launchDate, id);
    notifyListeners();
  }
  /// get user LaunchDate
  Future<String> getLaunchDate() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(launchDate) ?? '';
  }

  /// remove cache user LaunchDate
  removeSaveLaunchDate() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove(launchDate);
    notifyListeners();
  }

}
