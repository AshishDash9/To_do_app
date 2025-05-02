import 'package:flutter/material.dart';

class First_page extends StatefulWidget {
  const First_page({super.key});

  @override
  State<First_page> createState() => _HomeState();
}

class _HomeState extends State<First_page> {
  TextEditingController _taskController = TextEditingController();
  List<String> _task = [];

  _addtask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _task.add(_taskController.text);
        _taskController.clear();
      });
    }
  }

  _removetask(int index) {
    setState(() {
      _task.removeAt(index);
    });
  }
  _removeall(){
    setState(() {
      _task.clear();
    });

  }

  // Helper method for grid tiles
  Widget _buildGridItem(IconData icon, String label) {
    return Card(
      color: Colors.green[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$label tapped')),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 30, color: Colors.green[900]),
              SizedBox(height: 8),
              Text(label, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 100,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message)),
          SizedBox(width: 100),
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          SizedBox(width: 100),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          SizedBox(width: 100),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
        ],
        title: Text("Simple Todo App"),
        titleSpacing: 50,

      ),
      floatingActionButton: FloatingActionButton(onPressed:()=>_removeall(),child: Icon(Icons.add),backgroundColor: Colors.red,),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                accountName: Text("Ashish Dash"),
                accountEmail: Text("ashsihdash320@gmail.com"),
                currentAccountPicture: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYYAfz-KmOiY-JQEDNDF2brVLmDSxJG5To-A&s"),
              ),
            ),
            ListTile(title: Text("Home"), leading: Icon(Icons.home)),
            ListTile(title: Text("Search"), leading: Icon(Icons.search)),
            ListTile(title: Text("Email"), leading: Icon(Icons.email)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your Text",
                suffixIcon:
                IconButton(onPressed: () => _addtask(), icon: Icon(Icons.add)),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: _task.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_task[index]),
                      trailing: IconButton(
                        onPressed: () => _removetask(index),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // Grid Section
            Expanded(
              flex: 1,
              child: GridView.count(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                padding: const EdgeInsets.all(8),
                children: [
                  _buildGridItem(Icons.check_circle, 'Completed'),
                  _buildGridItem(Icons.category, 'Categories'),
                  _buildGridItem(Icons.favorite, 'Favorites'),
                  _buildGridItem(Icons.calendar_today, 'Calendar'),
                  _buildGridItem(Icons.alarm, 'Reminders'),
                  _buildGridItem(Icons.settings, 'Settings'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
