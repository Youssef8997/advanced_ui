import 'package:advanced_ui/utls/manger/font_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class WidgetDrawer extends StatelessWidget {
  final IconData icon;
  final String title;

  const WidgetDrawer({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton.icon(
              onPressed: () {
                MotionToast.info(
                    description: Text(
                  "sorry, you need to hire me to continue to this screen 😂👀",
                  style: FontsManger.largeFont(context)!
                      .copyWith(color: Colors.white, fontSize: 18),
                )).show(context);
              },
              icon: Icon(icon, color: Colors.white),
              label: Text(
                title,
                style: FontsManger.largeFont(context)!
                    .copyWith(color: Colors.white),
              )),
          Container(
            color: Colors.black,
            width: 120,
            height: .8,
            margin: const EdgeInsets.only(left: 50),
          ),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}
