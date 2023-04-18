import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather/const/colors.dart';
import 'package:weather/const/images.dart';
import 'package:weather/const/strings.dart';
import 'package:weather/controllers/main_controller.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat("yMMMMd").format(DateTime.now());
    var theme = Theme.of(context);
    var controller = Get.put(MainController());
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: date.text.color(theme.primaryColor).make(),
        actions: [
          Obx(
            () =>
             IconButton(
                onPressed: () {
                  controller.changeTheme();
                },
                icon: Icon(controller.isDark.value? Icons.light_mode: Icons.dark_mode, color: theme.iconTheme.color)),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: theme.iconTheme.color))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "KOZHIKODE"
                    .text
                    .fontFamily("poppins.bold")
                    .size(32)
                    .letterSpacing(3)
                    .color(theme.primaryColor)
                    .make(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/sun.png",
                      height: 80,
                      width: 80,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "35$degree",
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 64,
                            fontFamily: "poppins",
                          )),
                      TextSpan(
                          text: "Sunny",
                          style: TextStyle(
                            color: theme.primaryColor,
                            letterSpacing: 3,
                            fontSize: 14,
                            fontFamily: "poppins",
                          ))
                    ]))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.expand_less_rounded,
                            color: theme.iconTheme.color),
                        label: "41$degree"
                            .text
                            .color(theme.iconTheme.color)
                            .make()),
                    TextButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.expand_more_rounded,
                            color: theme.iconTheme.color),
                        label: "27$degree"
                            .text
                            .color(theme.iconTheme.color)
                            .make())
                  ],
                ),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(3, (index) {
                    var iconsList = [cloud, humidity, windspeed];
                    var values = ["68%", "40%", "2.5km/h"];
                    return Column(
                      children: [
                        Image.asset(
                          iconsList[index],
                          width: 60,
                          height: 60,
                        )
                            .box
                            .gray200
                            .padding(const EdgeInsets.all(8))
                            .roundedSM
                            .make(),
                        10.heightBox,
                        values[index].text.make()
                      ],
                    );
                  }),
                ),
                10.heightBox,
                const Divider(),
                10.heightBox,
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            "${index + 1}AM".text.gray200.make(),
                            Image.asset(
                              "assets/night.png",
                              width: 80,
                            ),
                            "38$degree".text.white.make(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                10.heightBox,
                const Divider(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Next 7 days"
                        .text
                        .semiBold
                        .color(theme.primaryColor)
                        .make(),
                    TextButton(onPressed: () {}, child: "View All".text.make())
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    var day = DateFormat("EEEE")
                        .format(DateTime.now().add(Duration(days: index + 1)));
                    return Card(
                      color: theme.cardColor,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: day.text.semiBold
                                    .color(theme.primaryColor)
                                    .make()),
                            Expanded(
                              child: TextButton.icon(
                                  onPressed: null,
                                  icon: Image.asset(
                                    "assets/nightWeather.png",
                                    width: 40,
                                  ),
                                  label: "26$degree"
                                      .text
                                      .color(theme.primaryColor)
                                      .make()),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "37$degree /",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontFamily: "poppins",
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: "26$degree",
                                style: TextStyle(
                                  color: theme.iconTheme.color,
                                  fontFamily: "poppins",
                                  fontSize: 16,
                                ),
                              ),
                            ]))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
