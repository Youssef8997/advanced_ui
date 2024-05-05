import 'dart:async';

import 'package:advanced_ui/utls/extensions/responsave_extension.dart';
import 'package:advanced_ui/utls/manger/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../utls/manger/assets_manger.dart';
import '../../../utls/manger/color_manger.dart';
import '../widget/drawer_widget.dart';
import '../widget/info_widget.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isStart = false;
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  @override
  void initState() {
    Timer(
      Duration.zero,
      () => setState(() {
        isStart = true;
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ZoomDrawer(
          androidCloseOnBackTap: true,
          clipMainScreen: true,
          mainScreenTapClose: true,
          menuScreenTapClose: true,
          overlayBlur: 0.3,
          menuBackgroundColor: ColorsManger.pColor,
          controller: zoomDrawerController,
          style: DrawerStyle.defaultStyle,
          menuScreen: Container(
              color: ColorsManger.pColor,
              height: context.height,
              width: context.width,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.isPortrait ? 70 : 30, horizontal: 10),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetDrawer(icon: Icons.person, title: "profile"),
                    WidgetDrawer(
                        icon: Icons.person, title: "Latest transactions"),
                    WidgetDrawer(icon: Icons.person, title: "settings"),
                    WidgetDrawer(icon: Icons.person, title: "logout"),
                  ],
                ),
              )),
          mainScreen: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              toolbarHeight: 50,
              leading: Semantics(
                label: "this is menu Icon",
                child: IconButton(
                  onPressed: zoomDrawerController.toggle,
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              title: Semantics(
                label: "this is Logo of company",
                child: SvgPicture.asset(
                  AssetsManger.logo,
                  height: 50,
                  width: 30,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.isPortrait
                        ? context.height * .13
                        : context.height * .26,
                    width: context.width,
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) => Semantics(
                              label: "your balance",
                              child: InfoWidget(
                                icon: Icons.attach_money,
                                info: "gain money",
                                data: "100\$",
                                index: i,
                              ),
                            ),
                        separatorBuilder: (context, i) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: 3),
                  ),
                  const Spacer(),
                  Semantics(
                    label: "transactions",
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "transactions",
                        style: FontsManger.largeFont(context)!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: context.isPortrait
                        ? context.height * .6
                        : context.isPhone
                            ? context.width * .15
                            : context.width * .4,
                    width: context.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    child: GridView.builder(
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: context.isPortrait ? 1 : 2,
                          crossAxisSpacing: 5,
                          childAspectRatio: 5,
                          mainAxisSpacing: 5),
                      itemBuilder: (context, i) => ListTile(
                        title: Text(
                          "pos purchase",
                          style: FontsManger.largeFont(context)!
                              .copyWith(color: Colors.black, fontSize: 16),
                        ),
                        subtitle: const Text("5/5/2024"),
                        trailing: Text(
                          "- 200\$",
                          style: FontsManger.largeFont(context)!
                              .copyWith(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          borderRadius: 40.0,
          showShadow: true,
          angle: -5.0,
          drawerShadowsBackgroundColor: ColorsManger.white,
          slideWidth: MediaQuery.of(context).size.width * .62,
          shadowLayer2Color: Colors.white30,
          openCurve: Curves.easeInOut,
          closeCurve: Curves.easeInBack,
        ),
        Center(
          child: AnimatedOpacity(
            opacity: isStart ? 0 : 1,
            duration: const Duration(seconds: 1, milliseconds: 700),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1, milliseconds: 500),
              height: isStart ? 0 : context.height,
              width: isStart ? 0 : context.width,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
              ),
            ),
          ),
        )
      ],
    );
  }
}
