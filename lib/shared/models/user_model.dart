class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String instagram;
  final DateTime birthDate;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.instagram,
    required this.birthDate,
    required this.createdAt,
  });

  /// Cria um objeto UserModel a partir de um mapa (ex: Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['nome'] ?? '',
      email: map['email'] ?? '',
      phone: map['telefone'] ?? '',
      instagram: map['instagram'] ?? '',
      birthDate: DateTime.parse(map['data_nascimento']),
      createdAt: DateTime.parse(map['criado_em']),
    );
  }

  /// Converte o objeto UserModel em um mapa para salvar no Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nome': name,
      'email': email,
      'telefone': phone,
      'instagram': instagram,
      'data_nascimento': birthDate.toIso8601String(),
      'criado_em': createdAt.toIso8601String(),
    };
  }
}
