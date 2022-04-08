// ignore_for_file: file_names

import 'dart:core';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'ChatScreen.dart';

class HomePage extends StatefulWidget {
  final CameraDescription camera;

  const HomePage({Key? key, required this.camera,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController controller;

  final List<String> images = <String>['susan','mark','jack','micheal','katherine','susan','mark','jack','micheal','katherine'];
  final List<String> names = <String>['Susan','Mark','Jack','Micheal','Katherine','Laura','Jimmy','John','Bob','Alice'];
  final List<String> lastMessage = <String>['Combinado','eu ainda não sei','vamos ver','até mais','você está aí??','lol... foi muito legal','onde vc está??','também não faço ideia','vou perguntar pra ele','vc deve estar brincando'];
  final List<String> lastTime = <String>['13:30','Ontem', '08/04/2022','08/04/2022','08/04/2022','07/04/2022','07/04/2022','06/04/2022','29/03/2022','25/03/2022'];

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.camera, ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: _appBar(context),
          ),
          body: _tabsView(context,names,images,lastMessage,controller,lastTime),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

Widget _appBar(BuildContext context){
  return AppBar(
    title: const Text('Flutter Zap',style: TextStyle(color: Colors.white),),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: _tabLayout(context),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      )
    ],
  );
}

Widget _tabsView(BuildContext context,List<String> names,List<String> images,List<String> lastMessage,CameraController controller,List<String> lastTime){
  return TabBarView(
      children: <Widget>[
        _camView(context,controller),
        _chatView(context,names,images,lastMessage,lastTime),
        _statusView(context),
        _callsView(context),
      ]
  );
}

Widget _camView(BuildContext context,CameraController controller){
  return AspectRatio(
      aspectRatio: 3/2,
      child: CameraPreview(controller));
}

Widget _chatView(BuildContext context,List<String> names,List<String> images,List<String> lastMessage,List<String> lastTime){
  return Container(
      color: Colors.white,
      child: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage('assets/images/'+images[index]+'.jpg'),radius:25,),
              title: Text(names[index]),
              subtitle: Text(lastMessage[index]),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(lastTime[index],style: const TextStyle(fontSize: 10),),
                  const SizedBox(height: 5,)
                ],
              ),
              onTap:(){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen(name: names[index],image: images[index])),
              );}
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.purple),
      )
  );
}

Widget _statusView(BuildContext context){
  return Container(color: Colors.black12,);
}

Widget _callsView(BuildContext context){
  return Container(color: Colors.black12,);
}

Widget _tabLayout(BuildContext context){
  return const TabBar(
    labelStyle: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
      tabs: <Widget>[
        Tab(icon: Icon(Icons.camera_alt)),
        Tab(text: 'CONVERSAS'),
        Tab(text: 'STATUS'),
        Tab(text: 'CHAMADAS')
      ]
  );
}