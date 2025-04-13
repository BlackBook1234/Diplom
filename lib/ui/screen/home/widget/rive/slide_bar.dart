import 'package:chat_system/core/dilaog/mixin.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/screen/auth/views/login.dart';
import 'package:chat_system/ui/screen/home/widget/rive/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'menu.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with BaseStateMixin {
  Menu selectedSideMenu = sidebarMenus.first;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                name: context.read<AuthCubit>().state.userInfo.name,
                bio: context.read<AuthCubit>().state.userInfo.role,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Үндсэн".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus.map((menu) => SideMenu(
                    menu: menu,
                    selectedMenu: selectedSideMenu,
                    press: () {
                      RiveUtils.chnageSMIBoolState(menu.rive.status!);
                      setState(() {
                        selectedSideMenu = menu;
                      });
                    },
                    riveOnInit: (artboard) {
                      menu.rive.status = RiveUtils.getRiveInput(artboard,
                          stateMachineName: menu.rive.stateMachineName);
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                child: Text(
                  "Тохиргоо".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ListTile(
                onTap: () {
                  context.read<AuthCubit>().clearUser();
                  auth.signOut();
                  showLogOutDialog("Та програмаас гарахдаа итгэлтэй байна уу!",
                      () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  });
                },
                leading: SizedBox(
                    height: 36,
                    width: 36,
                    child: Icon(Icons.logout_rounded, color: Colors.white)),
                title: Text(
                  "Гарах",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.bio,
  });

  final String name, bio;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        bio,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu(
      {super.key,
      required this.menu,
      required this.press,
      required this.riveOnInit,
      required this.selectedMenu});

  final Menu menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final Menu selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24, height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: selectedMenu == menu ? 288 : 0,
              height: 56,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset(
                  menu.rive.src,
                  artboard: menu.rive.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MenuBtn extends StatelessWidget {
  const MenuBtn({super.key, required this.press, required this.riveOnInit});

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 12),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
