import 'dart:io';

import 'package:chat_system/constants.dart';
import 'package:chat_system/test/common/utils/utils.dart';
import 'package:chat_system/test/features/group/controller/group_controller.dart';
import 'package:chat_system/ui/screen/home/cubit/home_cubit.dart';
import 'package:chat_system/ui/screen/home/widget/select_contract_group.dart';
import 'package:chat_system/ui/widget/common/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class CreateGroupScreen extends ConsumerStatefulWidget {
  static const String routeName = '/create-group';
  const CreateGroupScreen({super.key});

  @override
  ConsumerState<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends ConsumerState<CreateGroupScreen> {
  final TextEditingController groupNameController = TextEditingController();
  File? image;

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void createGroup() {
    if (groupNameController.text.trim().isNotEmpty && image != null) {
      ref.read(groupControllerProvider).createGroup(
            context,
            groupNameController.text.trim(),
            image!,
            context.read<HomeCubit>().state.emailList,
          );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    groupNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        foregroundColor: Colors.white,
        title: const Text(
          'Групп чат нээх',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                image == null
                    ? const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                        ),
                        radius: 64,
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(
                          image!,
                        ),
                        radius: 64,
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: groupNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Group Name',
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(8),
              child: Text(
                'Select Contacts',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SelectContactsGroup(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: KeyboardVisibilityBuilder(
        builder: (context, visible) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PrimaryButton(
              height: 48,
              onPressed: createGroup,
              disabled: false,
              isLoading: false,
              width: double.infinity,
              color: primaryColor,
              child: Text(
                "Хадгалах",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
