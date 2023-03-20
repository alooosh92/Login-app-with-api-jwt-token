import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Auth/widget/default_widget.dart';
import 'package:login/res/color_manager.dart';
import 'package:login/res/string_manager.dart';
import 'package:login/screen/deatils_screen.dart';
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
    return ListView.builder(
      itemCount: gifts.length,
      itemBuilder: (context, index) {
        return GiftWidget(
          id: gifts[index].id,
          discreption: gifts[index].discreption,
          giftName: gifts[index].giftName,
          image: gifts[index].image,
          prise: gifts[index].prise,
          storNmae: gifts[index].storNmae,
        );
      },
    );
  }
}

class GiftWidget extends StatelessWidget {
  const GiftWidget({
    super.key,
    required this.id,
    required this.discreption,
    required this.giftName,
    required this.image,
    required this.prise,
    required this.storNmae,
  });
  final String id;
  final String storNmae;
  final String giftName;
  final String discreption;
  final String prise;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeatilsScreen(
              id: id,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 238, 209, 231),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 3, top: 3),
                      margin: const EdgeInsets.all(0),
                      child: DefText(
                        text: storNmae,
                        size: 25,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    DefText(text: giftName, size: 15),
                    const DefText(text: 'وصف المنتج:', size: 15),
                    DefText(text: discreption, size: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 187, 27, 147),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 3, top: 3),
                          margin: const EdgeInsets.all(0),
                          child: DefText(
                            text: 'السعر:$prise ل.س',
                            size: 15,
                            color: ColorManager.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 5,
            child: Image.asset(
              image,
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
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

//
//
//list for test
List<GiftWidget> gifts = [
  const GiftWidget(
    id: '1',
    discreption: 'موبايل صنع عام 2022 رام 6 شاشة 6بوصة',
    giftName: 'Mobile S22Ultra',
    image: 'asset/images/mobile.png',
    prise: '2500000',
    storNmae: 'متجر ريبون',
  ),
  const GiftWidget(
    id: '2',
    discreption: 'سبيكر Mp3 صوت واضح وجودة عالية مع Led rgb',
    giftName: 'سبيكر  Mp3',
    image: 'asset/images/speaker.png',
    prise: '17000',
    storNmae: 'Number oun',
  ),
  const GiftWidget(
    id: '3',
    discreption: 'سماعات راسية لاسلكية تعمل نوع ممتاز',
    giftName: 'شاومي',
    image: 'asset/images/airpod.png',
    prise: '45000',
    storNmae: 'موبي ستور',
  ),
  const GiftWidget(
    id: '4',
    discreption: 'نظارات VR الممتازة من شركة شاومي',
    giftName: 'شاومي',
    image: 'asset/images/class.png',
    prise: '278000',
    storNmae: 'موبي ستور',
  ),
  const GiftWidget(
    id: '5',
    discreption: 'سماعات رأسية جيمر نوع ممتازط',
    giftName: 'سماعات رأسية كيرياتيف',
    image: 'asset/images/headset.png',
    prise: '84000',
    storNmae: 'متجر ريبون',
  ),
];
