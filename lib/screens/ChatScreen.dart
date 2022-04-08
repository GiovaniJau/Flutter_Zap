// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class ChatScreen extends StatefulWidget {
  String name;
  String image;

  ChatScreen({Key? key, required this.name, required this.image}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin{
  final int conversationLength = 16;
  final List<String> messages = <String>[
    'até',
    'então tá, até mais',
    'tá bom então',
    'eu sei, é complicado',
    'putz, sério isso?',
    'nada, depois a gente convesa',
    'vish, qq foi desta vez?',
    'melhor falar pessoalmente',
    'hã?',
    'depois te explico',
    'pq?',
    'Não vai rolar',
    'qq tem',
    'Blz, viu, sabe aquele lance que falamos ontem?',
    'Tranquilo e vc?',
    'E ai, blz?'];

  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: chatAppBar(widget.name, widget.image),
      ),
      body: conversationBody(context),
    );
  }

  Widget chatAppBar(String name,String image){
    return AppBar(
      leading: IconButton(icon: const Icon(Icons.arrow_back),
        onPressed: (){Navigator.pop(context);},),
      title: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/'+image+'.jpg'),radius: 20,),
          const SizedBox(width: 10,),
          Text(name)
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.video_call,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.phone,
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

  Widget conversationBody(BuildContext context){
    return Column(
        children: [
          Expanded(child: ListView.builder(
            reverse: true,
            itemCount: conversationLength,
            itemBuilder: (BuildContext context, int index) {
              return (index%2==0)?ChatBubble(
                clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 20),
                backGroundColor: Colors.purple.shade300,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    messages[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ):
              ChatBubble(
                clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                backGroundColor: const Color(0xffE7E7ED),
                margin: const EdgeInsets.only(top: 20),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    messages[index],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          ),),
          bottomChatBar(context)
        ]);
  }

  Widget bottomChatBar(BuildContext context){
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 0, 20),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.purple,
            ),
            child: Row(
              children: [
                const IconButton(icon:Icon(Icons.insert_emoticon,color: Colors.white,),onPressed: null,),
                SizedBox(width: MediaQuery.of(context).size.width/2.75,
                  child: const TextField(cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(hintText: 'Type Message Here',hintStyle: TextStyle(color: Colors.white),focusColor: Colors.white,border: InputBorder.none),),),
                const IconButton(icon:Icon(Icons.attach_file,color: Colors.white),onPressed: null,),
                const IconButton(icon:Icon(Icons.camera_alt,color: Colors.white),onPressed: null,),

              ],
            ),),
          const SizedBox(width: 5,),
          Container(decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)),color: Colors.black45),child: const IconButton(icon: Icon(Icons.mic,color: Colors.white), onPressed: null),)
        ],
      ),
    );
  }

}