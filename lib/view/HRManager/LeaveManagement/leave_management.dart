// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/view/HRManager/LeaveManagement/approve_leave_application.dart';
import 'package:staras_manager/view/HRManager/LeaveManagement/leave_list_request.dart';

class LeaveManagement extends StatefulWidget {
  const LeaveManagement({Key? key}) : super(key: key);

  @override
  _LeaveManagementState createState() => _LeaveManagementState();
}

class _LeaveManagementState extends State<LeaveManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Leave Management',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
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
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFFFD73B0),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () {
                          const LeaveListRequest().launch(context);
                        },
                        leading: const Image(
                            image: AssetImage('images/leavemanagement.png')),
                        title: Text(
                          'Leave List',
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: GestureDetector(
                      onTap: () {
                        const ApproveLeaveApplication().launch(context);
                      },
                      child: Container(
                        width: context.width(),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF7D6AEF),
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          leading: const Image(
                              image: AssetImage('images/timeattendance.png')),
                          title: Text(
                            'Approve Leave Application',
                            maxLines: 2,
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
