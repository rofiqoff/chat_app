import '../../domain/entities/chat.dart';

class ChatModel extends Chat {
  ChatModel({
    required super.id,
    required super.name,
    required super.lastMessage,
    required super.time,
    super.unreadCount,
    super.avatarUrl,
    super.isGroup,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as String,
      name: json['name'] as String,
      lastMessage: json['lastMessage'] as String? ?? '',
      time: json['time'] as String,
      unreadCount: json['unreadCount'] as int? ?? 0,
      avatarUrl: json['avatarUrl'] as String? ?? '',
      isGroup: json['isGroup'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastMessage': lastMessage,
      'time': time,
      'unreadCount': unreadCount,
      'avatarUrl': avatarUrl,
      'isGroup': isGroup,
    };
  }
}
