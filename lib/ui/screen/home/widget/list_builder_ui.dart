import 'package:chat_system/constants.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroupListUi extends StatelessWidget {
  const GroupListUi({super.key, required this.data, required this.onTap});

  final Group data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: 42,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 42,
                          height: 42,
                          child: data.groupPic == ""
                              ? CircleAvatar(
                                  backgroundColor:
                                      primaryColor.withOpacity(0.5),
                                  child: Icon(Icons.person,
                                      size: 32, color: Colors.white),
                                )
                              : ClipOval(
                                  child: Image.network(
                                    data.groupPic,
                                    width: 42,
                                    height: 42,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(data.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14)),
                            Text(data.lastMessage,
                                style: TextStyle(
                                    color: shadowColorLight,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
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
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(
                            Icons.group,
                            color: Colors.white,
                            size: 12,
                          ),
                        )),
                  ],
                ),
                Text(
                    DateFormat.Hm().format(
                        DateTime.fromMillisecondsSinceEpoch(data.timeSent)),
                    style: TextStyle(
                        color: shadowColorLight,
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
              ],
            ),
          ),
          Divider(indent: 80, color: Colors.grey.withOpacity(0.2)),
        ],
      ),
    );
  }
}

class UserListUi extends StatelessWidget {
  const UserListUi({super.key, required this.data, required this.onTap});

  final ChatContact data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: 42,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 42,
                          height: 42,
                          child: data.profilePic == ""
                              ? CircleAvatar(
                                  backgroundColor:
                                      primaryColor.withOpacity(0.5),
                                  child: Icon(Icons.person,
                                      size: 32, color: Colors.white),
                                )
                              : ClipOval(
                                  child: Image.network(
                                    data.profilePic,
                                    width: 42,
                                    height: 42,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(data.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14)),
                            Text(data.lastMessage,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: shadowColorLight)),
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
                              backgroundColor: data.isOnline
                                  ? Colors.green.shade400
                                  : Colors.grey.shade300),
                        )),
                  ],
                ),
                Text(
                    DateFormat.Hm().format(
                        DateTime.fromMillisecondsSinceEpoch(data.timeSent)),
                    style: TextStyle(
                        color: shadowColorLight,
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
              ],
            ),
          ),
          Divider(indent: 80, color: Colors.grey.withOpacity(0.2)),
        ],
      ),
    );
  }
}
