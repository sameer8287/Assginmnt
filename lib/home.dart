import 'package:flutter/material.dart';
import 'AddScreen.dart';
import 'package:http/http.dart' as http;
import 'package:assginmnt/Models/Posts_models.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  List<PostsModels> postList =[];
  List<PostsModels> finalList =[];
  Future<List<PostsModels>> apicall() async
  {
    http.Response response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode ==200)
    {
      var data = jsonDecode(response.body.toString());
      for(Map i in data)
      {
        postList.add(PostsModels.fromJson(i));
      }
      return postList;

    }
    else
    {
      return postList;
    }
  }

  void initState()
  {
    getupdate();
  }

  void getupdate() async
  {
    setState(() async{
      postList = await List.from(finalList);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu,
          color: Colors.black,),
          onPressed: (){

          },
          ),
        title: Text('JSON DATA',
          style: TextStyle(
            color: Colors.black
          ) ,),
        centerTitle: true,
        backgroundColor: Colors.white,
        ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: apicall(),
              builder: (context,snapshot)
              {
                if(!snapshot.hasData)
                  {
                    return Text('Loading');
                  }
                else
                  {
                    return ListView.builder(
                        itemCount: postList.length ,
                        itemBuilder: (context,index){
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title\n',style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text(postList[index].title.toString()),
                                  Text('\nDescription\n',style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text(postList[index].body.toString()),
                                  ElevatedButton.icon(
                                      onPressed: (){
                                        setState(() {
                                          postList.removeAt(index);
                                        });

                                      },
                                      icon: Icon(Icons.delete),
                                      label: Text('Delete'))
                                ],
                              ),
                            ),

                          );
                    });
                  }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var data = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
          setState(() {
            // postList.add(PostsModels(userId: 2, id: 3, title: data[0].toString(), body: data[1].toString()));
            postList.insert(0, PostsModels(title: data[0].toString(), body: data[1].toString()));
            finalList = List.from(postList);
          });



        },

        child: Icon(
          Icons.add
        ),
      ),
      );
  }
}
