class StoryEntity {
  final String id;
  final String authorName;
  final String authorAvatar;
  final String title;
  final String subtitle;
  final String mediaUrl;
  final int durationSeconds;
  final String postedAt;
  final bool isViewed;
  final int reactionCount;

  const StoryEntity({
    required this.id,
    required this.authorName,
    required this.authorAvatar,
    required this.title,
    required this.subtitle,
    required this.mediaUrl,
    required this.durationSeconds,
    required this.postedAt,
    required this.isViewed,
    required this.reactionCount,
  });

  StoryEntity copyWith({
    String? id,
    String? authorName,
    String? authorAvatar,
    String? title,
    String? subtitle,
    String? mediaUrl,
    int? durationSeconds,
    String? postedAt,
    bool? isViewed,
    int? reactionCount,
  }) {
    return StoryEntity(
      id: id ?? this.id,
      authorName: authorName ?? this.authorName,
      authorAvatar: authorAvatar ?? this.authorAvatar,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      postedAt: postedAt ?? this.postedAt,
      isViewed: isViewed ?? this.isViewed,
      reactionCount: reactionCount ?? this.reactionCount,
    );
  }
}
