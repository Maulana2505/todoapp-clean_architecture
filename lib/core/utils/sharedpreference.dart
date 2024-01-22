import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future setid(String id) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.setString("ids", id);
  }
  Future getid() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("ids");
  }
  Future<bool> constantId(String key)async{
    final pref = await SharedPreferences.getInstance();
    return await pref.containsKey(key);
  }

  Future deleteId() async {
    final pref = await SharedPreferences.getInstance();
    return await pref.clear();
  }
}
