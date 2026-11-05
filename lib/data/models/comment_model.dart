import '../../domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel({
    required super.id,
    required super.postId,
    required super.authorName,
    required super.authorAvatar,
    required super.authorRole,
    required super.content,
    required super.timestamp,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as String,
      postId: map['post_id'] as String,
      authorName: map['author_name'] as String,
      authorAvatar: map['author_avatar'] as String,
      authorRole: map['author_role'] as String,
      content: map['content'] as String,
      timestamp: map['timestamp'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'post_id': postId,
      'author_name': authorName,
      'author_avatar': authorAvatar,
      'author_role': authorRole,
      'content': content,
      'timestamp': timestamp,
    };
  }
}
