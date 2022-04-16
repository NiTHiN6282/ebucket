import 'package:ebucket/collecting_agent/agentnotificationdetails.dart';
import 'package:flutter/material.dart';

class AgentNotification extends StatefulWidget {
  const AgentNotification({Key? key}) : super(key: key);

  @override
  _AgentNotificationState createState() => _AgentNotificationState();
}

class _AgentNotificationState extends State<AgentNotification> {
  List title = ['noti1', 'noti2', 'noti3', 'noti4'];
  List description = ['fdgdgd', 'dfgdgr', 'fgrtrtg', 'rfhytyty'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff009E60),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 100,
                    width: 200,
                    child: Center(
                      child: ListTile(
                        leading: Text((index + 1).toString()),
                        title: Text(title[index]),
                        subtitle: Text(description[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AgentNotificationDetails(
                                title: title[index],
                                description: description[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
