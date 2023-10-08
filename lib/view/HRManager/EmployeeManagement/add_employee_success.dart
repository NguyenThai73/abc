import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/components/button_global.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/send_account.dart';

class AddEmployeeSuccess extends StatefulWidget {
  const AddEmployeeSuccess({Key? key}) : super(key: key);

  @override
  _AddEmployeeSuccessState createState() => _AddEmployeeSuccessState();
}

class _AddEmployeeSuccessState extends State<AddEmployeeSuccess> {
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
          'Add Employee Success',
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
                            trailing: Text(
                              '19 July, 2023',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ),
                          Divider(
                            color: kBorderColorTextField.withOpacity(0.2),
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Employee Login Details',
                            style: kTextStyle.copyWith(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            'Username: hungdeptrai',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          Text(
                            'Password: hung123123',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  // Send Account Butto~n
                  ButtonGlobal(
                    buttontext: 'Send Account to Employee',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: () {
                      // sending the account details here
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const SendAccount(), // Thay AddEmployee() bằng màn hình AddEmployee của bạn
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
