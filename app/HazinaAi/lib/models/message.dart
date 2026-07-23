import 'dart:convert';

class Message {
  final String id;
  final String text;
  final bool isUser;
  final DateTime createdAt;
  final String? imageUrl;
  final String? audioUrl;
  final bool isFavorite;
  final bool isRead;

  const Message({
    required this.id,
    required this.text,
    required this.isUser,
    required this.createdAt,
    this.imageUrl,
    this.audioUrl,
    this.isFavorite = false,
    this.isRead = true,
  });

  /// Empty Message
  factory Message.empty() {
    return Message(
      id: '',
      text: '',
      isUser: true,
      createdAt: DateTime.now(),
    );
  }

  /// Copy
  Message copyWith({
    String? id,
    String? text,
    bool? isUser,
    DateTime? createdAt,
    String? imageUrl,
    String? audioUrl,
    bool? isFavorite,
    bool? isRead,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      isUser: isUser ?? this.isUser,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      isRead: isRead ?? this.isRead,
    );
  }

  /// Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'isUser': isUser,
      'createdAt': createdAt.toIso8601String(),
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'isFavorite': isFavorite,
      'isRead': isRead,
    };
  }

  /// From Map
  factory Message.from