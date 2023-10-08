// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/components/button_global.dart';
import 'package:staras_manager/constants/api_consts.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/model/UserDataModel.dart';

import '../../../Controllers/UserProfileController.dart';

class EditProfileEmployee extends StatefulWidget {
  int id;
  EditProfileEmployee({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _EditProfileEmployeeState createState() => _EditProfileEmployeeState();
}

class _EditProfileEmployeeState extends State<EditProfileEmployee> {
  String gender = 'Male';
  TextEditingController nameText = TextEditingController();
  TextEditingController companyText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController companyAddressText = TextEditingController();
  TextEditingController gerderText = TextEditingController();
  TextEditingController usernameText = TextEditingController();
  TextEditingController passText = TextEditingController();
  bool loading = false;
  UserData? userData;
  @override
  void initState() {
    super.initState();
    Get_UserProfile();
  }

  Put_UserProfile() async {
    UserData Data = new UserData(
      name: nameText.text,
      phone: phoneText.text,
      email: emailText.text,
      currentAddress: userData?.currentAddress ?? "",
      companyId: userData?.companyId ?? 0,
      profileImage: userData?.profileImage ?? "",
      active: userData?.active ?? false,
      citizenIdentificationCardResponse: new CitizenIdentificationCardResponse(
        citizenId: userData?.citizenIdentificationCardResponse?.citizenId ?? '',
        fullName: userData?.citizenIdentificationCardResponse?.fullName ?? '',
        dateOfBirth: userData!.citizenIdentificationCardResponse!.dateOfBirth,
        sex: gender,
        nationality:
            userData?.citizenIdentificationCardResponse!.nationality ?? "",
        placeOfOrigin:
            userData!.citizenIdentificationCardResponse!.placeOfOrigin,
        placeOfResidence:
            userData?.citizenIdentificationCardResponse!.placeOfResidence ?? "",
        dateOfIssue: userData?.citizenIdentificationCardResponse!.dateOfIssue,
        issuedBy: userData?.citizenIdentificationCardResponse!.issuedBy,
      ),
    );

    ApiResponse response =
        await UserProfileController.UpdateUserProfile(Data, widget.id);
    if (response.error == null) {
      flutterToast(-1, "lỗi");
    } else {
      setState(() {
        loading = false;
      });
      flutterToast(-1, response.error.toString());
    }
  }

  Get_UserProfile() async {
    ApiResponse response = await UserProfileController.UserProfile(widget.id);
    if (response.error == null) {
      pasteJsonUserData(response.data as UserData);
    } else {
      setState(() {
        loading = false;
      });
      flutterToast(-1, response.error.toString());
    }
  }

  void pasteJsonUserData(UserData data) {
    setState(() {
      userData = data;
      nameText.text = data.citizenIdentificationCardResponse?.fullName ?? '';
      companyText.text = data.name ?? '';
      emailText.text = data.email ?? '';
      phoneText.text = data.phone ?? '';
      companyAddressText.text = data.name ?? '';
      gerderText.text = data.citizenIdentificationCardResponse?.sex ?? '';
      usernameText.text = data.name ?? '';
      passText.text = data.name ?? '';
    });
  }

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
          'Edit Profile Employee',
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
                  Image(
                    image: NetworkImage(userData?.profileImage ?? ''),
                  ).onTap(() {
                    // const EditProfileEmployeeScreen().launch(context);
                  }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: nameText,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Truong Hiep Hung',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: companyText,
                    decoration: const InputDecoration(
                      labelText: 'Company Name',
                      hintText: 'Staras',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    controller: emailText,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'hungabc@gmail.com',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    controller: phoneText,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '+8801767 432556',
                      labelStyle: kTextStyle,
                      border: const OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: companyAddressText,
                    decoration: const InputDecoration(
                      labelText: 'Company Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '112/3 Mai Chi Tho',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Select Gender',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getGender()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: usernameText,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Hungcholon',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: passText,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '123456789',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                    buttontext: 'Update',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: () {
                      Put_UserProfile();
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
