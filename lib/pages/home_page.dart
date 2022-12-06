import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/models/task_widget_model.dart';
import 'package:todolistapp/pages/database.dart';
import 'package:todolistapp/pages/time.dart';
import 'package:todolistapp/widgets/task_widget.dart';
bool color1 = false ; 
bool color2 = false ;
bool color3 = false ;
String type = "";

 TextEditingController whatabout=TextEditingController() ;
TextEditingController time = TextEditingController();
class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context)=>AlertDialog(
                title:const Text('Fill the form'),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('About what'),
                       SizedBox(height: 20,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: whatabout,
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('To when'),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkResponse(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) =>  Time1(whatabout: whatabout.text,)));
                          print(whatabout.text);
                        },
                        child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(Icons.calendar_month),
                              ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child:const  Text('Cancel')),
                  ],)
                  
                ],
              )
              );
      },
      child:const  Icon(Icons.add),
      ),
      appBar: AppBar(
        title:const Center(child:  Text('To do list')),
      ),    
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children:  [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('msgs').snapshots(),
              builder:  ( BuildContext context, snapshot)  { 
              if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                physics:const  NeverScrollableScrollPhysics (),
                shrinkWrap: true,
                itemBuilder: (context, index) {              
                if(snapshot.hasData && snapshot.data!.size != 0)
                  {
                    return TaskWidget(data: snapshot.data!.docs[index]["data"], date: snapshot.data!.docs[index]["date"]);
                  }
                 else {
                    return const Center(child:  Text("empty list ",style: TextStyle(color: Colors.red),));  
                  } 
                  
                  // SizedBox.shrink()
                  });// ListView.builder
              }else
              if(snapshot.hasError){
                return  const Center(child: Text("ERROR",style: TextStyle(color: Colors.red),));
              }else {
                 return const Center(child: CircularProgressIndicator());
              }
             
            })
            ],
        ),
      )),
    );
  }
}