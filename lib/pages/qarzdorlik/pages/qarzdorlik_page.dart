import 'package:flutter/material.dart';

class QarzdorlikPage extends StatefulWidget {
  const QarzdorlikPage({super.key});

  @override
  State<QarzdorlikPage> createState() => _QarzdorlikPageState();
}

class _QarzdorlikPageState extends State<QarzdorlikPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 23),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 239, 239),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: const Color.fromARGB(255, 143, 143, 143), width: 4),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 162, 162, 162),
                  offset: Offset(4.0, 4.0),
                  blurRadius: 12,
                  spreadRadius: 3,
                ),
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      const Text(
                        '100,000,000.00',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w700,
                          fontSize: 27
                        ),
                      ),
                  
                      const SizedBox(width: 4),
                  
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        child: const Text(
                          'sum',
                          style: TextStyle(
                            color: Color.fromARGB(255, 70, 76, 70),
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                ),
    
                const SizedBox(
                  height: 15,
                ),
                
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Should pay this month',
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 81, 95),
                        fontWeight: FontWeight.w600,
                        fontSize: 15
                      ),
                    ),
    
                    Icon(
                      Icons.currency_exchange_rounded,
                      color: Colors.green,  
                    )
                  ],
                )
              ],
            ),
        ),
    
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          margin: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 189, 188, 188),
                offset: Offset(0, 4.0),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]
          ),
    
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.history,
                    size: 26,
                  ),
    
                  SizedBox(width: 7),
    
                  Text(
                    'Payment History',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
    
              IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.calendar_month)
              )
            ],
          ),
        ),
    
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 15, bottom: 25),
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 127, 132, 127), width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  color: Colors.white
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.payment),
                        SizedBox(width: 10),
                        Text(
                          '-100,000.00 sum',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17
                          ),
                        )
                      ],
                    ),
    
                    Text('Jun 20, 2024')
                  ],
                ),
              );
            }
          )
        )
      ],
    );
  }
}