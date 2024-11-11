
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Web view
            return Row( 
             
              children: [
                // Sidebar
                Container(
                  width: constraints.maxWidth * 0.2,
                  color: Colors.white,
                  child: Sidebar(),
                ),
                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // Header
                          Header(),
                          SizedBox(height: 16),
                          // Top Rating Project
                          TopRatingProject(),
                          SizedBox(height: 16),
                          // Main Content Grid
                          MainContentGrid(),
                        ],
                      ),
                    ),
                  ),
                ),
                // Right Sidebar (Calendar and Notifications)
                Container(
                  width: constraints.maxWidth * 0.25,
                  color: Colors.purple[900],
                  child: RightSidebar(),
                ),
              ],
            );
          } else {
            // Mobile view
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  Header(),
                  SizedBox(height: 16),
                  // Top Rating Project
                  TopRatingProject(),
                  SizedBox(height: 16),
                  // Main Content Grid
                  MainContentGrid(),
                  SizedBox(height: 16),
                  // Right Sidebar (Calendar and Notifications)
                  RightSidebar(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Logo
          Row(
            children: [
              // Image.network(
              //   'https://storage.googleapis.com/a1aa/image/TrfE6PfyWVlbXkmuN4GOYHsTfN4yKeWwcnZ1tWZeDlPA3D7dC.jpg',
              //   width: 50,
              //   height: 50,
              // ),
              SizedBox(width: 8),
              Text(
                'AdStacks',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // User Info
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://storage.googleapis.com/a1aa/image/C4uGS7Ge99XHd6AINHmrPaG04bDozWrLi5bW4KjUME0dPs3JA.jpg',
                ),
                radius: 24,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pooja Mishra',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          // Navigation
          Expanded(
            child: ListView(
              children: [
                SidebarItem(icon: Icons.home, label: 'Home'),
                SidebarItem(icon: Icons.people, label: 'Employees'),
                SidebarItem(icon: Icons.calendar_today, label: 'Attendance'),
                SidebarItem(icon: Icons.bar_chart, label: 'Summary'),
                SidebarItem(icon: Icons.info, label: 'Information'),
                SidebarItem(icon: Icons.work, label: 'WORKSPACES'),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: [
                      SidebarItem(icon: Icons.folder, label: 'Adstacks'),
                      SidebarItem(icon: Icons.folder, label: 'Finance'),
                    ],
                  ),
                ),
                SidebarItem(icon: Icons.settings, label: 'Setting'),
                SidebarItem(icon: Icons.logout, label: 'Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;

  SidebarItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(label),
      onTap: () {},
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.search),
        Text(
          'Home',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.notifications),
        SizedBox(width: 10,),
        Icon(Icons.person),
       
        
        Row(
          children: [
            
            Container(
             
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',icon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   color: Colors.purple,
            //   child: IconButton(
            //     icon: Icon(Icons.search, color: Colors.white),
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

class TopRatingProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.pink],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ETHEREUM 2.0',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Top Rating Project',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Trending project and high rating Project Created by team.',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            // style: ElevatedButton.styleFrom(primary: Colors.purple[700]),
            child: Text('Learn More'),
          ),
        ],
      ),
    );
  }
}

class MainContentGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // All Projects and Top Creators
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AllProjects(),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TopCreators(),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Performance Chart
        PerformanceChart(),
      ],
    );
  }
}

class AllProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Projects',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ProjectItem(
            title: 'Technology behind the Blockchain',
            details: 'Project #1 • See project details',
            color: Colors.red[600]!,
          ),
          ProjectItem(
            title: 'Technology behind the Blockchain',
            details: 'Project #1 • See project details',
            color: Colors.blue[800]!,
          ),
          ProjectItem(
            title: 'Technology behind the Blockchain',
            details: 'Project #1 • See project details',
            color: Colors.blue[800]!,
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String title;
  final String details;
  final Color color;

  ProjectItem({required this.title, required this.details, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                details,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Icon(Icons.edit, color: Colors.white),
        ],
      ),
    );
  }
}

class TopCreators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Creators',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          CreatorItem(
            username: '@maddison_c21',
            artworks: '9821',
          ),
          CreatorItem(
            username: '@karl.wil02',
            artworks: '7032',
          ),
          CreatorItem(
            username: '@maddison_c21',
            artworks: '9821',
          ),
          CreatorItem(
            username: '@maddison_c21',
            artworks: '9821',
          ),
        ],
      ),
    );
  }
}

class CreatorItem extends StatelessWidget {
  final String username;
  final String artworks;

  CreatorItem({required this.username, required this.artworks});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://storage.googleapis.com/a1aa/image/C4uGS7Ge99XHd6AINHmrPaG04bDozWrLi5bW4KjUME0dPs3JA.jpg',
                ),
                radius: 16,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    artworks,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.more_horiz, color: Colors.white),
        ],
      ),
    );
  }
}

class PerformanceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Over All Performance The Years',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    color: Colors.red,
                  ),
                  SizedBox(width: 4),
                  Text('Pending'),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 4),
                  Text('Project Done'),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          // Image.network(
          //   'https://storage.googleapis.com/a1aa/image/FjpqUAnc4V4wE1u0sExQWFyknxrIraWLuVWu50mfVKJdPs3JA.jpg',
          //   width: double.infinity,
          //   height: 200,
          //   fit: BoxFit.cover,
          // ),
        ],
      ),
    );
  }
}

class RightSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GENERAL 10:00 AM TO 7:00 PM',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('OCT', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('2023', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  children: List.generate(31, (index) {
                    return Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: index == 27 ? Colors.white : Colors.black,
                          backgroundColor: index == 27 ? Colors.purple : Colors.transparent,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Today Birthday',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://storage.googleapis.com/a1aa/image/C4uGS7Ge99XHd6AINHmrPaG04bDozWrLi5bW4KjUME0dPs3JA.jpg',
                ),
                radius: 16,
              ),
              SizedBox(width: 8),
              Text('2', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            // style: ElevatedButton.styleFrom(primary: Colors.purple[700]),
            child: Text('Birthday Wishing'),
          ),
          SizedBox(height: 16),
          Text(
            'Anniversary',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://storage.googleapis.com/a1aa/image/C4uGS7Ge99XHd6AINHmrPaG04bDozWrLi5bW4KjUME0dPs3JA.jpg',
                ),
                radius: 16,
              ),
              SizedBox(width: 8),
              Text('3', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            // style: ElevatedButton.styleFrom(primary: Colors.purple[700]),
            child: Text('Anniversary Wishing'),
          ),
        ],
      ),
    );
  }
}
