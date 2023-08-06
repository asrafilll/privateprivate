import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            Text(
              number.toString(),
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number--;
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
