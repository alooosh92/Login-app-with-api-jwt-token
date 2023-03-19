import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Auth/widget/default_widget.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';
import '../Auth/widget/setting_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefAppBar.appbarHome(
        () {
          showDialog(
            context: context,
            builder: (context) {
              return const SearchWidget();
            },
          );
        },
      ),
      bottomNavigationBar: const DefBottomNavigationBar(),
      drawer: const SettingWidget(),
      // ignore: prefer_const_constructors
      body: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(child: Container()),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    TextEditingController region = TextEditingController();
    TextEditingController type = TextEditingController();
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        DefElevateButton(
          color: ColorManager.primaryColor,
          function: () {},
          highte: 35,
          text: StringManager.search.tr,
          textColor: ColorManager.whiteColor,
          textSize: 20,
          width: 100,
        ),
        DefElevateButton(
          color: ColorManager.redColor,
          function: () {},
          highte: 35,
          text: StringManager.canselTheProcess.tr,
          textColor: ColorManager.whiteColor,
          textSize: 20,
          width: 100,
        ),
      ],
      titlePadding: const EdgeInsets.only(top: 0),
      title: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 60,
        decoration: const BoxDecoration(color: ColorManager.primaryColor),
        child: Row(
          children: const [
            Icon(Icons.filter_alt, color: ColorManager.whiteColor),
            DefText(
                text: 'فلتر البحث', size: 20, color: ColorManager.whiteColor),
          ],
        ),
      ),
      content: Container(
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 220,
        padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefDropDownMenu(
                  controller: region,
                  item: const [
                    DropdownMenuEntry(value: '', label: ''),
                    DropdownMenuEntry(value: 'دمشق', label: 'دمشق'),
                    DropdownMenuEntry(value: 'حلب', label: 'حلب'),
                    DropdownMenuEntry(value: 'حماه', label: 'حماه'),
                    DropdownMenuEntry(value: 'حمص', label: 'حمص'),
                  ],
                  label: StringManager.region.tr,
                ),
                DefDropDownMenu(
                  controller: type,
                  item: const [
                    DropdownMenuEntry(value: '', label: ''),
                    DropdownMenuEntry(value: 'إكسسوار', label: 'إكسسوار'),
                    DropdownMenuEntry(value: 'مكياج', label: 'مكياج'),
                    DropdownMenuEntry(value: 'هدايا', label: 'هدايا'),
                    DropdownMenuEntry(
                        value: 'وجبات سريعة', label: 'وجبات سريعة'),
                  ],
                  label: StringManager.type.tr,
                ),
              ],
            ),
            DefTextFormField(
              controller: search,
              textInputType: TextInputType.text,
              label: StringManager.search.tr,
              icon: Icons.search,
              radius: 20,
              hidden: false,
              validator: null,
              onChange: (val) {},
            ),
          ],
        ),
      ),
    );
  }
}

class DefDropDownMenu extends StatelessWidget {
  const DefDropDownMenu({
    super.key,
    required this.controller,
    required this.item,
    required this.label,
  });
  final String label;
  final List<DropdownMenuEntry> item;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu(
        controller: controller,
        label: DefText(text: label, size: 15),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: ColorManager.primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: ColorManager.primaryColor),
          ),
        ),
        dropdownMenuEntries: item,
      ),
    );
  }
}

class DefBottomNavigationBar extends StatelessWidget {
  const DefBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.whiteColor,
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              offset: Offset.zero,
              color: ColorManager.liteBlackColor)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.shopify_sharp),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.payment),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class DefAppBar {
  static AppBar appbarHome(void Function()? press) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: press,
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
        Stack(
          children: [
            Center(
              child: IconButton(
                icon: const Icon(Icons.message_outlined),
                onPressed: () {},
              ),
            ),
            // Visibility(
            //   visible: true,
            //   child: Positioned(
            //     left: 5,
            //     top: 7,
            //     child: Container(
            //       width: 22,
            //       height: 20,
            //       decoration: BoxDecoration(
            //         color: ColorManager.redColor,
            //         borderRadius: BorderRadiusDirectional.circular(50),
            //       ),
            //       child: Positioned(
            //         left: 0,
            //         bottom: 0,
            //         top: 0,
            //         right: 0,
            //         child: Center(
            //           child: Text(
            //             '4',
            //             style: TextStyle(
            //                 fontSize: 12,
            //                 fontFamily: StringManager.font.tr,
            //                 color: ColorManager.whiteColor),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      title: DefText(size: 20, text: StringManager.homeScreen.tr),
    );
  }
}
