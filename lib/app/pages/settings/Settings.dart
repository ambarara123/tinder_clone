import 'package:flutter/material.dart';

class SettingTabs extends StatelessWidget {
  const SettingTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [Text("GUIDES"), Text("TOOLS"), Text("RESOURCES")],
            ),
          ),
          body: const TabBarView(children: [
            Text("This is the Guide Screen"),
            Text("This is the Tools Screen"),
            Text("This is the Resources Screen")
          ]),
        )
    );
  }
}
