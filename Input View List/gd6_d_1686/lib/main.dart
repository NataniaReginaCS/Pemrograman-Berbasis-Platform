import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gd6_d_1686/database/sql_helper.dart';
import 'package:gd6_d_1686/database/sql_helper_pendidikan.dart';
import 'package:gd6_d_1686/inputPage.dart';
import 'package:gd6_d_1686/entity/employee.dart';
import 'package:gd6_d_1686/entity/pendidikan.dart';
import 'package:gd6_d_1686/inputPendidikan.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFLITE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const HomePage(
        title: 'SQFLITE',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> employee = [];
  List<Map<String, dynamic>> pendidikan = [];
  int _selectedIndex = 0;
  String searchQuery = '';

  final List<String> appBarTitles = ['Employee', 'Pendidikan'];

  void refreshEmployee() async {
    final data = await SQLHelper.getEmployee();
    setState(() {
      employee = data;
    });
  }

  void refreshPendidikan() async {
    final data = await SqlHelperPendidikan.getPendidikan();
    setState(() {
      pendidikan = data;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        refreshEmployee();
      } else {
        refreshPendidikan();
      }
    });
  }

  Future<void> searchEmployee(String query) async {
    final data = await SQLHelper.searchEmployeeByName(query);
    setState(() {
      employee = data;
    });
  }

  Future<void> searchPendidikan(String query) async {
    final data = await SqlHelperPendidikan.searchPendidikanByNameSekolah(query);
    setState(() {
      pendidikan = data;
    });
  }

  @override
  void initState() {
    refreshEmployee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[_selectedIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              if (_selectedIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputPage(
                      title: 'INPUT EMPLOYEE',
                      id: null,
                      name: null,
                      email: null,
                    ),
                  ),
                ).then((_) => refreshEmployee());
              } else if (_selectedIndex == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputPendidikan(
                      title: 'INPUT PENDIDIKAN',
                      id: null,
                      nameSekolah: null,
                      jenjang: null,
                      jurusan: null,
                    ),
                  ),
                ).then((_) => refreshPendidikan());
              }
            },
          ),
          IconButton(icon: Icon(Icons.clear), onPressed: () async {})
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (value) {
                searchQuery = value;
                if (_selectedIndex == 0) {
                  searchEmployee(searchQuery);
                } else {
                  searchPendidikan(searchQuery);
                }
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                icon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                // Employee Page
                ListView.builder(
                  itemCount: employee.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            label: 'Update',
                            backgroundColor: Colors.blue,
                            icon: Icons.update,
                            onPressed: (context) async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InputPage(
                                    title: 'INPUT EMPLOYEE',
                                    id: employee[index]['id'],
                                    name: employee[index]['name'],
                                    email: employee[index]['email'],
                                  ),
                                ),
                              ).then((_) => refreshEmployee());
                            },
                          ),
                          SlidableAction(
                            label: 'Delete',
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            onPressed: (context) async {
                              await deleteEmployee(employee[index]['id']);
                            },
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(employee[index]['name']),
                        subtitle: Text(employee[index]['email']),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: pendidikan.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            label: 'Update',
                            backgroundColor: Colors.blue,
                            icon: Icons.update,
                            onPressed: (context) async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InputPendidikan(
                                    title: 'INPUT PENDIDIKAN',
                                    id: pendidikan[index]['id'],
                                    nameSekolah: pendidikan[index]
                                        ['nameSekolah'],
                                    jenjang: pendidikan[index]['jenjang'],
                                    jurusan: pendidikan[index]['jurusan'],
                                  ),
                                ),
                              ).then((_) => refreshPendidikan());
                            },
                          ),
                          SlidableAction(
                            label: 'Delete',
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            onPressed: (context) async {
                              await deletePendidikan(pendidikan[index]['id']);
                            },
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(pendidikan[index]['nameSekolah']),
                        subtitle: Text(
                            "${pendidikan[index]['jenjang']} - ${pendidikan[index]['jurusan']}"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Employee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Pendidikan',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<void> deleteEmployee(int id) async {
    await SQLHelper.deleteEmployee(id);
    refreshEmployee();
  }

  Future<void> deletePendidikan(int id) async {
    await SqlHelperPendidikan.deletePendidikan(id);
    refreshPendidikan();
  }
}
