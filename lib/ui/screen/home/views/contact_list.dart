import 'package:chat_system/test/common/widgets/loader.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/screen/chat/views/group_chat.dart';
import 'package:chat_system/ui/screen/chat/views/private_chat.dart';
import 'package:chat_system/ui/screen/home/cubit/home_cubit.dart';
import 'package:chat_system/ui/screen/home/widget/list_builder_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10),
              StreamBuilder<List<Group>>(
                  stream: context
                      .read<HomeCubit>()
                      .getChatGroups(state.userInfo.uid, true),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loader();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var groupData = snapshot.data![index];
                        return GroupListUi(
                          data: groupData,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              GroupChatScreen.routeName,
                              arguments: {
                                'name': groupData.name,
                                'uid': groupData.groupId,
                                'profilePic': groupData.groupPic,
                              },
                            );
                          },
                        );
                      },
                    );
                  }),
              if (state.userInfo.uid != "")
                StreamBuilder<List<ChatContact>>(
                    stream: context
                        .read<HomeCubit>()
                        .getChatContacts(state.userInfo.uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Loader();
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          var chatContactData = snapshot.data![index];
                          return UserListUi(
                              data: chatContactData,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  PrivateChatScreen.routeName,
                                  arguments: {
                                    'name': chatContactData.name,
                                    'uid': chatContactData.contactId,
                                    'profilePic': chatContactData.profilePic,
                                  },
                                );
                              });
                        },
                      );
                    }),
            ],
          ),
        ),
      );
    });
  }
}
