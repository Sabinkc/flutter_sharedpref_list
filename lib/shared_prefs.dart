import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  List<String> items = [];
  String listKey = "_listKey";

  Future saveListData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(listKey, items);
  }

  Future getListData() async {
    final prefs = await SharedPreferences.getInstance();
    // this items is a local variable not a class items as it is initialized using final in this function, two items variable are different and the class items is not updated with the local variable value so it wont update the list value
    // shared preference doesnot store null value in list, as null list can cause lots of error so list must be checked not to be null
    //  final items = await prefs.getStringList(listKey);
    final loadedItems = await prefs.getStringList(listKey);
    if (loadedItems != null) {
      items = loadedItems;
    }
  }
}
