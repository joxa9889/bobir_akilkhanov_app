import 'package:bobir_akilkhanov/auth/data/auth.dart';
import 'package:bobir_akilkhanov/auth/page/log_in.dart';
import 'package:bobir_akilkhanov/home/appBar/app_bar.dart';
import 'package:bobir_akilkhanov/home/settings/page/settings_page.dart';
import 'package:bobir_akilkhanov/pages/davomat/page/davomat_groups.dart';
import 'package:bobir_akilkhanov/pages/groups/page/groups_page.dart';
import 'package:bobir_akilkhanov/pages/news/pages/news_page.dart';
import 'package:bobir_akilkhanov/pages/qarzdorlik/pages/qarzdorlik_page.dart';
import 'package:bobir_akilkhanov/pages/video/pages/video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<List<dynamic>> pages = [
    ['Grupalar', const Icon(Icons.group), const GroupsPage()],
    ['Davomat', const Icon(Icons.timelapse), const DebtPage()],
    ['Qarzdorlik', const Icon(Icons.currency_exchange), const QarzdorlikPage()],
    ['Video', const Icon(Icons.play_arrow), const VideoPage()],
    ['News', const Icon(Icons.newspaper), const NewsPage()],
    ['Settings', const Icon(Icons.settings), const SettingsPage()],
  ];

  late List<dynamic> _current_page;

  @override
  void initState() {
    _current_page = pages[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                                
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Image.asset(
                        'assets/imgs/logo.png',
                        height: 100,
                      ),
                    ),
                                
                    const SizedBox(
                      height: 25,
                    ),
                                
                    Container(
                      width: 70,
                      height: 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black87,
                      ),
                    ),
                                
                    const SizedBox(
                      height: 20,
                    ),
                                
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pages.length,
                        itemBuilder: (context, index) {
                            if (index == pages.length-1) {
                              return Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 24, left: 24, top: 10, bottom: 10),
                                    height: 3,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      color: Color.fromARGB(255, 18, 18, 18),
                                    ),
                                  ),
                                
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          _current_page = pages[index];
                                        });
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(Icons.settings),
                                  
                                          SizedBox(
                                            width: 10,
                                          ),
                                  
                                          Text(
                                            'Settings',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Sora',
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                                
                            return GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  _current_page = pages[index];
                                });
                              },
                                
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                                child: Row(
                                    children: [
                                      pages[index][1],
                              
                                      const SizedBox(
                                        width: 10,
                                      ),
                              
                                      Text(
                                        pages[index][0].toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Sora',
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                ),
                              ),
                            );
                        }
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),

              const SizedBox(
                height: 5,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset('assets/imgs/logo.png', width: MediaQuery.of(context).size.width / 7)
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Text('johndoe@gmail.com')
                          ],
                        )
                      ],
                    ),

                    PopupMenuButton<SampleItem>(
                      child: const Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemOne,
                          child: Row(
                            children: [
                              Icon(Icons.light_mode),
                              SizedBox(width: 5),
                              Text('Mode')
                            ],
                          ),
                        ),

                        PopupMenuItem<SampleItem>(
                          onTap: () {
                            Auth().removeToken();
                            Navigator.of(context).popUntil((route) => route.isFirst); 
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LogInPage()));
                          },
                          value: SampleItem.itemOne,
                          child: const Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w800
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ApplicationAppBar(title: _current_page[0],),
      ),

      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(243, 243, 243, 1)
        ),
        child: _current_page[2],
      ),
    );
  }
}