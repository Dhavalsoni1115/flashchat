import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
dynamic data;
Future<dynamic> addData(String email, String password) async {
  print(email);
  print(password);

  //print(await ref.get());

  await db.collection('user').add({
    'email': email,
    'password': password,
  });
}

Future<dynamic> getData() async {
  List<dynamic> allData = [];
  QuerySnapshot querySnapshot = await db.collection('user').get();
  allData = querySnapshot.docs
      .map(
        (doc) => doc.data(),
      )
      .toList();
  //print(allData);
  return allData;
}
