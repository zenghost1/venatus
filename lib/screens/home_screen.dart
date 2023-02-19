import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:venatus/screens/gclcodm.dart';
import 'package:venatus/screens/psytix.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Clips', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF4A4143),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color(0xFFD9D9D9),),
              child: Column(
                children: [
                  ClipRect(
                    //borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/psytrix.png', height: 202, fit: BoxFit.cover)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Row(
                      children: [
                        const Text('Psytrix Codm Tournament', style: TextStyle(color: Color(0xFF373132), fontSize: 15),),
                        const Expanded(child: SizedBox(width: 10,)),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => DemoApp())));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A4143),
                          ), 
                          child: const Text('Playlist'),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color(0xFFD9D9D9),),
              child: Column(
                children: [
                  ClipRect(
                    //borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/GCL.png', height: 202, fit: BoxFit.cover)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Row(
                      children: [
                        const Text('GCL CODM', style: TextStyle(color: Color(0xFF373132), fontSize: 15),),
                        const Expanded(child: SizedBox(width: 10,)),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DemoAppgcl()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A4143),
                          ), 
                          child: const Text('Playlist'),)
                      ],
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