import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/constants/constant.dart';

class ApproveLeaveApplication extends StatefulWidget {
  const ApproveLeaveApplication({Key? key}) : super(key: key);

  @override
  _ApproveLeaveApplicationState createState() =>
      _ApproveLeaveApplicationState();
}

class _ApproveLeaveApplicationState extends State<ApproveLeaveApplication> {
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
          'Approve Leave Application',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
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
              width: context.width(),
              height: 720,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Image.asset('images/emp1.png'),
                            title: Text(
                              'Truong Hiep Hung',
                              style: kTextStyle,
                            ),
                            subtitle: Text(
                              'Employee',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.all(
                                  8.0), // Điều này tạo ra một khoảng trắng xung quanh văn bản
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 167, 200, 224)
                                    .withOpacity(
                                        0.5), // Màu nền mờ nhạt (ở đây là màu xám với độ mờ 50%)
                                borderRadius:
                                    BorderRadius.circular(4.0), // Độ cong viền
                              ),
                              child: Center(
                                child: Text(
                                  'Sick',
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: kBorderColorTextField.withOpacity(0.2),
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'FromDate',
                                    style: kTextStyle.copyWith(
                                        color: kBlackTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    '15 July, 2023', // Thay đổi giá trị tương ứng
                                    style: kTextStyle,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ToDate',
                                    style: kTextStyle.copyWith(
                                        color: kBlackTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    '15 July, 2023', // Thay đổi giá trị tương ứng
                                    style: kTextStyle,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'LeaveDate',
                                    style: kTextStyle.copyWith(
                                        color: kBlackTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    'FullDay ', // Thay đổi giá trị tương ứng
                                    style: kTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  // Xử lý sự kiện khi nút "Approve" được nhấn
                                },
                                height: 45,
                                minWidth: 120.0,
                                color: Colors.green,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Đặt bán kính bo tròn tại đây
                                ),
                                child: const Text(
                                    'Approve'), // Văn bản của nút "Approve"
                              ),
                              MaterialButton(
                                onPressed: () {
                                  // Xử lý sự kiện khi nút "Reject" được nhấn
                                },
                                height: 45,
                                minWidth: 120.0,
                                color: Colors.red, // Màu nền của nút "Reject"
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Text('Reject'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
