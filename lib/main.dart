import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final callIDTextCtrl=TextEditingController(text:"testCallID");
  HomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Expanded(child: TextFormField(controller: callIDTextCtrl,
      decoration: const InputDecoration(labelText: "start a call by id"),)),
      ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return CallPage(callID: callIDTextCtrl.text);
        }));
      }, 
      child: const Text("Call"))],),)),
    );
  }
}


String userId = Random().nextInt(10000).toString();

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: 1138912062,
        appSign:
            '88a24f13c35299aed1bc42f99a156f5d8617f69c071c49598878a6be8f312fe2',
        callID: callID,
        userID: userId,
        userName: 'user_$userId',
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}
