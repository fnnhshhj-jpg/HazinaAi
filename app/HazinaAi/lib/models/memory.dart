import 'dart:convert';

class Memory {
  final String id;
  final String title;
  final String content;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPinned;
  final bool isFavorite;
  final List<String> tags;

  const Memory({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    this.isPinned = false,
    this.isFavorite = false,
    this.tags = const [],
  });

  /// Empty Memory
  factory Memory.empty() {
    return Memory(
      id: '',
      title: '',
      content: '',
      category: 'General',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Copy
  Memory copyWith({
    String? id,
    String? title,
    String? content,
    String? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPinned,
    bool? isFavorite,
    List<String>? tags,
  }) {
    return Memory(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPinned: isPinned ?? this.isPinned,
      isFavorite: isFavorite ?? this.isFavorite,
      tags: tags ?? this.tags,
    );
  }

  /// Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isPinned': isPinned,
      'isFavorite': isFavorite,
      'tags': tags,
    };
  }

  /// From Map
  factory Memory.fromMap(Map<String, dynamic> map) {
    return Memory(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      category: map['category'] ?? 'General',
      createdAt: DateTime.parse(
        map['createdAt'],
      ),
      updatedAt: DateTime.parse(
        map['updatedAt'],
      ),
      isPinned: map['isPinned'] ?? false,
      isFavorite: map['isFavorite'] ?? false,
      tags: List<String>.from(
        map['tags'] ?? [],
      ),
    );
  }

  /// JSON
  String toJson() {
    return jsonEncode(toMap());
  }

  factory Memory.fromJson(String source) {
    return Memory.fromMap(
      jsonDecode(source),
    );
  }

  @override
  String toString() {
    return 'Memory(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Memory &&
            id == other.id &&
            title == other.title &&
            content == other.content &&
            category == other.category &&
            createdAt == other.createdAt &&
            updatedAt == other.updatedAt &&
            isPinned == other.isPinned &&
            isFavorite == other.isFavorite;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      content,
      category,
      createdAt,
      updatedAt,
      isPinned,
      isFavorite,
    );
  }
}