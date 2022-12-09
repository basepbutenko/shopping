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
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController countController = TextEditingController();

  @override
  void initState() {
    shoppingList = ShoppingList();
    shoppingList.readJson();
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
              Column(
                children: [
                  Container(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration:
                            const InputDecoration.collapsed(hintText: 'name'),
                        controller: nameController,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                            hintText: 'description'),
                        controller: descriptionController,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration:
                            const InputDecoration.collapsed(hintText: 'count'),
                        controller: countController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    shoppingList.add(Product(
                        nameController.text,
                        descriptionController.text,
                        int.parse(countController.text)));
                    clearForm();
                    setState(() {});
                  },
                  child: Text("Add")),
              TextButton(
                  onPressed: () {
                    clearForm();
                    setState(() {});
                  },
                  child: Text("Clear")),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: shoppingList.items.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Text(shoppingList.items[index].name),
                          Text(shoppingList.items[index].description),
                          Text(shoppingList.items[index].count.toString()),
                        ],
                      ),
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

  void clearForm() {
    nameController.clear();
    descriptionController.clear();
    countController.clear();
  }
}
