import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Salva ou atualiza um usuário no Firestore
  Future<void> saveUserData(UserModel user) async {
    await _db.collection('usuarios').doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }

  /// Retorna os dados de um usuário específico pelo UID
  Future<UserModel?> getUserData(String uid) async {
    final doc = await _db.collection('usuarios').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    }
    return null;
  }

  /// Atualiza apenas campos específicos do usuário
  Future<void> updateUserField(String uid, Map<String, dynamic> data) async {
    await _db.collection('usuarios').doc(uid).update(data);
  }

  /// Retorna todos os usuários da coleção 'usuarios' (para painel admin)
  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await _db.collection('usuarios').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['uid'] = doc.id; // Garante UID mesmo se não estiver salvo no doc
      return UserModel.fromMap(data);
    }).toList();
  }
}
