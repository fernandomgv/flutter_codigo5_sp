import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sp/pages/profile_page.dart';
import 'package:flutter_codigo5_sp/utiles/sp_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
 // const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String aux = "Iniciando...";

  TextEditingController tcname = TextEditingController();
  TextEditingController tcaddres = TextEditingController();
  bool drakMode = false;
  int gender = 1;

  SPGlobal prefs = SPGlobal();

  Future<String> getName() async {
    return Future.delayed(Duration(seconds: 3), () {
      return "Manolo robles";
    });
  }

  Future<List<String>> getProducts() async {
    print("Estoy en getPrudcts");
    return Future.delayed(Duration(seconds: 3), () {
      return ["Corbatas", "Camisas", "Polos", "Sacos"];
    });
  }

  getData2() {
    getName().then((value) {
      aux = value;
      print("ejecutando getData2");
      setState(() {});
    });
  }

  getData() async {
    aux = await getName();
    setState(() {});
  }

  _getDataFull() async{
    //SharedPreferences prefsx = await SharedPreferences.getInstance();
    //print(prefs.getString("name"));
    this.tcname.text = prefs.fullName;
    this.tcaddres.text = prefs.adress;
    this.drakMode = prefs.darkMode;
    this.gender = prefs.gender;
    setState(() {

    });
    print(this.drakMode);
    print(gender);

  }
  _saveData() async{
   // SharedPreferences prefsx = await SharedPreferences.getInstance();
   // prefs.setString("name", this.tcname.text);
    prefs.fullName = this.tcname.text;
    prefs.adress = this.tcaddres.text;
    prefs.darkMode = this.drakMode;
    prefs.gender = this.gender;

    print("Guardando....");

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

// FutureBuilder()


  @override
  Widget build(BuildContext context) {
    // this.getData2();
    print("ya estoy en el build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page SP"),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/images/fmogollon.jpg'),
                    ),
                    Text(
                      "Fernando Mogollón",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "Administrador",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(

                  //color: Colors.pinkAccent,
                  image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/1545505/pexels-photo-1545505.jpeg?auto=compress&cs=tinysrgb&w=600"),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text("My Profile"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.file_copy,
              ),
              title: Text("Portfolio"),

            ),
            ListTile(
              leading: Icon(
                Icons.lock,
              ),
              title: Text("Change Password"),
            ),
            Divider(
              thickness: 0.6,
              indent: 12,
              endIndent: 12,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff424242),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: this.tcname,
                decoration: InputDecoration(hintText: "Full name"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: this.tcaddres,
                decoration: InputDecoration(hintText: "Address"),
              ),
              const SizedBox(
                height: 10,
              ),
              SwitchListTile(
                 title: Text("Dark Mode"),
                  value: this.drakMode,
                  onChanged: ( bool value){
                   this.drakMode = value;
                   setState(() {

                   });
                  }
              ),
              const SizedBox(
                height: 10,
              ),
          Text("Gender"),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                title: Text("Male"),
                  value: 1,
                  groupValue: this.gender,
                  onChanged: (int? value){
                  this.gender = value!;
                  print( this.gender );
                  setState(() {

                  });
                  }
                  ),
              RadioListTile(
                  title: Text("Female"),
                  value: 2,
                  groupValue: this.gender,
                  onChanged: (int? value){
                    this.gender = value!;
                    print( this.gender );
                    setState(() {

                    });
                  }
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child:
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                          onPressed: () {
                          this._saveData();
                          },
                          child: Text("Save data")
                      )
              )
            ],
          ),
        ),
      ),

      /*
      FutureBuilder(
       */
      //future: getName(),
      // future: getProducts(),
      /*
        builder: (BuildContext contex, AsyncSnapshot snapshot){
          print(snapshot.connectionState);
          print(snapshot.hasData);
          print(snapshot.data);
          if (snapshot.hasData) {
            List<String> aux = snapshot.data;
            /*
            return Center(
              child: ListView.builder(
                itemCount: aux.length,
                itemBuilder: (BuildContext context, int index){
                  return Text(aux[index]);
                },
              ),
            );
            */
            return ElevatedButton(onPressed: (){
              setState(() {

              });
            }, child: Text("Clic"));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
        */
    );
  }
}
