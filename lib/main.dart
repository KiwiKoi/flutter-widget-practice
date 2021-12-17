import 'dart:ui';

import 'package:flutter/material.dart';

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
      home: const BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  const BasicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Basics"),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(alignment: Alignment.topCenter, children: [
                fromAsset(height: 180, width: size.width),
                Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: profilePicture(radius: 70),
                ),
              ]),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  titleText(
                    "Daniel Visage",
                  ),
                  subText("Bla blab lab lablabla blablab albala. Bla blabla.")
                ],
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: textButton(mr: 20)),
                        iconButton(width: 80, ml: 20),
                      ])),
              Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      friendsSection()],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                child: aboutMe(),
              ),
            ],
          )),
    );
  }

  CircleAvatar profilePicture({double radius: 0}) {
    return CircleAvatar(
        radius: radius + 4,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.blue,
          backgroundImage: AssetImage("images/mountain.jpg"),
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
      children: [
        sectionTitle("About me"),
        aboutMeLine("home", Icons.home),
        aboutMeLine("work", Icons.work),
        aboutMeLine("relationship", Icons.favorite),
      ],
    );
  }

  Widget aboutMeLine(
    String? text, IconData? icon
      ){
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

  Container textButton({double ml = 0,
    double mr = 0,
    double mt = 0,
    double mb = 0,
    double width = 0}) {
    return Container(
        margin: EdgeInsets.fromLTRB(ml, mt, mr, mb),
        height: 50,
        width: width,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Text(
          "Hello",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ));
  }

  Container iconButton({double ml = 0,
    double mr = 0,
    double mt = 0,
    double mb = 0,
    double width = 80}) {
    return Container(
        margin: EdgeInsets.fromLTRB(ml, mr, mt, mb),
        height: 50,
        width: width,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ));
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24,)
    ));
  }

  Container friendsSection() {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Column(
          children: [
            sectionTitle("Friends"),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                friendCard(),
                friendCard(),
                friendCard(),
              ],
            )
          ]
        )


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
}
