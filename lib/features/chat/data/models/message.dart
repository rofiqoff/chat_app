class Message {
  final String id;
  final String chatId;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final bool isSentByMe;
  final MessageStatus status;

  Message({
    required this.id,
    required this.chatId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    required this.senderId,
    required this.isSentByMe,
    this.status = MessageStatus.sent,
  });

  Message copyWith({
    String? id,
    String? chatId,
    String? senderId,
    String? senderName,
    String? content,
    DateTime? timestamp,
    bool? isSentByMe,
    MessageStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isSentByMe: isSentByMe ?? this.isSentByMe,
      status: status ?? this.status,
    );
  }
}

enum MessageStatus {
  sent,
  delivered,
  read,
  failed,
}
