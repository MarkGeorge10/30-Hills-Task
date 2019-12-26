import 'package:flutter/material.dart';
import 'package:task_friends/Model/User.dart';

// ignore: must_be_immutable
class SuggestedFriends extends StatefulWidget {
  List<UserSingleton> snapshot;
  UserSingleton user;
  List<dynamic> list;
  int ourUserID;
  SuggestedFriends(this.snapshot, this.list, this.ourUserID);
  @override
  _SuggestedFriendsState createState() => _SuggestedFriendsState();
}

class _SuggestedFriendsState extends State<SuggestedFriends> {
  UserSingleton operations = UserSingleton.getInstance();
  List<int> indexUser = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexUser = operations.suggestFriends(
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
