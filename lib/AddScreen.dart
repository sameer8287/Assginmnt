import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Models/Posts_models.dart';
import 'home.dart';

class AddScreen extends StatelessWidget {
  List<String> titl= [];
  List<String> decri = [];
  final title = TextEditingController();
  final descrip = TextEditingController();
  
  // List<data> lst =[
  //   data(titcontroler: title, descontroler: descrip)
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADD DETAILS'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the Title'
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: descrip,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the Description'
              ),
            ),
           SizedBox(
             height: 40,
           ),
           ElevatedButton(onPressed: (){
             titl.add(title.text);
             decri.add(descrip.text);
             Navigator.pop(context,titl+decri);

           }, child: Text("Click to add data"),
            )
          ],
        ),
      ),

    );
  }
}
class data{
   var titcontroler;
  var descontroler;
  data({required this.titcontroler,required this.descontroler});
}

