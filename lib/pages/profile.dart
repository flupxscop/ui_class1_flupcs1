import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ui_class1_flupcs1/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:ui_class1_flupcs1/models/response/customerIdxGetRes.dart';

class ProfilePage extends StatefulWidget {
  final int idx;
  ProfilePage({super.key, required this.idx});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String url = '';
  late Future<void> loadData;
  late CustomerIdxGetResponse customerIdxGetResponse;
  TextEditingController nameCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController imageCtl = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              delete(widget.idx);
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('ยกเลิกสมาชิก'),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
          future: loadData,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                        child: Image.network(
                          customerIdxGetResponse.image,
                          width: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 8),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ชื่อ-นามสกุล'),
                              ],
                            ),
                            TextField(
                              controller: nameCtl,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('หมายเลขโทรศัพท์'),
                              ],
                            ),
                            TextField(
                              controller: phoneCtl,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('อีเมล'),
                              ],
                            ),
                            TextField(
                              controller: emailCtl,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('รูปภาพ'),
                              ],
                            ),
                            TextField(
                              controller: imageCtl,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: FilledButton(
                                  onPressed: () => updateprofile(),
                                  child: const Text('บันทึกข้อมูล')),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }

  Future<void> loadDataAsync() async {
    var config = await Configuration.getConfig();
    url = config['apiEndpoint'];
    var res = await http.get(Uri.parse('$url/customers/${widget.idx}'));
    log(res.body);
    customerIdxGetResponse = customerIdxGetResponseFromJson(res.body);
    nameCtl.text = customerIdxGetResponse.fullname;
    phoneCtl.text = customerIdxGetResponse.phone;
    emailCtl.text = customerIdxGetResponse.email;
    imageCtl.text = customerIdxGetResponse.image;
  }

  void updateprofile() async {
    var json = {
      "fullname": nameCtl.text,
      "phone": phoneCtl.text,
      "email": emailCtl.text,
      "image": imageCtl.text
    };
    var config = await Configuration.getConfig();
    url = config['apiEndpoint'];
    try {
      var value = await http.put(Uri.parse("$url/customers/${widget.idx}"),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: jsonEncode(json));
      log(value.body);
      if (value.body.isNotEmpty) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    "สำเร็จ",
                    style: TextStyle(color: Colors.green),
                  ),
                  icon: Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                  ),
                  content: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "บันทึกข้อมูลสำเร็จ",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  actions: [
                    FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('ปิด'))
                  ],
                ));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                  "ผิดพลาด",
                  style: TextStyle(color: Colors.red),
                ),
                content: const Text("บันทึกข้อมูลไม่สำเร็จ"),
                icon: Icon(Icons.error_outline, color: Colors.red),
                actions: [
                  FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('ปิด'))
                ],
              ));
    }
  }

  void delete(int idx) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'ยืนยันการยกเลิกสมาชิก?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ปิด')),
              FilledButton(
                  onPressed: () async {
                    try {
                      var config = await Configuration.getConfig();
                      var url = config['apiEndpoint'];
                      var res = await http
                          .delete(Uri.parse('$url/customers/${widget.idx}'));
                      log(res.statusCode.toString());
                      Navigator.popUntil(context, (route) => route.isFirst);
                    } catch (e) {
                      log(e.toString());
                    }
                  },
                  child: const Text('ยืนยัน'))
            ],
          ),
        ],
      ),
    );
  }
}
