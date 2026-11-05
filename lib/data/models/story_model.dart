import '../../domain/entities/story_entity.dart';

class StoryModel extends StoryEntity {
  const StoryModel({
    required super.id,
    required super.authorName,
    required super.authorAvatar,
    required super.title,
    required super.subtitle,
    required super.mediaUrl,
    required super.durationSeconds,
    required super.postedAt,
    required super.isViewed,
    required super.reactionCount,
  });

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'] as String,
      authorName: map['author_name'] as String,
      authorAvatar: map['author_avatar'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      mediaUrl: map['media_url'] as String,
      durationSeconds: (map['duration_seconds'] as num?)?.toInt() ?? 6,
      postedAt: map['posted_at'] as String,
      isViewed: (map['is_viewed'] as num?)?.toInt() == 1,
      reactionCount: (map['reaction_count'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author_name': authorName,
      'author_avatar': authorAvatar,
      'title': title,
      'subtitle': subtitle,
      'media_url': mediaUrl,
      'duration_seconds': durationSeconds,
      'posted_at': postedAt,
      'is_viewed': isViewed ? 1 : 0,
      'reaction_count': reactionCount,
    };
  }
}
