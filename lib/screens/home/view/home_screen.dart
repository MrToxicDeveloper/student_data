import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_data/screens/home/model/home_model.dart';
import 'package:student_data/screens/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtId = TextEditingController();
  TextEditingController txtStd = TextEditingController();

  TextEditingController dtxtName = TextEditingController();
  TextEditingController dtxtId = TextEditingController();
  TextEditingController dtxtStd = TextEditingController();

  HomeProvider? provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(
      context,
      listen: false,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student Info"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Consumer<HomeProvider>(
            builder: (context, value, child) => ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: Text("${provider!.l1[index].id}"),
                title: Text("${provider!.l1[index].name}"),
                subtitle: Text("${provider!.l1[index].std}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => provider!.deleteData(index),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: dtxtName,
                                    decoration: InputDecoration(
                                      hintText: "Enter Name",
                                    ),
                                  ),
                                  TextField(
                                    controller: dtxtId,
                                    decoration: InputDecoration(
                                      hintText: "Enter Id",
                                    ),
                                  ),
                                  TextField(
                                    controller: dtxtStd,
                                    decoration: InputDecoration(
                                      hintText: "Enter Standard",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      provider!.editData(index,dtxtName.text,dtxtId.text,dtxtStd.text);

                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red)),
                                    child: Text("Add"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.green,
                        )),
                  ],
                ),
              ),
              itemCount: provider!.l1.length,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: txtName,
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                      ),
                    ),
                    TextField(
                      controller: txtId,
                      decoration: InputDecoration(
                        hintText: "Enter Id",
                      ),
                    ),
                    TextField(
                      controller: txtStd,
                      decoration: InputDecoration(
                        hintText: "Enter Standard",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        HomeModel m1 = HomeModel(
                            id: txtId.text,
                            std: txtStd.text,
                            name: txtName.text);

                        provider!.addData(m1);

                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      child: Text("Add"),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
      ),
    );
  }
}
