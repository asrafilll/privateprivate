import 'package:flutter/material.dart';

class HalamanListView extends StatefulWidget {
  const HalamanListView({super.key});

  @override
  State<HalamanListView> createState() => _HalamanListViewState();
}

class _HalamanListViewState extends State<HalamanListView> {
  List<Color> boxColor = [Colors.orange, Colors.red, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: boxColor.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  height: 300,
                  color: boxColor[index],
                  child: const Text('Ini adalah box 1,'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
