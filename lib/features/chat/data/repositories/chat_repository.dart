import '../../domain/entities/chat.dart';

class ChatRepository {
  Future<List<Chat>> getChats() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock data
    // Later, this will fetch from Firebase
    return [
      Chat(
        id: '1',
        name: 'John Doe',
        lastMessage: 'Hey, how are you?',
        time: '10:30 AM',
        unreadCount: 2,
      ),
      Chat(
        id: '2',
        name: 'Jane Smith',
        lastMessage: 'See you tomorrow!',
        time: '9:15 AM',
        unreadCount: 0,
      ),
      Chat(
        id: '3',
        name: 'Team Group',
        lastMessage: 'Meeting at 3 PM',
        time: 'Yesterday',
        unreadCount: 5,
        isGroup: true,
      ),
      Chat(
        id: '4',
        name: 'Mom',
        lastMessage: 'Call me when you\'re free',
        time: 'Yesterday',
        unreadCount: 1,
      ),
      Chat(
        id: '5',
        name: 'Office Group',
        lastMessage: 'Project update needed',
        time: '2 days ago',
        unreadCount: 12,
        isGroup: true,
      ),
    ];
  }

  Future<Chat?> getChatById(String id) async {
    final chats = await getChats();
    try {
      return chats.firstWhere((chat) => chat.id == id);
    } catch (e) {
      return null;
    }
  }
}
