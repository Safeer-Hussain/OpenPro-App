import '../../domain/entities/group_entity.dart';

class GroupModel extends GroupEntity {
  const GroupModel({
    required super.id,
    required super.name,
    required super.tagline,
    required super.description,
    required super.bannerUrl,
    required super.memberCount,
    required super.topic,
    required super.isJoined,
    required super.recentPostsCount,
  });

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'] as String,
      name: map['name'] as String,
      tagline: map['tagline'] as String,
      description: map['description'] as String,
      bannerUrl: map['banner_url'] as String,
      memberCount: (map['member_count'] as num?)?.toInt() ?? 0,
      topic: map['topic'] as String,
      isJoined: (map['is_joined'] as num?)?.toInt() == 1,
      recentPostsCount: (map['recent_posts_count'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'description': description,
      'banner_url': bannerUrl,
      'member_count': memberCount,
      'topic': topic,
      'is_joined': isJoined ? 1 : 0,
      'recent_posts_count': recentPostsCount,
    };
  }
}
