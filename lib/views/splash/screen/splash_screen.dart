// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:advanced_ui/utls/extensions/responsave_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utls/base_widget/navigator.dart';
import '../../../utls/manger/assets_manger.dart';
import '../../../utls/manger/font_manger.dart';
import '../../home_layout/screen/home_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityValue = 0;
  bool textValue = false;
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        opacityValue = 1;
        Timer(const Duration(seconds: 1), () {
          setState(() {
            textValue = true;
          });
        });
      });
    });

    Timer(const Duration(seconds: 5), () async {
      navigatorWid(
          page: const HomeLayout(), context: context, returnPage: false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AssetsManger.backGroundSplash,
              fit: BoxFit.fill, height: context.height, width: context.width),
          AnimatedPositioned(
              bottom: opacityValue == 1 ? 0 : -context.height,
              width: context.width,
              duration: const Duration(seconds: 1),
              child: AnimatedOpacity(
                opacity: opacityValue,
                duration: const Duration(milliseconds: 600),
                child: Container(
                  width: context.width,
                  height: context.height,
                  color: Colors.deepPurple.shade400,
                ),
              )),
          AnimatedPositioned(
              bottom: context.height * .5,
              right: textValue
                  ? context.width * 0
                  : context.isPortrait
                      ? -context.height * .5
                      : -context.width * .8,
              width: context.width,
              duration: const Duration(milliseconds: 900),
              child: SvgPicture.asset(AssetsManger.logo)),
          AnimatedPositioned(
              left: textValue
                  ? context.width * .0
                  : context.isPortrait
                      ? -context.height * .5
                      : -context.width * .8,
              bottom: context.height * .2,
              width: context.width,
              duration: const Duration(milliseconds: 1200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to your bank",
                    style: FontsManger.largeFont(context)
                        ?.copyWith(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We hope you have a wonderful experience!",
                    style: FontsManger.mediumFont(context)
                        ?.copyWith(color: Colors.white, fontSize: 18),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
