import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/model/login_model.dart';
import 'package:staras_manager/view/Authentication/forgot_password.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:staras_manager/view/HRManager/Home/home_screen_hr.dart';
import '../../components/button_global.dart';

class SignInHr extends StatefulWidget {
  const SignInHr({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInHrState createState() => _SignInHrState();
}

class _SignInHrState extends State<SignInHr> {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  bool isChecked = false;

  TextEditingController usernameController = TextEditingController(text: "hgtrg102");
  TextEditingController passwordController = TextEditingController(text: "abc");

  Future<void> loginHR() async {
    const String apiUrl = 'https://staras-api.smjle.vn/api/login';

    // Create a Map to represent the login request payload
    final Map<String, dynamic> loginData = {
      'username': usernameController.text,
      'password': passwordController.text,
      'roleId': 2,
    };

    // Convert the Map to JSON
    final String jsonBody = jsonEncode(loginData);

    try {
      // Make the API request
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final LoginModel loginModel = LoginModel.fromJson(responseData['data']);
        final String? accessToken = loginModel.token?.accessToken;
        final int? accountId = loginModel.account?.id;
        final int? hrRoleId = loginModel.account?.roleId;
        const int ROLE_HR = 2;

        if (accessToken != null) {
          //save access token
          await _secureStorage.write(key: 'access_token', value: accessToken);
          await _secureStorage.write(
              key: 'accountId', value: accountId.toString());

          if (hrRoleId == ROLE_HR) {
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeHrScreen()),
            );
          } else {
            // ignore: use_build_context_synchronously
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Unauthorized Access'),
                  content: const Text('You are not authorized as HR.'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        } else {
          print('Access Token Not found on the response');
        }
      } else {
        print('Error: ${response.statusCode}');
        print('Body: ${response.body}');
      }
    } catch (e) {
      // Handle network or other errors
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Sign In',
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Sign In with Role HR Management',
              style: kTextStyle.copyWith(color: Colors.white),
            ),
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
                    height: 5.0,
                  ),
                  SizedBox(
                    height: size.height * 0.3, // Adjust the height as needed
                    child: Lottie.asset(
                      "assets/animation_lne4e59w.json",
                      fit: BoxFit.contain, // Adjust the fit as needed
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 60.0,
                    child: AppTextField(
                      controller: usernameController,
                      textFieldType: TextFieldType.USERNAME,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter Username',
                        labelStyle: kTextStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    controller: passwordController,
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: kTextStyle,
                      hintText: 'Enter your password',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: isChecked,
                          activeColor: kMainColor,
                          thumbColor: kGreyTextColor,
                          onChanged: (bool value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Save Me',
                        style: kTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        'Forgot Password?',
                        style: kTextStyle,
                      ).onTap(() {
                        const ForgotPassword().launch(context);
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                      buttontext: 'Sign In',
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () {
                        loginHR();
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
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
