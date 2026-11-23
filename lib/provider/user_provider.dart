import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:paw_care/core/sources/remote/firestore_manger.dart';

import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
 UserModel ?user;
  getUser ()async{
    user=await FirestoreManger.getuser(FirebaseAuth.instance.currentUser!.uid);
    notifyListeners();
  }

}