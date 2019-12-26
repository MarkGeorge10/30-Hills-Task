import 'package:flutter/material.dart';
import 'package:task_friends/Model/User.dart';
import 'package:task_friends/ProfilePackage/Friends.dart';
import 'package:task_friends/ProfilePackage/FriendsOfFriends.dart';

import '../network.dart';
import 'SuggestedFriends.dart';

class Profile extends StatefulWidget {
  int index;
  Profile(this.index);
  @override
  _ProfileState createState() => _ProfileState();
}

final List<Tab> myTabs = <Tab>[
  Tab(text: 'Friends'),
  Tab(text: 'Friends Friends'),
  Tab(text: 'Suggested Friends'),
];

class _ProfileState extends State<Profile> {
  Network network = new Network();

  //Future<List<dynamic>> user;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: network.parseJosn(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //get friend list for each user
            List<dynamic> list =
                snapshot.data[widget.index].friendsList.toList();
            return DefaultTabController(
              length: myTabs.length,
              child: Scaffold(
                //Show user Name
                resizeToAvoidBottomPadding: false,
                appBar: AppBar(
                  title: Text(snapshot.data[widget.index].fName +
                      " " +
                      snapshot.data[widget.index].sName),
                  centerTitle: true,
                  bottom: TabBar(
                    tabs: myTabs,
                  ),
                ),
                body: TabBarView(
                  children: myTabs.map((Tab tab) {
                    return buildNavPage(tab.text, context, snapshot.data, list,
                        snapshot.data[widget.index].id);
                  }).toList(),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  // ignore: missing_return
  Widget buildNavPage(String text, BuildContext context, List<User> snap,
      List<dynamic> list, int ourUserID) {
    if (text == "Friends") {
      return Friends(snap, list);
    } else if (text == "Friends Friends") {
      return FriendOfFriends(
        snap,
        list,
        ourUserID,
      );
    } else {
      return SuggestedFriends(
        snap,
        list,
        ourUserID,
      );
    }
  }
}
