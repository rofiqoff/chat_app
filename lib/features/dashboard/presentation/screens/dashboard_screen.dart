import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/features/call/domain/entities/call.dart';
import 'package:chat_app/features/dashboard/presentation/screens/drawer.dart';
import 'package:chat_app/features/user/domain/entities/user.dart';
import 'package:chat_app/ui/molecules/bottombar/app_bottom_bar.dart';
import 'package:chat_app/ui/molecules/snackbar.dart';
import 'package:chat_app/ui/pages/screen_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../ui/molecules/bottombar/app_bottom_nav_item.dart';
import '../../../call/data/repositories/call_repository.dart';
import '../../../chat/data/repositories/chat_repository.dart';
import '../../../chat/domain/entities/chat.dart';
import '../../../user/data/repositories/user_repository.dart';
import 'tab/calls_tabs.dart';
import 'tab/chats_tabs.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Data Lists
  List<Chat> _chats = [];
  List<User> _nearbyUsers = [];
  List<Call> _calls = [];

  // Loading state
  bool _isLoading = true;

  // Repositories
  final ChatRepository _chatRepository = ChatRepository();
  final UserRepository _userRepository = UserRepository();
  final CallRepository _callRepository = CallRepository();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load data from repositories
  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    try {
      // Load chats
      final chats = await _chatRepository.getChats();

      // Load nearby users
      final nearbyUsers = await _userRepository.getNearbyUsers();

      // Load calls
      final calls = await _callRepository.getCallHistory();

      if (mounted) {
        setState(() {
          _chats = chats;
          _nearbyUsers = nearbyUsers;
          _calls = calls;
        });
      }
    } catch (e) {
      // Handle errors (e.g., show a snackbar)
      print('Error loading data: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: AppStrings.appName,
      showLeadingIcon: false,
      drawer: DrawerScreen(),
      toolbarActions: [
        IconButton(
          onPressed: () {
            showMessageSuccess(context, "Search Tapped");
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
            showMessageSuccess(context, "Contact Tapped");
          },
          icon: const Icon(Icons.contacts),
        ),
      ],
      bottomNavigationBar: AppBottomBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          AppBottomNavItem(
            label: AppStrings.chats,
            icon: Icons.chat_bubble_outline,
          ),
          AppBottomNavItem(
            label: AppStrings.calls,
            icon: Icons.call_outlined,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMessageSuccess(context, "New Chat Tapped");
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: AppColors.surface,
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _selectedIndex == 0
              ? ChatsTabs(
                  nearbyUsers: _nearbyUsers,
                  chats: _chats,
                )
              : CallsTabs(calls: _calls),
    );
  }
}
