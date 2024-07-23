import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 2.5, 
                    child: Image.asset(
                      'assets/imgs/temo.jpg', 
                      fit: BoxFit.cover, 
                      alignment: FractionalOffset.topCenter
                    ),
                  ),
                              
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    height: 70,
                    color: const Color.fromARGB(255, 229, 229, 229),
                    child: Text(
                      '${index+1}. Data Types',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }
}