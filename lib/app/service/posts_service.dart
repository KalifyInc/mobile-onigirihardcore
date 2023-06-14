import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostsService {
  final _db = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;

  Query<Map<String, dynamic>> query() {
    final query = _db.collection('posts').orderBy('date', descending: true);
    return query;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllSnapshots() {
    final snapshots = _db.collection('posts').snapshots();
    return snapshots;
  }
}
