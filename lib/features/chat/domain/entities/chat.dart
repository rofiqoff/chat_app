class Chat {
  final String id;
  final String name;
  final String lastMessage;
  final int unreadCount;
  final String avatarUrl;
  final bool isGroup;
  final String time;

  Chat({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.avatarUrl = '',
    this.isGroup = false,
  });

  Chat copyWith({
    String? id,
    String? name,
    String? lastMessage,
    int? unreadCount,
    String? avatarUrl,
    bool? isGroup,
    String? time,
  }) {
    return Chat(
      id: id ?? this.id,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isGroup: isGroup ?? this.isGroup,
      time: time ?? this.time,
    );
  }
}
