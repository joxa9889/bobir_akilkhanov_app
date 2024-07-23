import 'package:bobir_akilkhanov/pages/news/pages/image_opener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsDitailPage extends StatefulWidget {
  final title;
  final banner;
  final description;
  const NewsDitailPage({
    super.key,
    required this.title,
    required this.banner,
    required this.description
  });

  @override
  State<NewsDitailPage> createState() => _NewsDitailPageState();
}

class _NewsDitailPageState extends State<NewsDitailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ),
              );
            }
          ),
        ),
        title: const Text('News'),
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ), 

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => ImageOpener(openImage: widget.banner)));
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(
                    widget.banner, 
                    fit: BoxFit.cover,
                  )
                )
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700
              ),
            ),

            const SizedBox(
              height: 7,
            ), 

            Container(
              width: double.infinity,
              height: 2,
              color: const Color.fromARGB(255, 209, 209, 209),
            ), 
            
            const SizedBox(
              height: 13,
            ), 

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.description),
                  
                  const SizedBox(
                    height: 10,
                  ),
                  
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child: Container(
                      child: const Expanded(
                        child: Text(
                          'This is Bobir Akilkhanov\'s Mobile Applications which is very good.',
                          style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                      
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}