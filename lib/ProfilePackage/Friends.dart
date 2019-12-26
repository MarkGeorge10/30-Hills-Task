import 'package:flutter/material.dart';
import 'package:task_friends/Model/User.dart';

class Friends extends StatefulWidget {
  List<UserSingleton> snapshot;
  List<dynamic> list;
  Friends(this.snapshot, this.list);
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  UserSingleton operations = UserSingleton.getInstance();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //loop friend list and search by id to find them and then show its names
      itemCount: widget.list.length,
      itemBuilder: (context, i) {
        int indexUser = operations.searchById(widget.snapshot, widget.list[i]);
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
                child: Text(widget.snapshot[indexUser].fName +
                    widget.snapshot[indexUser].sName),
              ),
            ),
          ),
        );
      },
    );
  }
}
