import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/screen/home/cubit/home_cubit.dart';
import 'package:chat_system/ui/screen/home/widget/appbar.dart';
import 'package:chat_system/ui/screen/home/widget/rive/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'all_list.dart';
import 'contact_list.dart';
import 'settings.dart';

class MobileLayoutScreen extends ConsumerStatefulWidget {
  const MobileLayoutScreen({super.key});

  @override
  ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _animationController;
  Menu selectedBottonNav = bottomNavItems.first;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _animationController.dispose();
    super.dispose();
  }

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        context.read<AuthCubit>().setUserState(true);
        break;
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        context.read<AuthCubit>().setUserState(false);
        break;
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ContactsList(),
    SearchAllScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return KeyboardDismissOnTap(
          child: Scaffold(
        appBar: AppBarWidget(selectedIndex: state.index),
        body: _widgetOptions.elementAt(state.index),
      ));
    });
  }
}
