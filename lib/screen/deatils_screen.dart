import 'package:flutter/material.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/screen/home_screen.dart';

int i = 0;

class DeatilsScreen extends StatefulWidget {
  const DeatilsScreen({super.key, required this.id});
  final String id;

  @override
  State<DeatilsScreen> createState() => _DeatilsScreenState();
}

class _DeatilsScreenState extends State<DeatilsScreen> {
  @override
  Widget build(BuildContext context) {
    var item = gifts.where((element) => element.id == widget.id).single;
    PageController pc =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(176, 206, 114, 183),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.liteBlackColor,
                      blurRadius: 2,
                      offset: Offset.infinite,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: PageView.builder(
                        controller: pc,
                        itemCount: 7,
                        onPageChanged: (value) {
                          setState(() {
                            i = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.asset(
                                item.image,
                                height: 300,
                                width: 300,
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
          DotContWidget(item: i),
        ],
      ),
    );
  }
}

class DotContWidget extends StatelessWidget {
  const DotContWidget({
    super.key,
    required this.item,
  });
  final int item;
  @override
  Widget build(BuildContext context) {
    ScrollController sc = ScrollController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          width: 7 * 20,
          child: ListView.builder(
            controller: sc,
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: index == item ? 14 : 10,
                    width: index == item ? 14 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Center(
                      child: Container(
                        height: index == item ? 10 : 8,
                        width: index == item ? 10 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 231, 130, 90),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
