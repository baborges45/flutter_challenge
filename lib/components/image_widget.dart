import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached Network Image'),
        actions: [
          TextButton.icon(
            onPressed: reloadImages,
            icon: Icon(
              Icons.refresh_rounded,
              color: Color(0xFFFFFFFF),
            ),
            label: Text(''),
          ),
          //   onPressed: reloadImages,
          //   child: Text(
          //     'Reload',
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   style: TextButton.styleFrom(
          //     primary: Color(0xFFFFFFFF),
          //   ),
          // ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 50,
        itemBuilder: (context, index) => Card(
          color: Color(0xFFDBDBDB),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            leading: buildImage(index),
            title: Text(
              'Image ${index + 1}',
              style: TextStyle(color: Color(0xFF000000)),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        key: UniqueKey(),
        imageUrl: 'https://source.unsplash.com/random?sig=$index/100x100',
        height: 50,
        width: 50,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Container(
          color: Color(0xFFD6D6D6),
          child: Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }

  void reloadImages() {
    DefaultCacheManager().emptyCache();
    imageCache!.clear();
    imageCache!.clearLiveImages();
    setState(() {});
  }
}
