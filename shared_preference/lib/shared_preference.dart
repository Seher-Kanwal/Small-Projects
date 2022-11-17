import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';
class sharedprefernce{
  //we create a fn which accept an argument type Settings
  Future <void> saveSettings(Settings settings) async {
    //as it takes time so we have to deal it with async approach, run it in the background
    final preferance= await SharedPreferences.getInstance();
    //as for employed we use bool so for saving values we'll also use set bool and for name we use string
    await preferance.setBool('employed', settings.employed);
    await preferance.setString('name', settings.username);
    //enum value can be converted to indexes starting from zero
    await preferance.setInt('gender', settings.gendr!.index);
    //set data type cant work with five given data type of shared preference
    //as we use checkbox, we have multiple options, so for this we first convert of enum into indexes
    // and then move to change into strings, so that we can get a list of values
    await preferance.setStringList('programming languages', settings.lang.map((e) => e.index.toString()).toList());
    print('saved settingss');
  }
}