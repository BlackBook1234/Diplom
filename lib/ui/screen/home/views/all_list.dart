import 'package:chat_system/constants.dart';
import 'package:chat_system/test/common/widgets/loader.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/screen/chat/views/group_chat.dart';
import 'package:chat_system/ui/screen/chat/views/private_chat.dart';
import 'package:chat_system/ui/screen/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAllScreen extends ConsumerStatefulWidget {
  static const String routeName = '/select-contact';
  const SearchAllScreen({super.key});

  @override
  ConsumerState<SearchAllScreen> createState() {
    return SearchAllScreenState();
  }
}

class SearchAllScreenState extends ConsumerState<SearchAllScreen> {
  String name = "";

  void selectContact(
      WidgetRef ref, UserModel selectedContact, BuildContext context) {
    Navigator.pushNamed(
      context,
      PrivateChatScreen.routeName,
      arguments: {
        'name': selectedContact.name,
        'uid': selectedContact.uid,
        'profilePic': selectedContact.profilePic,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              child: TextFormField(
                maxLength: 30,
                enabled: true,
                onChanged: (e) {
                  setState(() {
                    name = e;
                  });
                },
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 14),
                  counterText: '',
                  focusedErrorBorder: InputBorder.none,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  floatingLabelStyle: const TextStyle(
                    decoration: TextDecoration.none,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  errorBorder: InputBorder.none,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  alignLabelWithHint: true,
                  focusColor: Colors.transparent,
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Хайх",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 10),
            StreamBuilder<List<UserModel>>(
                stream: context.read<AuthCubit>().getAllUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  }

                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var userData = snapshot.data![index];
                        if (userData.email !=
                            context.read<AuthCubit>().state.userInfo.email) {
                          if (name.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      selectContact(ref, userData, context),
                                  splashColor: Colors.transparent,
                                  child: Container(
                                    height: 42,
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 42,
                                              height: 42,
                                              child: userData.profilePic == ""
                                                  ? CircleAvatar(
                                                      backgroundColor:
                                                          primaryColor
                                                              .withOpacity(0.5),
                                                      child: Icon(Icons.person,
                                                          size: 32,
                                                          color: Colors.white),
                                                    )
                                                  : ClipOval(
                                                      child: Image.network(
                                                        userData.profilePic,
                                                        width: 30,
                                                        height: 30,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(userData.name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            left: 30,
                                            top: 0,
                                            child: CircleAvatar(
                                              radius: 7,
                                              backgroundColor: kBackgroundColor,
                                              child: CircleAvatar(
                                                  radius: 6,
                                                  backgroundColor: userData
                                                          .isOnline
                                                      ? Colors.green.shade400
                                                      : Colors.grey.shade300),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                    indent: 80,
                                    color: Colors.grey.withOpacity(0.2)),
                              ],
                            );
                          }
                          if (userData.name
                              .toString()
                              .toLowerCase()
                              .contains(name.toLowerCase())) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      selectContact(ref, userData, context),
                                  splashColor: Colors.transparent,
                                  child: Container(
                                    height: 42,
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 42,
                                              height: 42,
                                              child: userData.profilePic == ""
                                                  ? CircleAvatar(
                                                      backgroundColor:
                                                          primaryColor
                                                              .withOpacity(0.5),
                                                      child: Icon(Icons.person,
                                                          size: 32,
                                                          color: Colors.white),
                                                    )
                                                  : ClipOval(
                                                      child: Image.network(
                                                        userData.profilePic,
                                                        width: 42,
                                                        height: 42,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(userData.name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            left: 30,
                                            top: 0,
                                            child: CircleAvatar(
                                              radius: 7,
                                              backgroundColor: kBackgroundColor,
                                              child: CircleAvatar(
                                                  radius: 6,
                                                  backgroundColor: userData
                                                          .isOnline
                                                      ? Colors.green.shade400
                                                      : Colors.grey.shade300),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                    indent: 80,
                                    color: Colors.grey.withOpacity(0.2)),
                              ],
                            );
                          }
                          return SizedBox.shrink();
                        } else {
                          return SizedBox.shrink();
                        }
                      });
                }),
            StreamBuilder<List<Group>>(
                stream: context.read<HomeCubit>().getChatGroups(
                    context.read<AuthCubit>().state.userInfo.uid, false),
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
                      var groupData = snapshot.data![index];
                      if (name.isEmpty) {
                        return Column(
                          children: [
                            InkWell(
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
                              splashColor: Colors.transparent,
                              child: Container(
                                height: 42,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 42,
                                              height: 42,
                                              child: groupData.groupPic == ""
                                                  ? CircleAvatar(
                                                      backgroundColor:
                                                          primaryColor
                                                              .withOpacity(0.5),
                                                      child: Icon(Icons.person,
                                                          size: 32,
                                                          color: Colors.white),
                                                    )
                                                  : ClipOval(
                                                      child: Image.network(
                                                        groupData.groupPic,
                                                        width: 42,
                                                        height: 42,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(groupData.name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                        Positioned(
                                            left: 28,
                                            top: 0,
                                            child: Container(
                                              width: 16,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Icon(Icons.group,
                                                  color: Colors.white,size: 14,),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                                indent: 80,
                                color: Colors.grey.withOpacity(0.2)),
                          ],
                        );
                      }
                      if (groupData.name
                          .toString()
                          .toLowerCase()
                          .startsWith(name.toLowerCase())) {
                        return Column(
                          children: [
                            InkWell(
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
                              splashColor: Colors.transparent,
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 4),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 42,
                                          height: 42,
                                          child: groupData.groupPic == ""
                                              ? CircleAvatar(
                                                  backgroundColor: primaryColor
                                                      .withOpacity(0.5),
                                                  child: Icon(Icons.person,
                                                      size: 32,
                                                      color: Colors.white),
                                                )
                                              : ClipOval(
                                                  child: Image.network(
                                                    groupData.groupPic,
                                                    width: 42,
                                                    height: 42,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(groupData.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14)),
                                      ],
                                    ),
                                    Positioned(
                                        left: 24,
                                        top: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Icon(Icons.group,
                                              color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                                indent: 80,
                                color: Colors.grey.withOpacity(0.2)),
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
