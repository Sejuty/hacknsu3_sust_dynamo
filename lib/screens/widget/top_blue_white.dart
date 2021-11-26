import 'package:flutter/material.dart';
import 'package:hacknsu3_sust_dynamo/const.dart';

class TopBlueWhitePage extends StatelessWidget {
  final Widget topWidget;
  final Widget bottomWidget;

  const TopBlueWhitePage(
      {Key? key, required this.topWidget, required this.bottomWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kprimaryColor,
            // decoration: BoxDecoration(
            //   border
            // ),
            height: screenH * 0.35,
            child: Center(child: topWidget),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // color: Colors.white,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     kprimaryColor,
                  //     ksecondaryColor,
                  //   ],
                  // ),
                  color: Colors.white),
              height: screenH * 0.7,
              child: Center(child: bottomWidget),
            ),
          ),
        ],
      ),
    );
  }
}
