import 'package:flutter/material.dart';
import 'package:unsplash/CardWidget.dart';
import 'package:unsplash/Model/UnsplashImage.dart';
import 'package:unsplash/Services/Services.dart';

class UnsplashMainPage extends StatefulWidget {
  UnsplashMainPage({Key? key}) : super(key: key);

  @override
  _UnsplashMainPageState createState() => _UnsplashMainPageState();
}

class _UnsplashMainPageState extends State<UnsplashMainPage> {
  List<UnsplashImage>? listImages;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Services().getData().then((value) {
      setState(() {
        listImages = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing unsplash"),
      ),
      body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : unsplashPageListImage()),
    );
  }

  Widget unsplashListImage() {
    if (listImages == null) {
      print("0");
    } else {
      print(listImages!.length);
    }

    return ListView.builder(
        itemCount: listImages!.length,
        itemBuilder: (BuildContext context, int index) {
          return getUnsplashImage(listImages![index].urls.small);
        });
  }

  Widget unsplashPageListImage() {
    return PageView.builder(
        itemCount: listImages!.length,
        itemBuilder: (BuildContext context, int index) {
          return getUnsplashImage(listImages![index].urls.small);
        });
  }

  Widget getUnsplashImage(String url) {
    return CardWidget(
      urlImage: url,
    );
  }
} // End - Class _UnsplashMainPageState
