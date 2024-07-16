import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_class1_flupcs1/pages/register.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String status='';
  int loginTime=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             GestureDetector(child: Image.asset('assets/image/logo.png')),
              Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('หมายเลขโทรศัพท์'),
                    ],
                  ),
                  const TextField(
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide(width: 1)))),
                  const Padding(
                    padding:  EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child:  Column(
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('รหัสผ่าน'),
                          ],
                        ),
                         TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                                border:
                                    OutlineInputBorder(borderSide: BorderSide(width: 1)))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed:(){register();}, child: const Text('ลงทะเบียนใหม่')),
                      FilledButton(onPressed: () {login();}, child: const Text('เข้าสู่ระบบ')),
                    ],
                  ),
                  Padding(
                    padding:  const EdgeInsets.fromLTRB(0, 60, 0, 20),
                    child: OutlinedButton(onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('sign in with google'),
                        Image.network('https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',width: 24)
                      ],
                    )),
                  ),
                   Text(status),
                ],
              ),
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
            //         FilledButton(onPressed: (){}, child: const Text ('Fill button')),
            //         OutlinedButton(onPressed: (){}, child: const Text ('Outline button')),
            //         TextButton(onPressed: (){}, child: const Text('Text button')),
            //         IconButton(onPressed: (){}, icon: const Icon(Icons.access_alarm)),
            //         Image.asset('assets/image/crybaby.jpg'),
            //         Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2-TVphB148wg1omRxgqXTMk9lDbLyunCmdw&s'),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      )
      // SizedBox(
      //   width: MediaQuery.of(context).size.width,
      //   child: Container(
      //     color: const Color.fromARGB(194, 250, 250, 213),
      //     child:  Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             SizedBox(width:100,height: 100,child: Container(color: Colors.blue,),),
      //           ],
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             SizedBox(width:100,height: 100,child: Container(color: Colors.purple,),),
      //             Row(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 20.0, right: 20),
      //                   child: SizedBox(width:100,height: 100,child: Container(color: Colors.red,),),
      //                 ),
      //                 SizedBox(width:100,height: 100,child: Container(color:Colors.amber),),
      //               ],
      //             ),
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  void register() {
    // setState(() {
    //   status='register successfully';
    // });
    Navigator.push(context,MaterialPageRoute(builder:(context)=>const RegisterPage()),
    );
  }

  
  void login() {  
    loginTime++;
    setState(() {
        status='Login time : $loginTime';
    });
  }
}