import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ลงทะเบียนสมาชิกใหม่'),
      ),
      body:SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('ชื่อ-นามสกุล',style: TextStyle(fontSize: 18),),
                ],
              ),
              const TextField(decoration: InputDecoration(
                border: OutlineInputBorder()
              ),),
              const Padding(
                padding:  EdgeInsets.fromLTRB(0, 20, 0, 0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('หมายเลขโทรศัพท์',style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
              const TextField(decoration: InputDecoration(
                border: OutlineInputBorder()
              ),),
              const Padding(
                padding:  EdgeInsets.fromLTRB(0, 20, 0, 0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('อีเมล์',style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
              const TextField(decoration: InputDecoration(
                border: OutlineInputBorder()
              ),),
              const Padding(
                padding:  EdgeInsets.fromLTRB(0, 20, 0, 0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('รหัสผ่าน',style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
              const TextField(decoration: InputDecoration(
                border: OutlineInputBorder()
              ),),
              const Padding(
                padding:  EdgeInsets.fromLTRB(0, 20, 0, 0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ยืนยันรหัสผ่าน',style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
              const TextField(decoration: InputDecoration(
                border: OutlineInputBorder()
              ),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: FilledButton(onPressed: (){}, child: const Text('สมัครสมาชิก',style: TextStyle(fontSize: 18),)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('หากมีบัญชีอยู่แล้ว?',style: TextStyle(fontSize: 18),),
                    TextButton(onPressed: (){}, child: const Text('เข้าสู่ระบบ',style: TextStyle(fontSize: 18),)),
                  ],
                ),
              )
            ],
            
          ),
        ),
      )
    );
  }
}