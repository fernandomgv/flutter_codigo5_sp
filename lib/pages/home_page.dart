

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String aux="Iniciando...";

  Future<String> getName() async{
    return Future.delayed(Duration(seconds: 3),(){ return "Manolo robles";});
  }

 getData2(){
   getName().then((value)  {
     aux = value;
     print("ejecutando getData2");
     setState(() {
     });
   });
 }
 getData() async {
   aux =  await getName();
   setState(() {

   });
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  getData();
    this.getData2();
  }

  @override
  Widget build(BuildContext context)  {
   // this.getData2();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page SP"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text( this.aux,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
