import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset('assets/imgs/logo.png', fit: BoxFit.cover, width: MediaQuery.of(context).size.width / 5),
                  ),
          
                  const SizedBox(width: 12),
          
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Javohir Akhmadjonov',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 2),
                      Text('+99899*****10')
                    ],
                  ),
                ],
              ),
          
              IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.edit)
              )
            ],
          ),

          const SizedBox(
            height: 16,
          ),

          Container(
            width: double.infinity,
            height: 2,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 39, 39, 39),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
          ),

          const Text('Settings'),

          
        ],
      ),
    );
  }
}