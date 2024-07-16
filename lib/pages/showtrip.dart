import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowTripPage extends StatefulWidget {
  const ShowTripPage({super.key});

  @override
  State<ShowTripPage> createState() => _ShowTripPageState();
}

class _ShowTripPageState extends State<ShowTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการทริป'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('ปลายทาง',style: TextStyle(fontSize: 18),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: FilledButton(onPressed: (){}, child: const Text('ทั้งหมด')),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: FilledButton(onPressed: (){}, child: const Text('ไทย')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: FilledButton(onPressed: (){}, child: const Text('ลาว')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: FilledButton(onPressed: (){}, child: const Text('ญี่ปุ่น')),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: FilledButton(onPressed: (){}, child: const Text('อเมริกา')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: FilledButton(onPressed: (){}, child: const Text('เกาหลี')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: FilledButton(onPressed: (){}, child: const Text('จีน')),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            children: [
                              Card(
                                color: Color.fromARGB(194, 231, 228, 251),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                                          ],
                                        ),
                                      ),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('ประเทศไทย'),
                                              const Text('ระยะเวลา 10 วัน'),
                                              const Text('ราคา 10000 บาท'),
                                              FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                                            ],
                                    ),
                                  ],
                                           )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color.fromARGB(194, 231, 228, 251),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                                          ],
                                        ),
                                      ),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('ประเทศไทย'),
                                              const Text('ระยะเวลา 10 วัน'),
                                              const Text('ราคา 10000 บาท'),
                                              FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                                            ],
                                    ),
                                  ],
                                           )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color:Color.fromARGB(194, 243, 242, 247),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding:  EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                                          ],
                                        ),
                                      ),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('ประเทศไทย'),
                                              Text('ระยะเวลา 10 วัน'),
                                              Text('ราคา 10000 บาท'),
                                              FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                                            ],
                                    ),
                                  ],
                                           )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color.fromARGB(194, 231, 228, 251),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                                          ],
                                        ),
                                      ),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('ประเทศไทย'),
                                              Text('ระยะเวลา 10 วัน'),
                                              Text('ราคา 10000 บาท'),
                                              FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                                            ],
                                      ),
                                    ],
                                     )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color.fromARGB(194, 231, 228, 251),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                                          ],
                                        ),
                                      ),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('ประเทศไทย'),
                                              Text('ระยะเวลา 10 วัน'),
                                              Text('ราคา 10000 บาท'),
                                              FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                                            ],
                                    ),
                                  ],
                                           )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
             
            ],),
        ),
      ),
    );
  }
}