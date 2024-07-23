import 'package:flutter/material.dart';

class ApplicationAppBar extends StatefulWidget {
  final String title;

  const ApplicationAppBar({
    super.key,
    required this.title
  });

  @override
  State<ApplicationAppBar> createState() => _ApplicationAppBarState();
}

class _ApplicationAppBarState extends State<ApplicationAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  size: 30,
                ),
              );
            }
          ),
        ),

        title: Text(
          widget.title.toString(),
          style: const TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.w400
          ),
        ),
        
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        elevation: 6,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        surfaceTintColor: Colors.transparent,
      );
  }
}