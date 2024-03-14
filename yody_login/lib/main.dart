import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const channel = MethodChannel('login');

void main() {
  runApp(const YodyLogin());
}

class YodyLogin extends StatelessWidget {
  const YodyLogin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  num _counter = 0;

  @override
  void initState() {
    super.initState();
    channel.setMethodCallHandler((call) async {
      final args = call.arguments as Map;
      setState(() {
        _counter = args['input'] as num;
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _submit() {
    channel.invokeMapMethod('result', {'result': _counter});
  }

  void _close() {
    channel.invokeMapMethod('close');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          FloatingActionButton(
            onPressed: _close,
            tooltip: 'Close',
            elevation: 0,
            child: const Icon(Icons.close),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: _submit,
            tooltip: 'Submit',
            child: const Icon(Icons.subdirectory_arrow_left_outlined),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
