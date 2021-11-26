import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknsu3_sust_dynamo/screens/doc_apoint_req/req.dart';

import '../../const.dart';
import 'apoint.dart';

class DocApointReq extends StatefulWidget {
  const DocApointReq({Key? key}) : super(key: key);

  @override
  State<DocApointReq> createState() => _DocApointReqState();
}

class _DocApointReqState extends State<DocApointReq> {
  var pageViewController = PageController();
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async {
                    await pageViewController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic,
                    );
                    setState(() {
                      currentPage = 0;
                    });
                  },
                  child: Text(
                    'Request',
                    style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: currentPage == 0
                            ? textColor.withOpacity(1.0)
                            : textColor.withOpacity(0.6)),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await pageViewController.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic);
                    setState(() {
                      currentPage = 1;
                    });
                  },
                  child: Text(
                    'Appointment',
                    style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: currentPage == 1
                            ? textColor.withOpacity(1.0)
                            : textColor.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
            Expanded(
              // height: screenH * .85,
              child: PageView(
                controller: pageViewController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                scrollDirection: Axis.horizontal,
                children:  [
                  RequestPart(),
                  AppointmentPart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
