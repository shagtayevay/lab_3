import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool showFirstImage = true;

  void toggleImage() {
    setState(() {
      showFirstImage = !showFirstImage;
    });
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("SnackBar is displayed!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Image UI")),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/1.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // Change this to experiment with BoxFit properties
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Flutter",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => showSnackBar(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    "Show SnackBar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    "Go to Second Screen",
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: toggleImage,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    "Toggle Image",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Text(
          "This is the Second Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
