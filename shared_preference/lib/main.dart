import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shared_preference.dart';
import 'models.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final  pref= SharedPreferences.getInstance();
  final usernamecontroller= TextEditingController();
  //  SingingCharacter? _character = SingingCharacter.lafayette;
        Gender? selectgender= Gender.FEMALE;
        //empty set of type language(enum)
        var selectlanguage= Set <Language> ();
        bool employed= false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:const Text('SHARED PREFERENCE'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  label:Text('User Name'),
                ),
              ),
            ),
            // RadioListTile can be used as a child of listview. For example, If we want the
            // users to choose a single option from a list of options we can use RadioListTile.
            RadioListTile<Gender>(
                title: const Text('Female'),
                value: Gender.FEMALE,
                groupValue: selectgender,
                onChanged: (newValue) =>
                    setState(() => selectgender = newValue)),
            RadioListTile<Gender>(
                title: const Text('Male'),
                value: Gender.MALE,
                groupValue: selectgender,
                onChanged: (newValue) =>
                    setState(() => selectgender = newValue)),
            RadioListTile<Gender>(
                title: const Text('Other'),
                value: Gender.OTHERS,
                groupValue: selectgender,
                onChanged: (newValue) =>
                    setState(() => selectgender = newValue)),
            CheckboxListTile(
            title: const Text("Batch"),
            //value is actually a bool var, we are comparing it value with our set,
                // if set contain that value than select it
            value: selectlanguage.contains(Language.BATCH), onChanged: (value){
              setState(() {
                selectlanguage.contains(Language.BATCH)
                    ? selectlanguage.remove(Language.BATCH)
                    :selectlanguage.add(Language.BATCH);
              });
            }),
            CheckboxListTile(title: const Text("Dart"),
                value: selectlanguage.contains(Language.Dart),
                onChanged: (value){
              setState(() {
                selectlanguage.contains(Language.Dart)
                    ? selectlanguage.remove(Language.Dart)
                    :selectlanguage.add(Language.Dart);
              });
                }),
            CheckboxListTile(title: const Text("C++"),
                value: selectlanguage.contains(Language.C), onChanged: (value){
                  setState(() {
                    selectlanguage.contains(Language.C)
                        ? selectlanguage.remove(Language.C)
                        :selectlanguage.add(Language.C);
                  });
                }),
            CheckboxListTile(title: const Text("Assembly"),
                value: selectlanguage.contains(Language.ASSEMBLY), onChanged: (value){
                  setState(() {
                    selectlanguage.contains(Language.ASSEMBLY)
                        ? selectlanguage.remove(Language.ASSEMBLY)
                        :selectlanguage.add(Language.ASSEMBLY);
                  });
                }),
            CheckboxListTile(title: const Text("Python"),
                value: selectlanguage.contains(Language.PYTHON), onChanged: (value){
                  setState(() {
                    selectlanguage.contains(Language.PYTHON)
                        ? selectlanguage.remove(Language.PYTHON)
                        :selectlanguage.add(Language.PYTHON);
                  });
                }),
            SwitchListTile(value: employed, onChanged: (bool value){
              setState(() {
                employed=value;
              });
            }),
            TextButton(onPressed: (){}, child: const Text('SAVE DATA'))

          ],
        ) ,
      ),
    );
  }
  Future <void > savedata() async{
    Settings(username: usernamecontroller.text,
        gendr: selectgender,
        lang: selectlanguage,
        employed: employed);
    print (Settings);
    pref.saveSettings(Settings);
  }
}
