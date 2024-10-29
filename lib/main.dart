import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
//dart:convert is used to convert the response to json
import 'dart:convert';

import 'package:networking/MyContactDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContactDetails(),
    );
  }
}

class MyContactDetails extends StatefulWidget {
  const MyContactDetails({super.key});

  @override
  State<MyContactDetails> createState() => _MyContactDetailsState();
}

class _MyContactDetailsState extends State<MyContactDetails> {

  String url = 'https://randomuser.me/api?results=80';
  List data = [];

  Future<String> makeRequest() async {
    var response = await http.get(Uri.parse(url));
    headers:
    ({'Accept': 'application/json'});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata['results'];
    });

    print('Nombre: '+data[0]['name']['first']);
    print('Correo: '+data[0]['email']);

    //print(response.body);

    return response.body;
  }
  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contact List'),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i){
          return ListTile(
          title: Text(data[i]['name']['first']),
          subtitle: Text(data[i]['email']),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(data[i]['picture']['thumbnail']),
          ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) =>
                    MyContactDetail(data[i])
                )
              );
            },
          );
        },
      )
    );
  }
}


