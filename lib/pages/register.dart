import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_class1_flupcs1/config/config.dart';
import 'package:ui_class1_flupcs1/models/request/customersRegisterPostReq.dart';
import 'package:http/http.dart' as http;
import 'package:ui_class1_flupcs1/models/response/customersGetRes.dart';
import 'package:ui_class1_flupcs1/models/response/customersRegisterPostRes.dart';
import 'package:ui_class1_flupcs1/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController NameCtl = TextEditingController();
  TextEditingController PhoneNOCtl = TextEditingController();
  TextEditingController EmailCtl = TextEditingController();
  TextEditingController PasswordCtl = TextEditingController();
  TextEditingController Re_passwordCtl = TextEditingController();
  TextEditingController ImageCtl = TextEditingController();
  String url='';

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then((value) {
      url=value['apiEndpoint'].toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ลงทะเบียนสมาชิกใหม่'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://icons.veryicon.com/png/o/miscellaneous/rookie-official-icon-gallery/225-default-avatar.png'),
                    ),
                    Positioned(
                      child: IconButton(
                      onPressed: () {SelectIMG(ImageSource.gallery);},
                      icon: Icon(Icons.add_a_photo_outlined),),
                      bottom: -10,
                      left:80
                      )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อ-นามสกุล',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                TextField(
                  controller: NameCtl,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'หมายเลขโทรศัพท์',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: PhoneNOCtl,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'อีเมล์',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: EmailCtl,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'รหัสผ่าน',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: PasswordCtl,
                  obscureText: true,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ยืนยันรหัสผ่าน',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: Re_passwordCtl,
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'รูปภาพ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: ImageCtl,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: FilledButton(
                      onPressed: () {
                        register();
                      },
                      child: const Text(
                        'สมัครสมาชิก',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'หากมีบัญชีอยู่แล้ว?',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {
                            Login();
                          },
                          child: const Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(fontSize: 18),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void register() {
    if (NameCtl.text != "" &&
        EmailCtl.text != "" &&
        PhoneNOCtl.text != "" &&
        PasswordCtl.text != "" &&
        Re_passwordCtl.text != "") {
      http.get(Uri.parse("$url/customers")).then((res) {
        List<CustomersGetResponse> datum =
            customersGetResponseFromJson(res.body);
        bool emailExists = datum.any((user) => user.email == EmailCtl.text);
        bool phoneExists = datum.any((user) => user.phone == PhoneNOCtl.text);
        if (emailExists) {
          setState(() {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Center(child: Text("Email is already")),
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.red,
                      size: 50,
                    ),
                    actions: [
                      Center(
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          child: const Text("ok"),
                        ),
                      ),
                    ],
                  );
                });
          });
        } else if (phoneExists) {
          setState(() {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Center(child: Text("Phone is Exist")),
                    icon: const Icon(
                      Icons.phone_android_outlined,
                      color: Colors.red,
                      size: 50,
                    ),
                    actions: [
                      Center(
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          child: const Text("ok"),
                        ),
                      ),
                    ],
                  );
                });
          });
        } else {
          if (PasswordCtl.text == Re_passwordCtl.text) {
            CustomersRegisterPostRequest register =
                CustomersRegisterPostRequest(
                    fullname: NameCtl.text,
                    phone: PhoneNOCtl.text,
                    email: EmailCtl.text,
                    image: ImageCtl.text,
                    password: PasswordCtl.text);
            http
                .post(Uri.parse("$url/customers"),
                    headers: {
                      "Content-Type": "application/json; charset=utf-8"
                    },
                    body: customersRegisterPostRequestToJson(register))
                .then((value) {
              CustomersRegisterPostResponse customer =
                  customersRegisterPostResponseFromJson(value.body);
              log(customer.id.toString());
              log(value.body);
              if (value.body != "") {
                if (customer.id.toString() != "") {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Success register"),
                            icon: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 50,
                            ),
                            content: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("please login your account"),
                              ],
                            ),
                            actions: <Widget>[
                              Center(
                                child: FilledButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green)),
                                    child: const Text("ok")),
                              )
                            ],
                          );
                        });
                  });
                }
              }
            });
          } else {
            setState(() {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Center(child: Text("Password not matched")),
                      icon: const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 50,
                      ),
                      actions: [
                        Center(
                          child: FilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red)),
                            child: const Text("ok"),
                          ),
                        ),
                      ],
                    );
                  });
            });
          }
        }
      });
    } else {
      setState(() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Center(child: Text("Register not success")),
                icon: const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 50,
                ),
                content:
                    const Text("Please fill out the information completely!"),
                actions: [
                  Center(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      child: const Text("ok"),
                    ),
                  ),
                ],
              );
            });
      });
    }
  }

  void Login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
  
  SelectIMG(ImageSource source) async {
    final  ImagePicker _imagepPicker =ImagePicker();
    XFile? _file =await _imagepPicker.pickImage(source: source);
    if(_file!=null){
      return _file.readAsBytes();
    }
  }
}
