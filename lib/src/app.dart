// import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import './models/image_model.dart';
import 'dart:convert';
import './widgets/image_list.dart';
// Create a class that will be our custom widget
// This class must extend the 'Stateless' widget base class

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
// Must define a 'build' method that returns the widget that this widget returns
  int counter = 0;
  List<ImageModel> images =[];
  void fetchImage() async{
    counter++;
    var response = await(get('https://jsonplaceholder.typicode.com/photos/$counter'));
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) { 
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Lets get some pics!'),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
      ),
    ));
  }
}
