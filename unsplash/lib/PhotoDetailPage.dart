import 'package:flutter/material.dart';

class PhotoDetailPage extends StatefulWidget {
  final int index;
  final String url;
  PhotoDetailPage({Key? key, required this.index, required this.url})
      : super(key: key);

  @override
  _PhotoDetailPageState createState() => _PhotoDetailPageState();
}

class _PhotoDetailPageState extends State<PhotoDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("image_${widget.index}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Photo #${widget.index}"),
              background: Hero(
                tag: "image_${widget.index}",
                child: Image.network(
                  widget.url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
