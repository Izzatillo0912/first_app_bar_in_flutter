import 'package:custom_app_bar/SecondPage.dart';
import 'package:custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "My Custom ToolBar kjnkjnknkjnhjbjhbjhk kjnkjnknkjnhjbjhbjhk",
        titleWidget: const Icon(Icons.home, color: Colors.white),
        leading: const Icon(Icons.menu, color: Colors.white),
        showActionMenu: true,
        onBtnClicked: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
        },

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor
        ),
      ),
    );
  }

}
