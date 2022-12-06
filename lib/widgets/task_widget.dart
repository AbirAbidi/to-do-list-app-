import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolistapp/services/service.dart';

class TaskWidget extends StatefulWidget {
final dynamic data ;
final dynamic date ;
  const TaskWidget({Key? key, required this.data,  required this.date}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
      child: SizedBox(
        height: 160,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text('Date to : ${widget.date}',style:const  TextStyle(fontSize: 18),),
            const SizedBox(height: 20,),
             Flexible(child: Text('What to do : ${widget.data}',style:const  TextStyle(fontSize: 18))),
           const SizedBox(height: 20,),
           // Text('${widget.data}',const style: TextStyle(fontSize: 15)),
          Row(children: [
            TextButton(onPressed: (() {
              showDialog(context: context, builder: (context)=>AlertDialog(
                actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:const  [
                       Text('Are you sure you want to delete this ?'),
                  ],
                ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      InkResponse(
                        onTap: () {
                          Navigator.pop(context);
                        //  Services().deletePost(uid);
                        },
                        child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child:const  Center(child:  Text('No')),
                                ),
                      ),
                              const Spacer(),
                              InkResponse(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const  Center(child: Text('Yes')),
                                ),
                              ),
                    ],
                  ),
                ],
              ));
             }), child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                Icon(Icons.done,color: Colors.green,),
                Text('Done',style: TextStyle(color: Colors.green),),
              ],
            )),
           
          ],),
         const  Divider(color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}