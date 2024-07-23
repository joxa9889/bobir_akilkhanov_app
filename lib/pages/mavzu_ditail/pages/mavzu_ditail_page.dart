import 'package:bobir_akilkhanov/pages/mavzu_ditail/pages/widgets/description.dart';
import 'package:bobir_akilkhanov/pages/mavzu_ditail/pages/widgets/files.dart';
import 'package:bobir_akilkhanov/pages/mavzu_ditail/pages/widgets/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MavzuDitailPage extends StatefulWidget {
  final int lessonId;
  final String lessonName;
  final List<dynamic> files;
  final String videoPath;
  final homework;

  const MavzuDitailPage({
    super.key,
    required this.lessonId,
    required this.lessonName,
    required this.files,
    required this.videoPath,
    required this.homework
  });

  @override
  State<MavzuDitailPage> createState() => _MavzuDitailPageState();
}

class _MavzuDitailPageState extends State<MavzuDitailPage> {
  List<Widget> widgets = [];

  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    widgets = [
      MavzuDitailDescription(title: widget.lessonName, date: 'Jul 22, 2024'),
      FilesWidget(files: widget.files),
      FilesWidget(files: [widget.homework])
    ];
    currentPage = widgets[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lessonName),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: Column(
          children: [
            const ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: VideoPlayerView(url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',)
            ),

            const SizedBox(
              height: 18,
            ),

            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 189, 188, 188),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = widgets[0];
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 3,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        border: Border(right: BorderSide(color: Colors.white, width: 2))
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 88, 88, 88)
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = widgets[1];
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 3,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.white, width: 2))
                      ),
                      child: const Text(
                        'Files',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 88, 88, 88)
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = widgets[2];                        
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 30) / 3,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Home Work',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 88, 88, 88)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Builder(
              builder: (context) {
                return currentPage;
              }
            )
          ],
        ),
      ),
    );
  }
}