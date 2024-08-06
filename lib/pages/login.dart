import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_class1_flupcs1/config/config.dart';
import 'package:ui_class1_flupcs1/config/internal_config.dart';
import 'package:ui_class1_flupcs1/models/request/customersLoginPostReq.dart';
import 'package:ui_class1_flupcs1/models/response/customersLoginPostRes.dart';
import 'package:ui_class1_flupcs1/pages/register.dart';
import 'package:ui_class1_flupcs1/pages/showtrip.dart';
import 'package:http/http.dart' as http;
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String url="";
  String status='';
  int loginTime=0;
  String PhonNumber='';
  TextEditingController PhoneNOCtl=TextEditingController();
  TextEditingController PasswordCtl=TextEditingController();
  
  //เป็นฟังก์ชันทำงานครั้งเดียวเท่านั้น
  //แล้วจะไม่ทำงานตรงsetstate
  //สั่งทำงานเป็น async await ไม่ได้
  @override
  void initState() {
    super.initState();
  Configuration.getConfig().then((value){
    url=value['apiEndpoint'].toString();
  },);

  }
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
                      Text('หมายเลขโทรศัพท์',style: TextStyle(fontSize: 18),),
                    ],
                  ),
                   TextField(
                    controller: PhoneNOCtl,
                      decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide(width: 1)))),
                   Padding(
                    padding:  const EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child:  Column(
                      children: [
                         const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('รหัสผ่าน',style: TextStyle(fontSize: 18),),
                          ],
                        ),
                         TextField(
                          controller: PasswordCtl,
                          obscureText: true,
                          decoration: const InputDecoration(
                                border:
                                    OutlineInputBorder(borderSide: BorderSide(width: 1)))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed:(){register();}, child: const Text('ลงทะเบียนใหม่',style: TextStyle(fontSize: 18),)),
                      FilledButton(onPressed: () {login();}, child: const Text('เข้าสู่ระบบ',style: TextStyle(fontSize: 18),)),
                    ],
                  ),
                  Padding(
                    padding:  const EdgeInsets.fromLTRB(0, 60, 0, 20),
                    child: OutlinedButton(onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('sign in with google',style: TextStyle(fontSize: 18),),
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
    log(PhoneNOCtl.text);
    // if(PhonNOCtl.text=='0812345678' && PasswordCtl.text=='1234'){
    //     Navigator.push(context,MaterialPageRoute(builder:(context)=>const ShowTripPage()),);
    // }else{
    //   setState(() {
    //     status='phone number or password incorrect';
    //   });
    // }
    var data={"phone":"0817399999","password":"1111"};
    // CustomersLoginPostRequest loginCustomer= customersLoginPostRequestFromJson(json.encode(data));
    CustomersLoginPostRequest login = CustomersLoginPostRequest(phone: PhoneNOCtl.text, password: PasswordCtl.text);
    http.post(Uri.parse('$API_ENDPOINT/customers/login'),
    headers: {"Content-Type": "application/json; charset=utf-8"},
    body:customersLoginPostRequestToJson(login)).then((value) {
      //ทำได้แต่ไม่แนะนำ
      // var jsonRes= jsonDecode(value.body);
      // log(jsonRes['customer']['image']);
    CustomersLoginPostResponse customer = customersLoginPostResponseFromJson(value.body);
    log(customer.customer.email);
    
    log(value.body);
    if(value.body!= ""){
      Navigator.push(context,MaterialPageRoute(builder:(context)=>const ShowTripPage()),);
    }
    });
    // http.get(Uri.parse('http://10.34.40.12:3000/customers')).then((value) {
    //   log(value.body);
    // });
    
  }
}