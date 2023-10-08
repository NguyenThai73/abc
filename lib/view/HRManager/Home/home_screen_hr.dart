// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/employee_management.dart';
import 'package:staras_manager/view/HRManager/LeaveManagement/leave_management.dart';
import 'package:staras_manager/view/HRManager/NotiBoard/notice_list.dart';
import 'package:staras_manager/view/HRManager/Notification/notification_of_hr.dart';
import 'package:staras_manager/view/HRManager/OvertimeManagement/overtime_management_request.dart';
import 'package:staras_manager/view/HRManager/ProfileScreen/profile_hr_screen.dart';
import 'package:staras_manager/view/HRManager/WorkScheduleOfEmployee/work_schedule.dart';
import '../../../components/button_global.dart';
import '../../../components/purchase_model.dart';

class HomeHrScreen extends StatefulWidget {
  const HomeHrScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeHrScreenState createState() => _HomeHrScreenState();
}

class _HomeHrScreenState extends State<HomeHrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage('images/person.jpg'),
          ),
          title: Text(
            'Hi, Le Van Tien',
            style: kTextStyle.copyWith(color: Colors.white, fontSize: 12.0),
          ),
          subtitle: Text(
            'Good Morning',
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: context.height() / 2.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
                color: kMainColor,
              ),
              child: Column(
                children: [
                  Container(
                    height: context.height() / 4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          const CircleAvatar(
                            radius: 60.0,
                            backgroundColor: kMainColor,
                            backgroundImage: AssetImage(
                              'images/emp1.png',
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Le Van Tien',
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Employee',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ],
                      ).onTap(() {
                        // const ProfileScreen().launch(context);
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 10.0,
                                bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              border: Border.all(color: Colors.white),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.6),
                                  Colors.white.withOpacity(0.0),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '22',
                                  style: kTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Text(
                                //   'days',
                                //   style:
                                //       kTextStyle.copyWith(color: Colors.white),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            'Employee',
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 10.0,
                                bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              border: Border.all(color: Colors.white),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.6),
                                  Colors.white.withOpacity(0.0),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '30',
                                  style: kTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Text(
                                //   'days',
                                //   style:
                                //       kTextStyle.copyWith(color: Colors.white),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            'Manager',
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 10.0,
                                bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              border: Border.all(color: Colors.white),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.6),
                                  Colors.white.withOpacity(0.0),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '5',
                                  style: kTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Text(
                                //   'days',
                                //   style:
                                //       kTextStyle.copyWith(color: Colors.white),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            'Total File',
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () => const ProfileHrScreen().launch(context),
              title: Text(
                'Hr Profile',
                style: kTextStyle.copyWith(color: kTitleColor),
              ),
              leading: const Icon(
                FeatherIcons.user,
                color: kMainColor,
              ),
            ),
            ListTile(
              onTap: () => const NNotificationHrScreen().launch(context),
              title: Text(
                'Notification',
                style: kTextStyle.copyWith(color: kTitleColor),
              ),
              leading: const Icon(
                FeatherIcons.bell,
                color: kMainColor,
              ),
            ),
            ListTile(
              title: Text(
                'Terms & Conditions',
                style: kTextStyle.copyWith(color: kTitleColor),
              ),
              leading: const Icon(
                Icons.info_outline,
                color: kMainColor,
              ),
            ),
            ListTile(
              title: Text(
                'Privacy Policy',
                style: kTextStyle.copyWith(color: kTitleColor),
              ),
              leading: const Icon(
                FeatherIcons.alertTriangle,
                color: kMainColor,
              ),
            ),
            ListTile(
              title: Text(
                'Logout',
                style: kTextStyle.copyWith(color: kTitleColor),
              ),
              leading: const Icon(
                FeatherIcons.logOut,
                color: kMainColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 720.0,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () async {
                              bool isValid =
                                  await PurchaseModel().isActiveBuyer();
                              if (isValid) {
                                // ignore: use_build_context_synchronously
                                const EmployeeManagement().launch(context);
                              } else {
                                showLicense(context: context);
                              }
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFFFD72AF),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          'images/employeeattendace.png')),
                                  Text(
                                    'Employee',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Management',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () {
                              const WorkSchedule().launch(context);
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFF7C69EE),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          'images/employeedirectory.png')),
                                  Text(
                                    'Work Schedule',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Of Employee ',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () {
                              const LeaveManagement().launch(context);
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFF4ACDF9),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage('images/leave.png')),
                                  Text(
                                    'Leave',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Management',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () {
                              const OvertimeManagement().launch(context);
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFF02B984),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image:
                                          AssetImage('images/workreport.png')),
                                  Text(
                                    'Overtime',
                                    maxLines: 2,
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Management',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFFFD72AF),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () {
                          const LeaveManagement().launch(context);
                        },
                        leading: const Image(
                            image: AssetImage('images/salarymanagement.png')),
                        title: Text(
                          'Leave Management',
                          maxLines: 2,
                          style: kTextStyle.copyWith(
                              color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFF1CC389),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () => const NoticeList().launch(context),
                        leading: const Image(
                            image: AssetImage('images/noticeboard.png')),
                        title: Text(
                          'Notice Board',
                          maxLines: 2,
                          style: kTextStyle.copyWith(
                              color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
