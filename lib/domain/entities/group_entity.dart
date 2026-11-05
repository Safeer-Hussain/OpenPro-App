class GroupEntity {
  final String id;
  final String name;
  final String tagline;
  final String description;
  final String bannerUrl;
  final int memberCount;
  final String topic;
  final bool isJoined;
  final int recentPostsCount;

  const GroupEntity({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.bannerUrl,
    required this.memberCount,
    required this.topic,
    required this.isJoined,
    required this.recentPostsCount,
  });

  GroupEntity copyWith({
    String? id,
    String? name,
    String? tagline,
    String? description,
    String? bannerUrl,
    int? memberCount,
    String? topic,
    bool? isJoined,
    int? recentPostsCount,
  }) {
    return GroupEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      description: description ?? this.description,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      memberCount: memberCount ?? this.memberCount,
      topic: topic ?? this.topic,
      isJoined: isJoined ?? this.isJoined,
      recentPostsCount: recentPostsCount ?? this.recentPostsCount,
    );
  }
}
