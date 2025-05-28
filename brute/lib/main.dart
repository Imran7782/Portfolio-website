import 'package:flutter/material.dart';

void main() {
  runApp(FitnessHallApp());
}

class FitnessHallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Hall Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(),
    MembersPage(),
    TrainersPage(),
    PaymentsPage(),
    SchedulesPage(),
    EquipmentPage(),
    ReportsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fitness Hall Manager")),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Members'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Trainers'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedules'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Equipment'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_applications), label: 'Settings'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(16),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        dashboardCard('Active Members', '152', Icons.people),
        dashboardCard('Total Trainers', '8', Icons.fitness_center),
        dashboardCard('Revenue', '\$2450', Icons.attach_money),
        dashboardCard('Maintenance Due', '3', Icons.warning),
      ],
    );
  }

  Widget dashboardCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(title, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

class MembersPage extends StatelessWidget {
  final List<String> members = ['John Doe', 'Alice Smith', 'Michael Brown'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(members[index]),
          subtitle: Text('Membership Active'),
          trailing: Icon(Icons.edit),
          onTap: () {},
        );
      },
    );
  }
}

class TrainersPage extends StatelessWidget {
  final List<String> trainers = ['Trainer A', 'Trainer B', 'Trainer C'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trainers.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.fitness_center)),
            title: Text(trainers[index]),
            subtitle: Text('Strength Training'),
          ),
        );
      },
    );
  }
}

class PaymentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('John Doe'),
          subtitle: Text('Paid: \$50 - 1 Month'),
          trailing: Icon(Icons.receipt),
        ),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Alice Smith'),
          subtitle: Text('Paid: \$120 - 3 Months'),
          trailing: Icon(Icons.receipt),
        ),
      ],
    );
  }
}

class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          title: Text("Trainer A - 10:00 AM"),
          subtitle: Text("Monday, Wednesday, Friday"),
        ),
        ListTile(
          title: Text("Trainer B - 5:00 PM"),
          subtitle: Text("Tuesday, Thursday, Saturday"),
        ),
      ],
    );
  }
}

class EquipmentPage extends StatelessWidget {
  final List<Map<String, String>> equipment = [
    {'name': 'Treadmill', 'status': 'Good'},
    {'name': 'Bench Press', 'status': 'Needs Maintenance'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: equipment.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.settings),
          title: Text(equipment[index]['name']!),
          subtitle: Text('Status: ${equipment[index]['status']}'),
        );
      },
    );
  }
}

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Reports and Analytics Coming Soon',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          value: true,
          onChanged: (val) {},
          title: Text("Dark Mode"),
        ),
        ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.logout),
          onTap: () {},
        )
      ],
    );
  }
}
