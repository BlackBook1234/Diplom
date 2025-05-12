import 'package:chat_system/constants.dart';
import 'package:flutter/material.dart';
import 'package:chat_system/ui/screen/group/views/create_group.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: secondColor,
      centerTitle: false,
      title: Row(
        children: [
          SizedBox(width: 40),
          Image.asset("assets/logo.png", height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "SCHOOLChat",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              Text(
                "LiveChat",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white60),
              ),
            ],
          ),
        ],
      ),
      actions: switch (selectedIndex) {
        0 => _buildChatActions(context),
        int() => null,
      },
    );
  }

  List<Widget> _buildChatActions(BuildContext context) => [
        // if (context.read<AuthCubit>().state.userInfo.role == "Багш")
          PopupMenuButton(
            icon: Icon(Icons.more_vert,
                color: Theme.of(context).colorScheme.onPrimary),
            itemBuilder: (context) => [
              PopupMenuItem(
                textStyle: Theme.of(context).textTheme.titleMedium,
                child: const Text('Create Group'),
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, CreateGroupScreen.routeName);
                  });
                },
              ),
            ],
          ),
      ];

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
