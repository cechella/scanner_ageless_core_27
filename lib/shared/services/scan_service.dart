import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/scan_result_model.dart';

class ScanService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collection = 'scan_results';

  /// Salva um resultado de escaneamento
  Future<void> saveScanResult(ScanResult result) async {
    await _db.collection(collection).add(result.toMap());
  }

  /// Consulta os últimos resultados de um usuário específico
  Future<List<ScanResult>> getUserScanResults(String uid) async {
    final snapshot = await _db
        .collection(collection)
        .where('uid', isEqualTo: uid)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => ScanResult.fromMap(doc.data()))
        .toList();
  }

  /// Consulta um resultado específico por ID (se necessário futuramente)
  Future<ScanResult?> getScanById(String id) async {
    final doc = await _db.collection(collection).doc(id).get();
    if (doc.exists) {
      return ScanResult.fromMap(doc.data()!);
    }
    return null;
  }
}
