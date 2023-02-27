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
  List<dynamic> userId = [];
  List<dynamic> allData = [];
  QuerySnapshot querySnapshot = await db.collection('user').get();
  userId = querySnapshot.docs.map((e) => e.id).toList();
  allData = querySnapshot.docs.map((doc) {
    dynamic data = doc.data();
    return {"id": doc.id, ...data};
  }).toList();
  print(userId);
  print(allData);
  return allData;
}

Future<dynamic> addMessage(
  dynamic participant1Id,
  dynamic participant1Name,
  dynamic participant2Id,
  dynamic participant2Name,
  List<Map> message,
) async {
  await db.collection('message').add({
    'participant1Id': participant1Id,
    'participant1Name': participant1Name,
    'participant2Id': participant2Id,
    'participant2Name': participant2Name,
    'message': message,
  });
}
