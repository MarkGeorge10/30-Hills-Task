import 'package:flutter/material.dart';
import 'package:task_friends/ProfilePackage/Profile.dart';

import 'Model/User.dart';
import 'network.dart';

class MyHomePage extends StatefulWidget {
  final List<UserSingleton> country;
  MyHomePage({Key key, this.country}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Network network = new Network();

class _MyHomePageState extends State<MyHomePage> {
  //Network network = new Network();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: network.parseJosn(),
          builder: (context, snapshot) {
            //List<User> countries = parseJosn(snapshot.data.toString());
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int i) {
                  print(snapshot.data.length);
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) {
                        return Profile(i);
                      }));
                    },
                    child: Card(
                        child: ListTile(
                      title: Center(
                        child: Text(
                            snapshot.data[i].fName + snapshot.data[i].sName),
                      ),
                    )),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
