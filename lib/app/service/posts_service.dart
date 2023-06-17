import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostsService {
  final _db = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;
  Query<Map<String, dynamic>> query() {
    final query = _db.collection('posts');
    return query;
  }

  Query<Map<String, dynamic>> queryOrderByDate() {
    final query = _db.collection('posts').orderBy('date', descending: true);
    return query;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllSnapshots() {
    final snapshots = queryOrderByDate().snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFirstsSnapshots() {
    final snapshots = queryOrderByDate().limit(15).snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMoviesSnapshots() {
    final snapshots =
        query().where('categories', isEqualTo: 'Movies').snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllAnimesSnapshots() {
    final snapshots =
        query().where('categories', isEqualTo: 'Animes').snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllGamesSnapshots() {
    final snapshots =
        query().where('categories', isEqualTo: 'Games').snapshots();
    return snapshots;
  }
}
