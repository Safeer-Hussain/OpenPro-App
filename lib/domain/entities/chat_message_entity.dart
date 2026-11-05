class ChatMessageEntity {
  final String id;
  final String sender; // 'user' or 'assistant'
  final String content;
  final String timestamp;
  final List<String> actionChips;

  const ChatMessageEntity({
    required this.id,
    required this.sender,
    required this.content,
    required this.timestamp,
    this.actionChips = const [],
  });

  bool get isUser => sender == 'user';

  ChatMessageEntity copyWith({
    String? id,
    String? sender,
    String? content,
    String? timestamp,
    List<String>? actionChips,
  }) {
    return ChatMessageEntity(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      actionChips: actionChips ?? this.actionChips,
    );
  }
}
