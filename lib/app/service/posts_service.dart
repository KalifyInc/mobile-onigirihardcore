import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostsService {
  final _db = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;

  Query<Map<String, dynamic>> query() {
    final query = _db.collection('posts').orderBy('date', descending: true);
    return query;
  }

  Query<Map<String, dynamic>> queryAnimes() {
    final queryAnimes = query().where('categories', isEqualTo: 'Animes');
    return queryAnimes;
  }

  Query<Map<String, dynamic>> queryMovies() {
    final queryMovies = query().where('categories', isEqualTo: 'Movies');
    return queryMovies;
  }

  Query<Map<String, dynamic>> queryGames() {
    final queryGames = query().where('categories', isEqualTo: 'Games');
    return queryGames;
  }

  Query<Map<String, dynamic>> queryTechnologies() {
    final queryTechnologies =
        query().where('categories', isEqualTo: 'Technologies');
    return queryTechnologies;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllSnapshots() {
    final snapshots = query().snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFirstsSnapshots() {
    final snapshots = query().limit(15).snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMoviesSnapshots() {
    final snapshots = queryMovies().snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllAnimesSnapshots() {
    final snapshots = queryAnimes().snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllGamesSnapshots() {
    final snapshots = queryGames().snapshots();
    return snapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllTechnologiesSnapshots() {
    final snapshots = queryTechnologies().snapshots();
    return snapshots;
  }
}
