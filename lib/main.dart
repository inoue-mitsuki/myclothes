import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'my clothes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white70,
            title: Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.black87,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(icon: Icon(Icons.description_outlined)),
                Tab(icon: Icon(Icons.account_box)),
              ],
            )),

        ///ハンバーガーメニュー
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: Text(
                  'ハンバーガーメニュー',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('my data'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

        //---------------body------------------//
        body: TabBarView(
          children: [MainTile('aaa'), MainTile('aaa')],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'wearAdd',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Padding MainTile(take) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(backgroundImage: AssetImage('images/sample.png')),

          //1行目
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('take'),
                    SizedBox(
                      width: 22,
                    ),
                    Text('vvvv'),
                  ],
                ),

                //2行目
                Row(
                  children: [
                    Text('aa'),
                    SizedBox(
                      width: 22,
                    ),
                    Text('bb'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
