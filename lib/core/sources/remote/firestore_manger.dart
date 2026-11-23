import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/user_model.dart';

class FirestoreManger {
  static addUserCollection  (){
   var collection = FirebaseFirestore.instance.collection('users')
   .withConverter(
       fromFirestore: (snapshot, options) {
         var data=snapshot.data();
         return UserModel.fromFirestore(data!);

       },
       toFirestore: (user, options) {
         return user.toFirestore();

       },);
   return collection;
  }
  static adduser(UserModel user)async {
    var collection=addUserCollection();
    var doc =collection.doc(user.id);
    await doc.set(user);

  }
  static getuser(String userId)async {
    var collection = addUserCollection();
   var doc=collection.doc(userId);
   var snapshot=await doc.get();
   return snapshot.data();

  }

}