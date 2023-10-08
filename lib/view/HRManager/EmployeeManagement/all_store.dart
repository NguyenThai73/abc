// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/model/store_model.dart';
import 'package:http/http.dart' as http;
import 'package:staras_manager/view/HRManager/EmployeeManagement/employee_in_store.dart';

class GetAllStore extends StatefulWidget {
  const GetAllStore({Key? key}) : super(key: key);

  @override
  _GetAllStoreState createState() => _GetAllStoreState();
}

class _GetAllStoreState extends State<GetAllStore> {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  List<StoreModel> stores = [];
  @override
  void initState() {
    super.initState();
    fetchStoreData();
  }

  Future<String?> readAccessToken() async {
    return await _secureStorage.read(key: 'access_token');
  }

  Future<void> fetchStoreData() async {
    const apiUrl = 'https://staras-api.smjle.vn/api/store?ticks=0';

    // Read the access token from secure storage
    final String? accessToken = await readAccessToken();

    print(accessToken);

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (kDebugMode) {
          print(responseData);
        }

        if (responseData.containsKey('data')) {
          // Check if the 'data' key exists in the response
          final List<dynamic> storeData = responseData['data'];

          final List<StoreModel> storeList =
              storeData.map((json) => StoreModel.fromJson(json)).toList();

          setState(() {
            stores = storeList; // Update the employee list
          });
        } else {
          print(
              'API Error: Response does not contain the expected data structure.');
        }
      } else {
        print('API Error: ${response.statusCode}, ${response.body}');
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error call store data. Please try again later.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

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
          'List Store',
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
                    height: 15.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: stores.length,
                      itemBuilder: (context, index) {
                        final store = stores[index];
                        return Column(
                          children: [
                            Material(
                              elevation: 2.0,
                              child: Container(
                                width: context.width(),
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromARGB(255, 137, 188, 9),
                                      width: 3.0,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         const EmployeeInStore(),
                                    //   ),
                                    // );
                                  },
                                  // leading: CircleAvatar(
                                  //   backgroundImage: NetworkImage(
                                  //       employee.profileImage ?? ""),
                                  // ),
                                  title: Text(
                                    store.storeName ?? '',
                                    maxLines: 2,
                                    style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    store.address ?? '',
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
