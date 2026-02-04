import '../models/message.dart';

class MessageRepository {
  /// Get messages for a specific chat
  Future<List<Message>> getMessages(String chatId) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock messages
    // Later, this will fetch from Firebase Firestore
    return [
      Message(
        id: '1',
        chatId: chatId,
        senderId: 'other_user',
        senderName: 'John Doe',
        content: 'Hey! How are you?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        isSentByMe: false,
        status: MessageStatus.read,
      ),
      Message(
        id: '2',
        chatId: chatId,
        senderId: 'me',
        senderName: 'Me',
        content: 'I\'m good, thanks! How about you?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 28)),
        isSentByMe: true,
        status: MessageStatus.read,
      ),
      Message(
        id: '3',
        chatId: chatId,
        senderId: 'other_user',
        senderName: 'John Doe',
        content: 'Doing great! Want to grab lunch tomorrow?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
        isSentByMe: false,
        status: MessageStatus.read,
      ),
      Message(
        id: '4',
        chatId: chatId,
        senderId: 'me',
        senderName: 'Me',
        content: 'Sure! What time works for you?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
        isSentByMe: true,
        status: MessageStatus.delivered,
      ),
    ];
  }

  /// Send a new message
  Future<Message> sendMessage({
    required String chatId,
    required String content,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Create new message
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: chatId,
      senderId: 'me',
      senderName: 'Me',
      content: content,
      timestamp: DateTime.now(),
      isSentByMe: true,
      status: MessageStatus.sent,
    );

    // In real app, this would save to Firebase and return the saved message
    return message;
  }
}
