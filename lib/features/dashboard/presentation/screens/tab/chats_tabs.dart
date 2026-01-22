import 'package:chat_app/core/constants/app_constants.dart';
import 'package:chat_app/core/constants/app_strings.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:chat_app/features/chat/domain/entities/chat.dart';
import 'package:chat_app/features/dashboard/presentation/widgets/nearby_user_card.dart';
import 'package:chat_app/ui/molecules/snackbar.dart';
import 'package:flutter/material.dart';

import '../../../../user/domain/entities/user.dart';
import '../../widgets/chat_list_item.dart';

class ChatsTabs extends StatelessWidget {
  final List<User> nearbyUsers;
  final List<Chat> chats;

  const ChatsTabs({
    Key? key,
    required this.nearbyUsers,
    required this.chats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _nearbyUsersList(nearbyUsers),
        const Divider(height: 1),
        _chatListItem(chats)
      ],
    );
  }
}

Widget _nearbyUsersList(List<User> nearbyUsers) {
  return Container(
    color: AppColors.surface,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.spacingM,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingL),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: nearbyUsers.map((user) {
            return Padding(
                padding: const EdgeInsets.only(right: AppConstants.spacingXS),
                child: NearbyUserCard(
                  user: user,
                  onTap: () {
                    // showMessageSuccess(
                    //     context, "Nearby User tapped: ${user.name}");
                  },
                ));
          }).toList(),
        ),
      ),
    ),
  );
}

Widget _chatListItem(List<Chat> chats) {
  return Expanded(
    child: ListView.builder(
      padding: const EdgeInsets.only(bottom: AppConstants.spacingXXXL),
      itemBuilder: (context, index) {
        return ChatListItem(
          chat: chats[index],
          onTap: () {
            showMessageSuccess(context, "Chat tapped: ${chats[index].name}");
          },
        );
      },
      itemCount: chats.length,
    ),
  );
}
