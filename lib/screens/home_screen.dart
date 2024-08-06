import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:list_sharedpref/shared_prefs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    loadListData();
    super.initState();
  }

  Future loadListData() async {
    await sharedPrefInstance.getListData();
    setState(() {});
  }

  // List<String> items = [];
  final sharedPrefInstance = MySharedPreferences();
  int itemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Shared Pref",
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            sharedPrefInstance.saveListData();
            sharedPrefInstance.items.removeLast();
            itemIndex--;
            setState(() {});
          },
          icon: Icon(Icons.delete),
        ),
      ),
      body: ListView.builder(
          itemCount: sharedPrefInstance.items.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(sharedPrefInstance.items[index]),
                subtitle: Text("Description${index + 1}"),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          itemIndex++;
          sharedPrefInstance.items.add("List${itemIndex}");
          sharedPrefInstance.saveListData();
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
