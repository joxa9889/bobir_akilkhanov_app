import 'package:bobir_akilkhanov/pages/davomat/page/davomat.dart';
import 'package:bobir_akilkhanov/pages/groups/data/groups.dart';
import 'package:flutter/material.dart';

class DebtPage extends StatefulWidget {
  const DebtPage({super.key});

  @override
  State<DebtPage> createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage> {
  List<dynamic> groups = [];

  @override
  void initState() {
    super.initState();
    _fetchGroups();
  }

  Future<void> _fetchGroups() async {
    List<dynamic> fetchedGroups = await Group().getGroups();
    setState(() {
      groups = fetchedGroups;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => GroupsAttendance(groupId: groups[index]['id'])));
              },
              child: Container(
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
              
                child: Column(
                  children: [
                    Text(
                      groups[index]['name'],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      )
    );
  }
}