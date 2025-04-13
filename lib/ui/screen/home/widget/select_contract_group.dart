import 'package:chat_system/constants.dart';
import 'package:chat_system/test/common/widgets/loader.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/screen/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectContactsGroup extends ConsumerStatefulWidget {
  const SelectContactsGroup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectContactsGroupState();
}

class _SelectContactsGroupState extends ConsumerState<SelectContactsGroup> {
  List<int> selectedContactsIndex = [];

  void selectContact(int index, String email) {
    if (selectedContactsIndex.contains(index)) {
      selectedContactsIndex.removeAt(index);
    } else {
      selectedContactsIndex.add(index);
    }
    setState(() {});
    context.read<HomeCubit>().addEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserModel>>(
        stream: context.read<AuthCubit>().getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var userData = snapshot.data![index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () => selectContact(index, userData.email),
                        splashColor: Colors.transparent,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 50,
                                    child: userData.profilePic == ""
                                        ? CircleAvatar(
                                            backgroundColor:
                                                primaryColor.withOpacity(0.5),
                                            child: Icon(Icons.person,
                                                size: 32, color: Colors.white),
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(userData.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                              selectedContactsIndex.contains(index)
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.done),
                                    )
                                  : const Icon(Icons.account_circle)
                            ],
                          ),
                        ),
                      ),
                      Divider(indent: 80, color: Colors.grey.withOpacity(0.2)),
                    ],
                  );

                  // InkWell(
                  //   onTap: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 8),
                  //     child: ListTile(
                  //       title: Text(
                  //         userData.name,
                  //         style: const TextStyle(fontSize: 18),
                  //       ),
                  //       leading: selectedContactsIndex.contains(index)
                  //           ? IconButton(
                  //               onPressed: () {},
                  //               icon: const Icon(Icons.done),
                  //             )
                  //           : const Icon(Icons.account_circle),
                  //     ),
                  //   ),
                  // );
                }),
          );
        });
  }
}
