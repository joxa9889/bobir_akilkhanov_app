import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilesWidget extends StatefulWidget {
  final List<dynamic> files;

  const FilesWidget({
    super.key,
    required this.files
  });

  @override
  State<FilesWidget> createState() => _FilesWidgetState();
}

class _FilesWidgetState extends State<FilesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: widget.files.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 15,),
            
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 250, 250),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: const Color.fromARGB(255, 202, 201, 201))
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.file_copy),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.files[index]['file'].split('/').last,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}