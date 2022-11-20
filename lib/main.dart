import 'package:flutter/material.dart';
import 'package:shopping/product.dart';
import 'package:shopping/shopping_list.dart';

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
  late ShoppingList shoppingList;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    shoppingList = ShoppingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 200,
                child: TextField(
                  controller: controller,
                ),
              ),
              TextButton(
                  onPressed: () {
                    shoppingList.add(Product(controller.text, "", 0));
                    setState(() {});
                  },
                  child: Text("Add")),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: shoppingList.items.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Row(
                    children: [
                      Text(shoppingList.items[index].name),
                      TextButton(
                          onPressed: () {
                            shoppingList.delete(index);
                            setState(() {});
                          },
                          child: Text("Delete")),
                    ],
                  );
                }),


          )
        ],
      )),
    );
  }
}
