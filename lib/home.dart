


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_database_sqflite/SQL_helper.dart';

class Home extends StatefulWidget{

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleText=TextEditingController();

  List<Map<String,dynamic>> journals=[];

  bool isLoading=true;

  Future<void> refreshJournal() async {
    final data=await SQLHelper.getItems();
    setState(() {
      journals=data;
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("kfkdjnvf"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Container(child: Text("Title : ")),

            // TextFormField(
            //
            //   controller: titleText,
            //
            // ),


            Text("Detail : "),

            // TextFormField(
            //
            //   controller: titleText,
            //
            // ),


            TextButton(
              onPressed: () {

                SQLHelper.createItem("title", "description");
                refreshJournal();
              },
              child: Text("Add Data"),
            ),



            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: journals.length,
                itemBuilder: (context, index){
              return ListTile(
                title: Text("Data"),
              );
            })









          ],
        ),
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshJournal();
    print("length----------${journals.length}");
  }


}