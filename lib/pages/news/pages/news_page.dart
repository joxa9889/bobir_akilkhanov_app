import 'package:bobir_akilkhanov/pages/news/data/news_page.dart';
import 'package:bobir_akilkhanov/pages/news/pages/image_opener.dart';
import 'package:bobir_akilkhanov/pages/news/pages/news_ditail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> news = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    List<dynamic> fetchedNews = await News().getNews();
    setState(() {
      news = fetchedNews;
      print(news);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25),
            child: const Text(
              'Latest News',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder) => NewsDitailPage(title: news[index]['title'], banner: news[index]['image']['file'], description: news[index]['description'],)));
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 15),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: Image.network(
                              news[index]['image']['file'], 
                              fit: BoxFit.cover, 
                              alignment: FractionalOffset.center,
                              width: double.infinity,
                            ),
                          ),
                      
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Color.fromARGB(255, 185, 189, 187)), right: BorderSide(color: Color.fromARGB(255, 185, 189, 187)), left: BorderSide(color: Color.fromARGB(255, 185, 189, 187))),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news[index]['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                      
                                const SizedBox(
                                  height: 5,
                                ),
                      
                                Text(
                                  news[index]['description'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                      
                                const SizedBox(
                                  height: 10,
                                ),
                      
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      news[index]['created_at'].split(' ').sublist(0, 3).join(' '),
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 111, 111, 111)
                                      ),
                                    ),
                      
                                    GestureDetector(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 106, 109, 111),
                                          borderRadius: BorderRadius.all(Radius.circular(4))
                                        ),
                                        child: const Text(
                                          'Read',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}