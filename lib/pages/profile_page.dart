

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utiles/sp_global.dart';

class ProfilePage extends StatefulWidget {
  //const ProfilePage({Key? key}) : super(key: key);



  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String name="";
  String adress="";
  bool drakMode = false;
  int gender = 1;
  Color bgcDMOn = Colors.black;
  Color fcDMOn = Colors.white;
  SPGlobal prefs = SPGlobal();

  _getDataFull() async{
   // SharedPreferences prefs = await SharedPreferences.getInstance();
    //print(prefs.getString("name"));
    this.name = prefs.fullName;
    this.adress = prefs.adress;
    this.drakMode = prefs.darkMode;
    this.gender = prefs.gender;
    setState(() {

    });
    print(this.drakMode);
    print(gender);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  getData();
    //  this.getData2();
    this._getDataFull();
    print("en init, ya se ejecuto _getDataFull");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: this.drakMode ? Colors.black : Colors.pinkAccent,
        title: Text("Page profile"),
      ),
      body: SafeArea(
        child: Container(
          color: this.drakMode ? Colors.black : Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(this.name,
                  style: TextStyle(
                    color: this.drakMode? fcDMOn : Colors.black
                  ) ),
                  subtitle: Text("User Name",
                      style: TextStyle(
                          color: this.drakMode? fcDMOn : Colors.black
                      )),
                  leading:  Icon(Icons.person,
                          color: this.drakMode? fcDMOn : Colors.black
                      ),
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: Text(this.adress,
                      style: TextStyle(
                          color: this.drakMode? fcDMOn : Colors.black
                      )),
                  subtitle: Text("Address",
                      style: TextStyle(
                          color: this.drakMode? fcDMOn : Colors.black
                      )),
                  leading:  Icon(Icons.location_on,
                      color: this.drakMode? fcDMOn : Colors.black),
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: Text(this.drakMode ? "On" : "Off",
                      style: TextStyle(
                          color: this.drakMode? fcDMOn : Colors.black
                      )),
                  subtitle: Text("Dark Mode",
                      style: TextStyle(
                          color: this.drakMode? fcDMOn : Colors.black
                      )),
                  leading:  Icon(Icons.dark_mode,
                      color: this.drakMode? fcDMOn : Colors.black),
                ),
                const SizedBox(height: 10,),
                ListTile(
                  title: Text(this.gender== 1 ? "Male" : "Female",
                      style: TextStyle(
                          color: this.drakMode? fcDMOn : Colors.black
                      )),
                  subtitle: Text("Gender",
                      style: TextStyle(
                          color: this.drakMode? fcDMOn : Colors.black
                      )),
                  leading:  Icon(this.gender== 1 ? Icons.male : Icons.female,
                      color: this.drakMode? fcDMOn : Colors.black),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
