import 'package:chat_system/core/utils/global_key.dart';
import 'package:chat_system/firebase_options.dart';
import 'package:chat_system/router.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/widget/loading/loading_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_scaffold.dart';
import 'ui/screen/auth/views/wrapper.dart';
import 'ui/screen/home/cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => LoadingCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
         key: AppService.navigationKey,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEEF1F8),
          primarySwatch: Colors.blue,
          fontFamily: "Intel",
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            errorStyle: TextStyle(height: 0),
            border: defaultInputBorder,
            enabledBorder: defaultInputBorder,
            focusedBorder: defaultInputBorder,
            errorBorder: defaultInputBorder,
          ),
        ),
        themeMode: ThemeMode.system,
        onGenerateRoute: (settings) => generateRoute(settings),
        home: ScaffoldMonpay(body: WrapperScreen()),
        // builder: (context, child) {
        //   return ScaffoldMonpay(
        //     body: child!,
        //   );
        // },
      ),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
