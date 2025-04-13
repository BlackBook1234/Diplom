import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'ui/widget/loading/loading_cubit.dart';

class ScaffoldMonpay extends StatelessWidget {
  const ScaffoldMonpay({super.key, required this.body});
  final Widget body;
  static Widget appBar(
      {required Widget child, String? title, bool isRound = true}) {
    return Scaffold(
      body: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            body,
            BlocConsumer<LoadingCubit, LoadingState>(
                listener: (context, state) {
              if (state is LoadingInitial) {}
            }, builder: (context, state) {
              if (state is LoadingShow) {
                return WillPopScope(
                  onWillPop: () async {
                    return false;
                  },
                  child: Stack(children: [
                    Center(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent,
                          ),
                          height: 100,
                          width: 100,
                          child: Lottie.asset(
                            "assets/m_loading.json",
                            repeat: true,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: GestureDetector(
                      onTap: () {},
                      onHorizontalDragCancel: () {},
                    ))
                  ]),
                );
              } else {
                return const Text('');
              }
            }),
          ],
        ),
      ),
    );
  }
}
