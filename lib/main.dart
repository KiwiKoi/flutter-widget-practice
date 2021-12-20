import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:les_widgets_basiques/main_title_text.dart';
import 'package:les_widgets_basiques/section_title.dart';
import 'post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {

  final List<Post> posts = [
    Post(
      name: "Daniel V",
      time: "5 minutes",
      imagePath: "images/mountain.jpg",
      likes: 20,
      comments: 100,
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
    Post(
      name: "José G",
      time: "2 minutes",
      imagePath: "images/beach.jpg",
      likes: 5,
      comments: 15,
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
    Post(
      name: "Vincent D",
      time: "2 minutes",
      imagePath: "images/beach.jpg",
      likes: 5,
      comments: 15,
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
    Post(
      name: "Yann L",
      time: "6 minutes",
      imagePath: "images/beach.jpg",
      likes: 5,
      comments: 15,
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Basics"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.topCenter, children: [
            fromAsset(height: 180, width: size.width),
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: profilePicture(radius: 70),
            ),
          ]),
          Row(
            children: [
              Spacer(),
              MainTitleText(data: "Daniel V"),
              Spacer()
            ],
          ),
          Container(
              margin: const EdgeInsets.all(10),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                Expanded(child: textButton()),
                const SizedBox(width: 20),
                iconButton(),
              ])),
          const Divider(thickness: 2.0),
          allFriends(width / 4),
          const Divider(thickness: 2.0),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: aboutMe(),
          ),
          const Divider(thickness: 2.0),
          SectionTitle("My Posts"),
          allPosts(),
        ],
      )),
    );
  }

  CircleAvatar profilePicture({double radius = 0}) {
    return CircleAvatar(
        radius: radius + 4,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.blue,
          backgroundImage: const AssetImage("images/mountain.jpg"),
        ));
  }

  Text subText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text titleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.italic,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Column aboutMe() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("About me"),
        aboutMeLine("home", Icons.home),
        aboutMeLine("work", Icons.work),
        aboutMeLine("relationship", Icons.favorite),
      ],
    );
  }

  Widget aboutMeLine(String? text, IconData? icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 24,
        ),
        Text(text ?? "")
      ],
    );
  }

  Container textButton() {
    return Container(
        height: 50,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Hello",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ));
  }

  Container iconButton() {
    return Container(
        height: 50,
        width: 80,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ));
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.grey)],
            color: Colors.blue,
          )),
    ]);
  }

  Row allFriends(double width) {
    Map<String, String> friends = {
      "José": "images/beach.jpg",
      "David": "images/beach.jpg",
      "Cat": "images/beach.jpg"
    };
    List<Widget> children = [];
    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Container friendCard() {
    return Container(
        height: 150,
        width: 110,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/beach.jpg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))));
  }

  Image fromAsset({double height = 0, double width = 0}) {
    return Image.asset(
      "images/beach.jpg",
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }

  Image fromNetwork() {
    return Image.network(
      "https://images.pexels.com/photos/633198/pexels-photo-633198.jpeg",
      height: 200,
    );
  }

  Column allPosts() {
    List<Widget> postToAdd = [];
    posts.forEach((element) {
      postToAdd.add(post(post: element));
    });
    return Column(
      children: postToAdd,
    );
  }

  Container post({required Post post}) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(225, 225, 225, 1)),
      child: Column(
        children: [
          Row(
            children: [
              profilePicture(radius: 20),
              const Padding(
                padding: EdgeInsets.only(left: 8),
              ),
              Text(post.name),
              const Spacer(),
              timeText(post.setTime())
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(post.imagePath, fit: BoxFit.cover),
          ),
          Text(
            post.desc,
            style: const TextStyle(color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text(post.setLikes()),
              Icon(Icons.message),
              Text(post.setComments())
            ],
          )
        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text(
      "$time ago",
      style: const TextStyle(color: Colors.blue),
    );
  }
}
