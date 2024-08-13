import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ui_class1_flupcs1/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:ui_class1_flupcs1/models/response/tripIdxGetRes.dart';
class TripPage extends StatefulWidget {
  int idx = 0;
  TripPage({super.key, required this.idx});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  String url = '';
  late Future<void> loadData;
  late TripIdxGetResponse tripIdxGetResponse;
  @override
  void initState() {
    log(widget.idx.toString());
    super.initState();
    loadData = loadDataAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดทริป'),
      ),
      body: FutureBuilder(
          future: loadData,
          builder: (context, snapshot) {
            if(snapshot.connectionState!=ConnectionState.done){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(tripIdxGetResponse.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(tripIdxGetResponse.destinationZone,style: TextStyle(fontSize: 21),),
                      ],
                    ),
                    Image.network(tripIdxGetResponse.coverimage,errorBuilder: (context,error,stackTrace)=>const Center(child:Column(
                      children: [
                        Icon(Icons.image_not_supported_outlined,size: 50,color:Colors.red ,),
                        Text('Not found image',style: TextStyle(fontSize: 30),),
                      ],
                    )),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ราคา '+tripIdxGetResponse.price.toString()+' บาท',style: TextStyle(fontSize: 18),),
                        Text('โซน'+tripIdxGetResponse.country,style: TextStyle(fontSize: 18),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(tripIdxGetResponse.detail,style: TextStyle(fontSize: 18),),
                    ),
                    FilledButton(onPressed: (){}, child: Text('จองเลย!!'))
                
                
                  ],
                ),
              ),
            );
          }),
    );
  }
  Future<void> loadDataAsync() async {
    var config = await Configuration.getConfig();
    url = config['apiEndpoint'];
    var res = await http.get(Uri.parse('$url/trips/${widget.idx}'));
    log(res.body);
    tripIdxGetResponse = tripIdxGetResponseFromJson(res.body);
  }
}
