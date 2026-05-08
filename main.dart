import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: WorkshopPage(),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.indigo),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rian",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "231011400422",
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 5),
            child: Text(
              "Jadwal Workshop Terdekat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          WorkshopCard(
            title: "Flutter Mobile Development With Rian",
            date: "10 Mei 2026",
            location: "Lab Komputer A",
            quota: "30 Peserta",
            icon: Icons.smartphone,
            color: Colors.blue[700]!,
          ),
          WorkshopCard(
            title: "Kompilasi Kesabaran: Menghadapi Bug Bareng Rian",
            date: "15 Mei 2026",
            location: "Aula Kampus",
            quota: "50 Peserta",
            icon: Icons.bug_report,
            color: Colors.orange[800]!,
          ),
        ],
      ),
    );
  }
}

// Widget Card Custom agar kode lebih rapi
class WorkshopCard extends StatelessWidget {
  final String title, date, location, quota;
  final IconData icon;
  final Color color;

  WorkshopCard({
    required this.title,
    required this.date,
    required this.location,
    required this.quota,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 10,
                color: color,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(icon, color: color, size: 28),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 20),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(date, style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(location, style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.group, size: 14, color: Colors.grey),
                          SizedBox(width: 5),
                          Text("Kuota: $quota", style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Text("Daftar Sekarang"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}