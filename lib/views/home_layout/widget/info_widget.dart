import 'dart:math';

import 'package:advanced_ui/utls/extensions/responsave_extension.dart';
import 'package:flutter/material.dart';

import '../../../utls/constant/contstant_colors.dart';
import '../../../utls/manger/font_manger.dart';

class InfoWidget extends StatefulWidget {
  final String info;
  final IconData icon;
  final String data;

  final int index;

  const InfoWidget(
      {super.key,
      required this.info,
      required this.icon,
      required this.data,
      required this.index});

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.isPortrait ? context.height * .13 : context.height * .2,
      width: context.width * .4,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Constant.infoWidgetColors[widget.index],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.info,
                style: FontsManger.largeFont(context)!
                    .copyWith(fontSize: 14, color: Colors.white),
              ),
              const Spacer(),
              Icon(
                widget.icon,
                size: 24,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                widget.data,
                style: FontsManger.largeFont(context)!
                    .copyWith(fontSize: 14, color: Colors.white),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
