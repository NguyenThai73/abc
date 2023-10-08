// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/Controllers/api.dart';
import 'package:staras_manager/components/button_global.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/model/employe/employe.cccd.model.dart';
import 'package:staras_manager/model/employe/employe.request.model.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/add_employee_success.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  EmployeeRequestModel requestModel = EmployeeRequestModel(citizenIdentificationCardRequest: EmployeCCCDModel());

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController cccdId = TextEditingController();
  TextEditingController cccdFullName = TextEditingController();
  TextEditingController cccdBirth = TextEditingController();
  TextEditingController cccdGender = TextEditingController();
  TextEditingController cccdNationality = TextEditingController();
  TextEditingController cccdPlaceOfOrigrin = TextEditingController();
  TextEditingController cccdPlaceOfResidence = TextEditingController();
  TextEditingController cccdDateOfIssue = TextEditingController();
  TextEditingController cccdIsuedBy = TextEditingController();

  String gender = 'Male';

  DropdownButton<String> getGender() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String gender in genderList) {
      var item = DropdownMenuItem(
        value: gender,
        child: Text(gender),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    );
  }

  @override
  void dispose() {
    cccdBirth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Add Employee',
          maxLines: 2,
          style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Image(
                    image: AssetImage(
                      'images/employeeaddimage.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: name,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    controller: phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Phone Number',
                      labelStyle: kTextStyle,
                      border: const OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: email,
                    textFieldType: TextFieldType.EMAIL,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: address,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Citizen Identification Card Request",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: cccdId,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'CitizenId',
                      hintText: 'CitizenId',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: cccdFullName,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Fullname',
                      hintText: 'Fullname',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    readOnly: true,
                    onTap: () async {
                      var date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                      cccdBirth.text = date.toString().substring(0, 10);
                    },
                    controller: cccdBirth,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.date_range_rounded,
                          color: kGreyTextColor,
                        ),
                        labelText: 'Date Of Birth',
                        hintText: 'Date Of Birth'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: InputDecoration(floatingLabelBehavior: FloatingLabelBehavior.always, labelText: 'Select Gender', labelStyle: kTextStyle, border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                          child: DropdownButtonHideUnderline(child: getGender()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: cccdNationality,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Nationality',
                      hintText: 'Nationality',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: cccdPlaceOfOrigrin,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'PlaceOfOrigrin',
                      hintText: 'PlaceOfOrigrin',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: cccdPlaceOfResidence,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'PlaceOfResidence',
                      hintText: 'PlaceOfResidence',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    readOnly: true,
                    onTap: () async {
                      var date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                      cccdDateOfIssue.text = date.toString().substring(0, 10);
                    },
                    controller: cccdDateOfIssue,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(
                          Icons.date_range_rounded,
                          color: kGreyTextColor,
                        ),
                        labelText: 'Date Of Issue',
                        hintText: 'Date Of Issue'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: cccdIsuedBy,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Issued By',
                      hintText: 'Issued By',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                    buttontext: 'Add',
                    buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: () async {
                      requestModel = EmployeeRequestModel(
                        name: name.text,
                        phone: phone.text,
                        email: email.text,
                        currentAddress: address.text,
                        citizenIdentificationCardRequest: EmployeCCCDModel(citizenId: cccdId.text, fullName: cccdFullName.text, dateOfBirth: cccdBirth.text, sex: gender, nationality: cccdNationality.text, placeOfOrigrin: cccdPlaceOfOrigrin.text, placeOfResidence: cccdPlaceOfResidence.text, dateOfIssue: cccdDateOfIssue.text, issuedBy: cccdIsuedBy.text),
                      );
                      var response = await httpPost("/api/employee/hr-add-new-employee", requestModel.toJson());
                      print(response);
                      var bodyResponse = jsonDecode(response['body']);
                      if (bodyResponse['code'] == 200) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddEmployeeSuccess(), // Thay AddEmployee() bằng màn hình AddEmployee của bạn
                          ),
                        );
                      } else {
                        print("Loi roif");
                      }
                    }, // thêm sự kiện cho button
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
