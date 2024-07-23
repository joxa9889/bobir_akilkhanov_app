import 'package:bobir_akilkhanov/pages/davomat/data/davomat.dart';
import 'package:flutter/material.dart';

class GroupsAttendance extends StatefulWidget {
  final groupId;
  const GroupsAttendance({
    super.key,
    required this.groupId
  });

  @override
  State<GroupsAttendance> createState() => _GroupsAttendanceState();
}

class _GroupsAttendanceState extends State<GroupsAttendance> {

  List<dynamic> attendances = [];

  @override
  void initState() {
    super.initState();
    _fetchAttendances();
  }

  Future<void> _fetchAttendances() async {
    List<dynamic> fetchedAttendances = await Davomat().getAttendance(widget.groupId);
    setState(() {
      attendances = fetchedAttendances;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Davomat'),
      ),
      body: Container(
        child: Expanded(
          child: ListView.builder(
            itemCount: attendances.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text('${index+1}. ${attendances[index]['lesson']['unit']}', overflow: TextOverflow.ellipsis,)
                    ),
                    Text(attendances[index]['lesson']['date'].split(' ').sublist(0, 3).join(' ')),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(attendances[index]['status'] ? '🟢' : '🔴'),
                      ],
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}