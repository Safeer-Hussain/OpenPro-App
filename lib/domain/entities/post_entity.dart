class PostEntity {
  final String id;
  final String authorName;
  final String authorRole;
  final String authorAvatar;
  final String authorCompany;
  final String content;
  final String? codeSnippet;
  final String? codeLanguage;
  final String timestamp;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final bool isLiked;
  final bool isBookmarked;
  final List<String> tags;
  final String? imageUrl;

  const PostEntity({
    required this.id,
    required this.authorName,
    required this.authorRole,
    required this.authorAvatar,
    required this.authorCompany,
    required this.content,
    this.codeSnippet,
    this.codeLanguage,
    required this.timestamp,
    required this.likesCount,
    required this.commentsCount,
    required this.sharesCount,
    required this.isLiked,
    required this.isBookmarked,
    required this.tags,
    this.imageUrl,
  });

  PostEntity copyWith({
    String? id,
    String? authorName,
    String? authorRole,
    String? authorAvatar,
    String? authorCompany,
    String? content,
    String? codeSnippet,
    String? codeLanguage,
    String? timestamp,
    int? likesCount,
    int? commentsCount,
    int? sharesCount,
    bool? isLiked,
    bool? isBookmarked,
    List<String>? tags,
    String? imageUrl,
  }) {
    return PostEntity(
      id: id ?? this.id,
      authorName: authorName ?? this.authorName,
      authorRole: authorRole ?? this.authorRole,
      authorAvatar: authorAvatar ?? this.authorAvatar,
      authorCompany: authorCompany ?? this.authorCompany,
      content: content ?? this.content,
      codeSnippet: codeSnippet ?? this.codeSnippet,
      codeLanguage: codeLanguage ?? this.codeLanguage,
      timestamp: timestamp ?? this.timestamp,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      sharesCount: sharesCount ?? this.sharesCount,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      tags: tags ?? this.tags,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
