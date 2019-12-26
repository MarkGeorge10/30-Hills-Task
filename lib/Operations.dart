import 'Model/User.dart';

class Operations {
  // ignore: non_constant_identifier_names, missing_return
  int searchById(List<User> user, int id) {
    for (int i = 0; i < user.length; i++) {
      if (user[i].id == id) {
        // return user index in main user list
        return i;
      }
    }
  }

  // ignore: non_constant_identifier_names, missing_return
  List<int> find_Friends_Friends(
      List<User> user, List<dynamic> friends, int userID) {
    List<int> idx = new List();

    // loop on friends list in certain user then take each id in this list and get this user friends list
    for (int i = 0; i < friends.length; i++) {
      int indexUser = searchById(user, friends[i]);
      //list of my friends
      List<dynamic> list = user[indexUser].friendsList.toList();

      for (int j = 0; j < list.length; j++) {
        //print(11111 + list[j]);
        int friendsFriendsIndex = searchById(user, list[j]);

        if (!idx.contains(friendsFriendsIndex)) {
          idx.add(friendsFriendsIndex);
        }
      }

      for (int j = 0; j < idx.length; j++) {
        if (userID == user[idx[j]].id) {
          idx.removeAt(j);
        }
      }
    }
    return idx;
  }

  List<int> suggestFriends(List<User> user, List<dynamic> friends, int userID) {
    List<int> suggestId = new List();
    // return back user indexes of friend of friends
    List<int> friendFriends = find_Friends_Friends(user, friends, userID);

    List<int> test = new List();
    // then loop on this list of indexes and return back user by using index & get friend list data for each user
    for (int i = 0; i < friendFriends.length; i++) {
      //friendFriends[i] means each user index that point on friends of friends
      // ex: user id 1 has user id 2 (1 -> 2 -> 3) I get index of user id 3 which is index (2)
      // user[friendFriends[i]] return user by using index then I need its friend list
      // so user[friendFriends[i]].friendsList
      for (int z = 0; z < user[friendFriends[i]].friendsList.length; z++) {
        if (!suggestId.contains(user[friendFriends[i]].friendsList[z])) {
          suggestId.add(user[friendFriends[i]].friendsList[z]);
        }
      }
      //listIDs.add(.toList());
    }
    //copy listIDS<dynamic> into list from type int test<int>
    for (int i = 0; i < suggestId.length; i++) {
      int indexUser;
      //I shouldn't show same user & its friends & its friend of friends
      // check on same user and its friends
      if (!friends.contains(suggestId[i]) && suggestId[i] != userID) {
        indexUser = searchById(user, suggestId[i]);
        if (!test.contains(indexUser)) {
          test.add(indexUser);
        }
      }
      // check on  friend of friends in suggested list and remove it if I found it
      for (int j = 0; j < friendFriends.length; j++) {
        if (indexUser == friendFriends[j]) {
          test.remove(indexUser);
        }
      }

      //listIDs.clear();
    }

    return test;
  }
}
