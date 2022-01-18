import 'package:ebucket/collecting_agent/agentnotification.dart';
import 'package:ebucket/common/loginpage.dart';
import 'package:flutter/material.dart';

class AgentBuyEwaste extends StatefulWidget {
  const AgentBuyEwaste({Key? key}) : super(key: key);

  @override
  _AgentBuyEwasteState createState() => _AgentBuyEwasteState();
}

class _AgentBuyEwasteState extends State<AgentBuyEwaste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Text("Agent"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AgentNotification()));
              },
              icon: Icon(Icons.notifications, color: Colors.yellow)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout, color: Colors.red)),
        ],
      ),
    );
  }
}
