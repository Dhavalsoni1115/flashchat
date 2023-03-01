import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
Future<dynamic> addData(String name, String email, String password) async {
  await db.collection('user').add({
    'name': name,
    'email': email,
    'password': password,
  });
}

Future<dynamic> getData() async {
  //List<dynamic> userId = [];
  List<dynamic> allData = [];
  QuerySnapshot querySnapshot = await db.collection('user').get();
  //userId = querySnapshot.docs.map((e) => e.id).toList();
  allData = querySnapshot.docs.map((doc) {
    dynamic data = doc.data();
    return {"id": doc.id, ...data};
  }).toList();
  // print(userId);
  // print(allData);
  return allData;
}

Future<dynamic> addMessage(
    {dynamic participant1Id,
    dynamic participant1Name,
    dynamic participant2Id,
    dynamic participant2Name,
    dynamic id,
    required List<Map> message}) async {
  await db.collection('chats').doc(id).set({
    'participant1Id': participant1Id,
    'participant1Name': participant1Name,
    'participant2Id': participant2Id,
    'participant2Name': participant2Name,
    'message': message,
  });
}

Future<dynamic> getMessage() async {
  dynamic chatsData;
  QuerySnapshot querySnapshot = await db.collection('chats').get();
  chatsData = querySnapshot.docs.map((doc) {
    dynamic data = doc.data();
    //dynamic data1 = doc.get(generateId);
    return {'id': doc.id, ...data};
  }).toList();
  //print(chatsData);
  return chatsData;
}

// Future<dynamic> updateMessage(
//   List<Map> message,
// ) async {
//   await db.collection('chats').doc('5555555555').set({'message': message});
// }

