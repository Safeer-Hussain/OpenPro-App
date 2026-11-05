class CommentEntity {
  final String id;
  final String postId;
  final String authorName;
  final String authorAvatar;
  final String authorRole;
  final String content;
  final String timestamp;

  const CommentEntity({
    required this.id,
    required this.postId,
    required this.authorName,
    required this.authorAvatar,
    required this.authorRole,
    required this.content,
    required this.timestamp,
  });

  CommentEntity copyWith({
    String? id,
    String? postId,
    String? authorName,
    String? authorAvatar,
    String? authorRole,
    String? content,
    String? timestamp,
  }) {
    return CommentEntity(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      authorName: authorName ?? this.authorName,
      authorAvatar: authorAvatar ?? this.authorAvatar,
      authorRole: authorRole ?? this.authorRole,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
