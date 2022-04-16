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
        backgroundColor: const Color(0xff000000),
        title: const Text("Agent"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AgentNotification()));
              },
              icon: const Icon(Icons.notifications, color: Colors.yellow)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.logout, color: Colors.red)),
        ],
      ),
    );
  }
}
