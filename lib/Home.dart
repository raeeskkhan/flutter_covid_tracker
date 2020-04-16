import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'model/json_data_covid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CovidWorldWide> data;

  @override
  void initState() {
    super.initState();
    Network network = Network(url: "https://covid19api.herokuapp.com/");
    data = network.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 TRACKER"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<CovidWorldWide> snapshot) {
              if (snapshot.hasData) {
                Latest dataReceived = snapshot.data.latest;
                return createFaceView(dataReceived, context);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget createFaceView(Latest allData, BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Divider(
            height: 10.0,
          ),
          Text(
            "CURRENT STATISTICS",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Divider(
            height: 10.0,
          ),
          ListTile(
            title: Text(
              "Confirmed Cases:",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "${allData.confirmed}",
              style: TextStyle(
                fontSize: 17.5,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            height: 5.0,
          ),
          ListTile(
            title: Text(
              "Deaths:",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "${allData.deaths}",
              style: TextStyle(
                fontSize: 17.5,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            height: 5.0,
          ),
          ListTile(
            title: Text(
              "Recovered:",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "${allData.recovered}",
              style: TextStyle(
                fontSize: 17.5,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Network {
  final String url;

  Network({this.url});

  Future<CovidWorldWide> loadPosts() async {
    final response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      print(response.statusCode);
      return CovidWorldWide.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to get Data");
    }
  }
}
