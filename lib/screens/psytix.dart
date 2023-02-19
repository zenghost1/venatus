import 'package:flutter/material.dart';
import 'package:venatus/screens/video_screen.dart';
import 'package:youtube_parser/youtube_parser.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../API/yt_key_api.dart';

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  static String key = 'AIzaSyDWm0cIYVutKSVRvVjlyZcCAbsNZJWUfIA';

  YTAPIV3 ytApi = YTAPIV3(key, maxResults: 2);
  List<YT_API> ytResult = [];

  callAPI() async {
    ytResult = await ytApi.getPlaylistItems("PLWFBUvXxWM8CWNFH1gVqiTQlVfcJV3r0i");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    print("ytResult.length ${ytResult.length}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Psytrix CODM Tournament'),
        backgroundColor: const Color(0xFF4A4143),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: ytResult.length,
                itemBuilder: (_, int index) => listItem(index),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () async{
                    ytResult = (await ytApi.prevPage())!;
                    if(ytResult != null) {
                      setState(() {});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A4143)
                  ),
                  child: const Text("<< Prev page",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
              ElevatedButton(
                  child: const Text("Next page >>",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A4143)
                  ),
                  onPressed: () async{
                    ytResult = (await ytApi.nextPage())!;
                    if(ytResult != null) {
                      setState(() {});
                    }
                  }
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget listItem(index) {
    return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color(0xFFD9D9D9),),
              child: Column(
                children: [
                  ClipRect(
                    //borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
              ytResult[index].thumbnail['default']['url'], fit: BoxFit.cover, height: 206, width: double.infinity,
            ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Row(
                      children: [
                        Expanded(child: Text(ytResult[index].title, style: const TextStyle(color: Color(0xFF373132), fontSize: 15),)),
                        const Expanded(child: SizedBox(width: 1,)),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoScreen(id: YoutubePlayer.convertUrlToId(ytResult[index].url).toString())));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A4143),
                          ), 
                          child: const Text('Play Video'),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
