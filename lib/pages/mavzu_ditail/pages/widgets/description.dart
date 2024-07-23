import 'package:flutter/material.dart';

class MavzuDitailDescription extends StatefulWidget {
  final title;
  final date;

  const MavzuDitailDescription({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  State<MavzuDitailDescription> createState() => _MavzuDitailDescriptionState();
}

class _MavzuDitailDescriptionState extends State<MavzuDitailDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 21),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 249, 249),
        border: Border.all(color: const Color.fromARGB(255, 235, 235, 235)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 189, 188, 188),
            offset: Offset(4.0, 4.0),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mavzu: ${widget.title}',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 19
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 91, 91, 91)
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.date)
            ],
          )
        ],
      ),
    );
  }
}