import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknsu3_sust_dynamo/backend/data/model/request_data.dart';

import '../../const.dart';

class RequestPart extends StatelessWidget {
  RequestPart({Key? key}) : super(key: key);
  final List<ReqData> reqData = [
    ReqData(
        name: "Name1",
        email: "Email1",
        gender: "male",
        age: 22,
        date: "22 nov 21",
        time: "9:30am",
        description: "description"),
    ReqData(
        name: "Sourav",
        email: "sourav.ahmed5654@gmail.com",
        gender: "male",
        age: 22,
        date: "22 nov 21",
        time: "9:30am",
        description: "description"),
    ReqData(
        name: "Name4",
        email: "Email1",
        gender: "male",
        age: 22,
        date: "22 nov 21",
        time: "9:30am",
        description: "description"),
    ReqData(
        name: "Name3",
        email: "Email1",
        gender: "male",
        age: 22,
        date: "22 nov 21",
        time: "9:30am",
        description: "description"),
    ReqData(
        name: "Name2",
        email: "Email1",
        gender: "male",
        age: 22,
        date: "22 nov 21",
        time: "9:30am",
        description: "description"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reqData.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          // width: screenW * 0.8,
          // height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                // color: Color.fromRGBO(0, 119, 182, 0.6),
                color: const Color(0xff0077B6).withOpacity(.3),
                offset: Offset(3, 3),
                blurRadius: 6,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    radius: 25,
                    child: Text(
                      reqData[index].name[0],
                      style: GoogleFonts.lora(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(reqData[index].name,
                            style: Theme.of(context).textTheme.bodyText1),
                        // Text(
                        //   reqData[index].email,
                        // ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 12,
                                  ),
                                  Text(
                                    reqData[index].date,
                                    style: textStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    size: 12,
                                  ),
                                  Text(
                                    reqData[index].time,
                                    style: textStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ])
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xffF36262)),
                      child: SizedBox(
                          width: screenW * 0.3,
                          child: Center(child: Text("Reject")))),
                  ElevatedButton(
                      onPressed: () {},
                      child: SizedBox(
                          width: screenW * 0.3,
                          child: Center(child: Text("Accept"))))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
