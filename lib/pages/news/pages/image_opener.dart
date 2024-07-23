import 'package:flutter/material.dart';

class ImageOpener extends StatefulWidget {
  final openImage;

  const ImageOpener({
    super.key,
    required this.openImage
  });

  @override
  State<ImageOpener> createState() => _ImageOpenerState();
}

class _ImageOpenerState extends State<ImageOpener> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        elevation: 6,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(widget.openImage, fit: BoxFit.cover)
            ),

            SizedBox(
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}