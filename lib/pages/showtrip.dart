

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_class1_flupcs1/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:ui_class1_flupcs1/models/response/tripGetRes.dart';
import 'package:ui_class1_flupcs1/pages/profile.dart';
import 'package:ui_class1_flupcs1/pages/trip.dart';
class ShowTripPage extends StatefulWidget {
  final int cid;
  ShowTripPage({super.key,required this.cid});
  

  @override
  State<ShowTripPage> createState() => _ShowTripPageState();
}

class _ShowTripPageState extends State<ShowTripPage> {
  List<TripGetResponse> trips=[];
  late Future<void> loadData;
  String url='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //   Configuration.getConfig().then((value){
    // url=value['apiEndpoint'].toString();});
    // getTrips();
    loadData = loadDataAsync();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการทริป'),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>( 
          onSelected: (value) {
              log(value);
              if (value == 'profile') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  ProfilePage(idx: widget.cid,),
                ));
              } else if (value == 'logout') {
              Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('ข้อมูลส่วนตัว'),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('ออกจากระบบ'),
                )             
            ],)
        ],
      ),
      body: FutureBuilder(
        future: loadData,
        builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
        }
        return Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: FilledButton(onPressed: ()=>getTrips(null), child: const Text('ทั้งหมด')),
                        ),
                        Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: FilledButton(onPressed: ()=>getTrips('เอเชีย'), child: const Text('เอเชีย')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: FilledButton(onPressed: ()=>getTrips('ยุโรป'), child: const Text('ยุโรป')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: FilledButton(onPressed: ()=>getTrips('เอเชียตะวันออกเฉียงใต้'), child: const Text('อาเซียน')),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: FilledButton(onPressed: ()=>getTrips('ประเทศไทย'), child: const Text('ประเทศไทย')),
                      ),
                  
                      ],
                    ),
                  ),
                ),

                 Expanded(
                  child: SingleChildScrollView(
                    child:Column(
                      children: trips.map((trip){return 
                      Card(
                                  color: Color.fromARGB(194, 231, 228, 251),
                                  child: Padding(
                                    padding:  EdgeInsets.fromLTRB(10, 20, 10, 20),
                                    child: Column(
                                      children: [
                                         Padding(
                                          padding:  EdgeInsets.fromLTRB(0, 0, 0, 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(trip.name,style: TextStyle(fontSize: 22),),
                                            ],
                                          ),
                                        ),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.network(trip.coverimage,width: 150,errorBuilder: (context,error,stackTrace)=>const Center(child:Text('Not found image')),),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                 Text(trip.destinationZone),
                                                 Text("ระยะเวลา "+trip.duration.toString()),
                                                 Text(trip.price.toString()),
                                                FilledButton(onPressed: ()=>goToTripPage(trip.idx), child: const Text('รายละเอียดเพิ่มเติม')),
                                              ],
                                      ),
                                    ],
                                             )
                                      ],
                                    ),
                                  ),
                                );
                      },).toList(),
                    )
                    // children: [
                    //   Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    //         child: Column(
                    //           children: [
                    //             Card(
                    //               color: Color.fromARGB(194, 231, 228, 251),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //                 child: Column(
                    //                   children: [
                    //                     const Padding(
                    //                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         children: [
                    //                           Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                      Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                    //                         Column(
                    //                           crossAxisAlignment: CrossAxisAlignment.start,
                    //                           children: [
                    //                             const Text('ประเทศไทย'),
                    //                             const Text('ระยะเวลา 10 วัน'),
                    //                             const Text('ราคา 10000 บาท'),
                    //                             FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                    //                           ],
                    //                   ),
                    //                 ],
                    //                          )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Card(
                    //               color: Color.fromARGB(194, 231, 228, 251),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //                 child: Column(
                    //                   children: [
                    //                     const Padding(
                    //                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         children: [
                    //                           Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                      Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                    //                         Column(
                    //                           crossAxisAlignment: CrossAxisAlignment.start,
                    //                           children: [
                    //                             const Text('ประเทศไทย'),
                    //                             const Text('ระยะเวลา 10 วัน'),
                    //                             const Text('ราคา 10000 บาท'),
                    //                             FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                    //                           ],
                    //                   ),
                    //                 ],
                    //                          )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Card(
                    //               color:Color.fromARGB(194, 243, 242, 247),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //                 child: Column(
                    //                   children: [
                    //                     const Padding(
                    //                       padding:  EdgeInsets.fromLTRB(0, 0, 0, 20),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         children: [
                    //                           Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                      Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                    //                         Column(
                    //                           crossAxisAlignment: CrossAxisAlignment.start,
                    //                           children: [
                    //                             Text('ประเทศไทย'),
                    //                             Text('ระยะเวลา 10 วัน'),
                    //                             Text('ราคา 10000 บาท'),
                    //                             FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                    //                           ],
                    //                   ),
                    //                 ],
                    //                          )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Card(
                    //               color: Color.fromARGB(194, 231, 228, 251),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //                 child: Column(
                    //                   children: [
                    //                     Padding(
                    //                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         children: [
                    //                           Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                      Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                    //                         Column(
                    //                           crossAxisAlignment: CrossAxisAlignment.start,
                    //                           children: [
                    //                             Text('ประเทศไทย'),
                    //                             Text('ระยะเวลา 10 วัน'),
                    //                             Text('ราคา 10000 บาท'),
                    //                             FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                    //                           ],
                    //                     ),
                    //                   ],
                    //                    )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Card(
                    //               color: Color.fromARGB(194, 231, 228, 251),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //                 child: Column(
                    //                   children: [
                    //                     Padding(
                    //                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.start,
                    //                         children: [
                    //                           Text('วัดอรุณราชวรารามราชวรมหาวิหาร',style: TextStyle(fontSize: 22),),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                      Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Image.network('https://lh5.googleusercontent.com/p/AF1QipNFnjBjDVmOM_t020qRsryyVdXGcWMAGFRg1sCV=w1080-h624-n-k-no',width: 150,),
                    //                         Column(
                    //                           crossAxisAlignment: CrossAxisAlignment.start,
                    //                           children: [
                    //                             Text('ประเทศไทย'),
                    //                             Text('ระยะเวลา 10 วัน'),
                    //                             Text('ราคา 10000 บาท'),
                    //                             FilledButton(onPressed: (){}, child: const Text('รายละเอียดเพิ่มเติม')),
                    //                           ],
                    //                   ),
                    //                 ],
                    //                          )
                    //                   ],
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ],
                  ),
                ),
               
              ],),
          ),
        );
  }),
    );
  }
  Future<void>loadDataAsync()async{
    var config = await Configuration.getConfig();
    url = config['apiEndpoint'];
    var res = await http.get(Uri.parse('$url/trips'));
    trips = tripGetResponseFromJson(res.body);
  }
  void getTrips(String? zone) async{
   var value = await http.get(Uri.parse("$url/trips"));
   trips=tripGetResponseFromJson(value.body);
   List<TripGetResponse>filterTrips=[];
   if(zone!=null){
    for(var trip in trips){
      if(trip.destinationZone==zone){
        filterTrips.add(trip);
      }
    }
    trips=filterTrips;
   }
   setState(() {
      log(trips.length.toString());
   });
  
  }
  
  void goToTripPage(int idx) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TripPage(idx: idx)));
  }
}