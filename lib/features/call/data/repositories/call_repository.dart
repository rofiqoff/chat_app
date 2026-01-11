import '../../domain/entities/call.dart';

/// Call Repository - Handles call data
class CallRepository {
  /// Get call history
  Future<List<Call>> getCallHistory() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Call(
        id: '1',
        name: 'John Doe',
        time: 'Today, 2:30 PM',
        isVideo: false,
        isMissed: false,
        isIncoming: true,
      ),
      Call(
        id: '2',
        name: 'Jane Smith',
        time: 'Yesterday, 5:45 PM',
        isVideo: true,
        isMissed: false,
        isIncoming: false,
      ),
      Call(
        id: '3',
        name: 'Mom',
        time: 'Yesterday, 10:20 AM',
        isVideo: false,
        isMissed: true,
        isIncoming: true,
      ),
    ];
  }
}
