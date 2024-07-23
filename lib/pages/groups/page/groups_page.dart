import 'package:bobir_akilkhanov/pages/groups/data/groups.dart';
import 'package:bobir_akilkhanov/pages/mavzular/pages/mavzular_page.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
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
      child: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder) => MavzularPage(groupId: groups[index]['id'])));
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/imgs/python.png', width: MediaQuery.of(context).size.width / 5,),
                      
                      const SizedBox(
                        width: 5,
                      ),
            
                      Text(
                        groups[index]['course']['name'].toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
            
                  const SizedBox(
                    height: 13,
                  ),
                
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Group: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(groups[index]['name'])
                          ],
                        ),
            
                        Row(
                          children: [
                            const Text(
                              'Status: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(groups[index]['status'] ? '🟢' : '🔴')
                          ],
                        )
                      ],
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