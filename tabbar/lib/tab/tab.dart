import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tabbar/tab/page1.dart';
import 'package:tabbar/tab/page2.dart';
import 'package:tabbar/tab/page3.dart';

class TaabBar extends StatefulWidget {
  const TaabBar({Key? key}) : super(key: key);

  @override
  State<TaabBar> createState() => _TaabBarState();
}

class _TaabBarState extends State<TaabBar> with SingleTickerProviderStateMixin {
  TabController? controllerTab;
  @override
  void initState() {
    // TODO: implement initState
    controllerTab = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(22)),
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      controllerTab!.index = index;
                    });
                  },
                  controller: controllerTab,
                  indicator: BoxDecoration(color: Colors.amber),
                  tabs: [
                    Tab(text: "Page1"),
                    Tab(text: "Page2"),
                    Tab(text: "Page3"),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                  controller: controllerTab,
                  children: [Page1(), Page2(), Page3()]),
            )
          ],
        ),
      ),
    );
  }
}
