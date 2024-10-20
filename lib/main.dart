import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InteractiveExample(),
    );
  }
}

class InteractiveExample extends StatefulWidget {
  const InteractiveExample({super.key});

  @override
  State<InteractiveExample> createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {
  int? firstNumber, secondNumber, sum;

  // TextField controller to capture the value
  TextEditingController? _controller1;
  TextEditingController? _controller2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sum = 0;
    // initialize the values of the variables above
    _controller1 = TextEditingController(text: 0.toString());
    _controller2 = TextEditingController(text: 0.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "First Number"),
              keyboardType: TextInputType.number,
              controller: _controller1,
            ),

            TextField(
              decoration: const InputDecoration(labelText: "Second Number"),
              keyboardType: TextInputType.number,
              controller: _controller2,
            ),

            Text("Sum of two numbers: $sum"),

            // ElevatedButton
            ElevatedButton(
              onPressed: () {
                print('Elevated Button Pressed!');

                setState(() {
                  sum = int.parse(_controller1!.value.text) +
                      int.parse(_controller2!.value.text);
                });
              },
              child: const Text('Elevated Button - Get Sum'),
            ),

            // TextButton
            TextButton(
              onPressed: () {
                print('Text Button Pressed!');

                setState(() {
                  _controller1!.text = 0.toString();
                  _controller2!.text = 0.toString();
                  sum = 0;
                });
              },
              child: const Text('Text Button - Clear Input'),
            ),

            // OutlinedButton
            OutlinedButton(
              onPressed: () {
                print('Outlined Button Pressed!');
              },
              child: const Text('Outlined Button'),
            ),

            // Gesture Detector
            GestureDetector(
              onTap: () {
                print('Tapped!');
              },
              onLongPress: () {
                print('Long pressed!');
              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Tap or Long Press',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),

            // Dismissible
            Dismissible(
              key: const Key('dismissible'),
              onDismissed: (direction) {
                print('Dismissed in $direction');
              },
              // change the direction of the dismiss
              direction: DismissDirection.vertical,
              child: const ListTile(
                title: Text('Swipe to Dismiss'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
