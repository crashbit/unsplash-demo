import 'package:flutter/material.dart';
import 'package:unsplash/Model/UnsplashImage.dart';
import 'package:unsplash/Services/Services.dart';

import 'CardWidget.dart';

class SliversGridPage extends StatefulWidget {
  SliversGridPage({Key? key}) : super(key: key);

  @override
  _SliversGridPageState createState() => _SliversGridPageState();
}

class _SliversGridPageState extends State<SliversGridPage> {
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
    return isLoading
        ? CircularProgressIndicator()
        : CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text("Using Slivers"),
                backgroundColor: Colors.red,
                expandedHeight: 60.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(color: Colors.blueGrey[400]),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Image.network(
                      listImages![index].urls.small,
                      height: 100.0,
                      fit: BoxFit.cover,
                    );
                  },
                  childCount: isLoading ? 0 : listImages!.length,
                ),
              )
            ],
          );
  }
}
