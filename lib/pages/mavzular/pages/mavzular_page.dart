import 'package:bobir_akilkhanov/pages/mavzu_ditail/pages/mavzu_ditail_page.dart';
import 'package:bobir_akilkhanov/pages/mavzular/data/mavzular.dart';
import 'package:flutter/material.dart';

class MavzularPage extends StatefulWidget {
  final groupId;

  const MavzularPage({
    super.key,
    required this.groupId
  });

  @override
  State<MavzularPage> createState() => _MavzularPageState();
}

class _MavzularPageState extends State<MavzularPage> {
  List<dynamic> lessons = [];

  @override
  void initState() {
    super.initState();
    _fetchLessons();
  }

  Future<void> _fetchLessons() async {
    List<dynamic> fetchedGroups = await Mavzular().getGroupsLessons(widget.groupId);
    print(fetchedGroups);
    setState(() {
      lessons = fetchedGroups;
      print(lessons);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mavzular'),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => MavzuDitailPage(lessonId: lessons[index]['id'], lessonName: lessons[index]['unit'], files: lessons[index]['source'], videoPath: lessons[index]['video']['file'], homework: lessons[index]['homework'],)));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(6, 6),
                      blurRadius: 7
                    )
                  ]
                ),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text('${index+1}. ${lessons[index]['unit']}'),
              ),
            );
          }
        ),
      ),
    );
  }
}