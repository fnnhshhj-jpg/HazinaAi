import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? photoUrl;

  final bool isPremium;
  final bool isVerified;

  final String language;
  final String themeMode;

  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.photoUrl,
    this.isPremium = false,
    this.isVerified = false,
    this.language = 'uz',
    this.themeMode = 'system',
    required this.createdAt,
    required this.updatedAt,
  });

  /// Empty User
  factory User.empty() {
    return User(
      id: '',
      name: '',
      email: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Copy
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? photoUrl,
    bool? isPremium,
    bool? isVerified,
    String? language,
    String? themeMode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      isPremium: isPremium ?? this.isPremium,
      isVerified: isVerified ?? this.isVerified,
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// To Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photoUrl': photoUrl,
      'isPremium': isPremium,
      'isVerified': isVerified,
      'language': language,
      'themeMode': themeMode,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// From Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'],
      photoUrl: map['photoUrl'],
      isPremium: map['isPremium'] ?? false,
      isVerified: map['isVerified'] ?? false,
      language: map['language'] ?? 'uz',
      themeMode: map['themeMode'] ?? 'system',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  /// JSON
  String toJson() => jsonEncode(toMap());

  factory User.fromJson(String source) {
    return User.fromMap(jsonDecode(source));
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is User &&
            id == other.id &&
            name == other.name &&
            email == other.email &&
            phone == other.phone &&
            photoUrl == other.photoUrl &&
            isPremium == other.isPremium &&
            isVerified == other.isVerified &&
            language == other.language &&
            themeMode == other.themeMode &&
            createdAt == other.createdAt &&
            updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      email,
      phone,
      photoUrl,
      isPremium,
      isVerified,
      language,
      themeMode,
      createdAt,
      updatedAt,
    );
  }
}