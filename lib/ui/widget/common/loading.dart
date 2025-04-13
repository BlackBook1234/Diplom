import 'package:chat_system/core/utils/global_key.dart';
import 'package:chat_system/ui/widget/loading/loading_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loading {
  static void show() {
    close();
    BlocProvider.of<LoadingCubit>(AppService.navigationKey.currentContext!)
        .show();
  }

  static void close() =>
      BlocProvider.of<LoadingCubit>(AppService.navigationKey.currentContext!)
          .exit();
}
