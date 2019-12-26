import 'package:flutter/material.dart';
import 'package:task_friends/Model/Operations.dart';
import 'package:task_friends/Model/User.dart';

class FriendOfFriends extends StatefulWidget {
  List<User> snapshot;
  List<dynamic> list;
  int ourUserID;
  FriendOfFriends(this.snapshot, this.list, this.ourUserID);
  @override
  _FriendOfFriendsState createState() => _FriendOfFriendsState();
}

class _FriendOfFriendsState extends State<FriendOfFriends> {
  SingletonOperations operations = SingletonOperations.getInstance();
  List<int> indexUser = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexUser = operations.find_Friends_Friends(
        widget.snapshot, widget.list, widget.ourUserID);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //loop friend list and search by id to find them and then show its names
      itemCount: indexUser.length,
      itemBuilder: (context, i) {
        print(indexUser);
        return InkWell(
//                    onTap: () {
//                      Navigator.push(context,
//                          new MaterialPageRoute(builder: (context) {
//                        return Profile(i);
//                      }));
//                    },
          child: Card(
            child: ListTile(
              title: Center(
                child: indexUser == -1
                    ? Text("")
                    : Text(widget.snapshot[indexUser[i]].fName +
                        widget.snapshot[indexUser[i]].sName),
              ),
            ),
          ),
        );
      },
    );
  }
}
