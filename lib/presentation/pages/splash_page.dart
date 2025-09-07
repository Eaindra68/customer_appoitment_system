import 'dart:async';

import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/my_icons.dart';
import 'bottom_nav_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => context.replaceWidget(BottomNavPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                MyIcons.appIconSvg,
                width: 60,
                height: 50,
              ),
            ),
          ),
          Spacer(),
          SpinKitThreeBounce(color: Colors.white, size: 20),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
