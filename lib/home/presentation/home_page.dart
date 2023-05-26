import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFF42AB44),
                  Color(0xFF115622),
                ],
              ),
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  floating: true,
                  pinned: true,
                  expandedHeight: 160.0,
                  title: const Text("Грозный"),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.door_back_door,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_circle,
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        style: const TextStyle(fontSize: 10),
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)), label: const Icon(LineIcons.search)),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      color: const Color(0xFFEEEEEE),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: CustCard(
                                      color: Colors.amberAccent,
                                      child: Text("Hello"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: CustCard(
                                      color: Colors.pink,
                                      child: Text("Hello"),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: double.infinity,
                                child: CustCard(
                                  color: Colors.cyan,
                                  child: Text("Hello"),
                                ),
                              )
                            ],
                          ),
                          CustCard(
                            color: Colors.white30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Лучшие продукты с ферм"),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text("Все >"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class CustCard extends StatelessWidget {
  const CustCard({super.key, required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4.0),
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: color, boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)]),
        child: Center(child: child));
  }
}
