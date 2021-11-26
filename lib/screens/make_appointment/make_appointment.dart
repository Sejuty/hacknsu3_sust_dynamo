import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hacknsu3_sust_dynamo/backend/data/model/doctor_info.dart';
import 'package:hacknsu3_sust_dynamo/const.dart';
import 'package:hacknsu3_sust_dynamo/screens/widget/top_blue_white.dart';

class MakeAppointment extends StatefulWidget {
  MakeAppointment({Key? key}) : super(key: key);

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  final DoctorInfo doctorInfo = DoctorInfo(
      name: "Dr. Forhad Rabbi",
      image:
          "https://image.shutterstock.com/image-photo/hand-closeup-holding-stethoscope-portrait-260nw-1189195201.jpg",
      hospitalName: "Mount adora hospital",
      speciality: "Heart Specialist",
      about:
          "Nostrud consequat mollit nulla eiusmod qui ullamco culpa commodo amet nisi officia eu eiusmod. Voluptate id magna reprehenderit ullamco sit dolore. Exercitation qui id duis reprehenderit enim laboris culpa sint quis sunt ea Lorem et tempor. Ut duis ea mollit ea in aliquip cillum commodo laboris.",
      address: "address",
      rating: 4.5,
      availableTimes: [
        AvailableTime(day: "Sunday", time: "9.00am-3.30pm"),
        AvailableTime(day: "Monday", time: "All day"),
        AvailableTime(day: "Friday", time: "3.00pm-7.00pm")
      ]);

  int selectedTime = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return TopBlueWhitePage(
      topWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: screenW * .15,
              backgroundImage: NetworkImage(doctorInfo.image),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: screenW * .2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    doctorInfo.name,
                    style: textStyleWhite,
                  ),
                  Text(
                    doctorInfo.speciality,
                    style: textStyleWhite,
                  ),
                  Text(
                    doctorInfo.hospitalName,
                    style: textStyleWhite,
                  ),
                  RatingBar.builder(
                    initialRating: doctorInfo.rating,
                    // minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 20,

                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 5,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("About", style: textStyle),
            SizedBox(
              height: screenW * .05,
            ),
            Text(
              doctorInfo.about,
            ),
            SizedBox(
              height: screenW * .05,
            ),
            Text(
              "Available Times",
              style: textStyle,
            ),
            SizedBox(
              height: screenW * .05,
            ),
            Column(
              children: [
                for (int i = 0; i < doctorInfo.availableTimes.length; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = i;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: selectedTime == i
                                  ? Color(0xffF36262)
                                  : textColor2),
                          borderRadius: BorderRadius.circular(150)),
                      height: screenW * .1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            doctorInfo.availableTimes[i].day,
                            // style: textStyleWhite,
                          ),
                          Text(
                            doctorInfo.availableTimes[i].time,
                            // style: textStyleWhite,
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(
              height: screenW * .1,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/appointment");
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text("Make Appointment", style: textStyleWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
