import 'package:flutter/material.dart';
import 'package:unsplash/CardWidget.dart';
import 'package:unsplash/Services/Services.dart';

import 'Model/UnsplashImage.dart';

class SliversListPage extends StatefulWidget {
  SliversListPage({Key? key}) : super(key: key);

  @override
  _SliversListPageState createState() => _SliversListPageState();
}

class _SliversListPageState extends State<SliversListPage> {
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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("Using Slivers"),
          backgroundColor: Colors.red,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(color: Colors.blueGrey[400]),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(getListImages()),
        ),
      ],
    );
  }

  List<Widget> getListImages() {
    List<Widget> listPhotos = [];
    if (listImages != null) {
      listPhotos =
          listImages!.map((e) => CardWidget(urlImage: e.urls.small)).toList();
      return listPhotos;
    }
    return listPhotos;
  }
}// End
