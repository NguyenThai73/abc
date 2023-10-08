import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/edit_profile_employee.dart';

import '../../../Controllers/UserProfileController.dart';
import '../../../constants/api_consts.dart';
import '../../../model/UserDataModel.dart';

class ProfileEmployeeScreen extends StatefulWidget {
  final int id;
  const ProfileEmployeeScreen({Key? key, required this.id}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileEmployeeScreenState createState() => _ProfileEmployeeScreenState();
}

class _ProfileEmployeeScreenState extends State<ProfileEmployeeScreen> {
  // Tạo một biến để kiểm soát việc hiển thị modal
  bool _isDeleteConfirmationVisible = false;
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
        citizenId: "string",
        fullName: userData?.citizenIdentificationCardResponse?.fullName ?? '',
        dateOfBirth: userData!.citizenIdentificationCardResponse!.dateOfBirth,
        sex: gerderText.text,
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

  // Hàm để hiển thị modal xác nhận xóa
  // 1. Tạo hàm hiển thị dialog xác nhận xóa
  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text('Confirm employee deletion'),
          content: const Text('Are you sure you want to delete this employee?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Đóng dialog
                Navigator.of(context).pop();

                // Xử lý xóa nhân viên ở đây
              },
              child: const Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                // Đóng dialog
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Tạo một biến để kiểm soát việc hiển thị modal
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
          'Profile',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Image(
            image: AssetImage('images/editprofile.png'),
          ).onTap(() {
            // const EditProfileEmployeeScreen().launch(context);
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
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
              CircleAvatar(
                radius: 60.0,
                backgroundColor: kMainColor,
                backgroundImage: NetworkImage(userData?.profileImage ?? ''),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppTextField(
                readOnly: true,
                controller: nameText,
                textFieldType: TextFieldType.NAME,
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
                readOnly: true,
                controller: companyText,
                textFieldType: TextFieldType.NAME,
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
                readOnly: true,
                controller: emailText,
                textFieldType: TextFieldType.EMAIL,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'hung0506@gmail.com',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.PHONE,
                controller: phoneText,
                readOnly: true,
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
                readOnly: true,
                textFieldType: TextFieldType.NAME,
                controller: companyText,
                decoration: const InputDecoration(
                  labelText: 'Company Address',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '112/3 Mai chi Tho',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                controller: gerderText,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Male',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                readOnly: true,
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
                readOnly: true,
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
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Để căn giữa hai nút
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nút xóa nhân viên được nhấn

                      // Hiển thị modal xác nhận xóa khi nút "Delete" được nhấn
                      _showDeleteConfirmationDialog();
                    },
                    child: const Text('Delete'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nút chỉnh sửa thông tin nhân viên được nhấn
                      // Điều hướng đến màn hình chỉnh sửa thông tin nhân viên
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditProfileEmployee(
                            id: widget.id,
                          ),
                        ),
                      );
                    },
                    child: const Text('Edit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
