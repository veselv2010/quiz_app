import 'package:appfox_test_app/core/domain/models/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository {
  final storage = FirebaseFirestore.instance
      .collection('results')
      .withConverter(
          fromFirestore: (snaps, _) => Result.fromJson(snaps.data()!),
          toFirestore: (result, _) => result.toJson());

  Future<String> sendResults(Result result) async {
    final res = await storage.add(result);
    return res.id;
  }

  Future<Result?> getResult(String id) async {
    final res = await storage.doc(id).get();
    return res.data();
  }
}
