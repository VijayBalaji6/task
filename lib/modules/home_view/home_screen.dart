import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/constants.dart';
import 'package:task/models/item_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      TopHomeDashBoard(
                          screenHeight: screenHeight, screenWidth: screenWidth),
                      Positioned.fill(
                        top: screenHeight / 5,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: itemMap.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemCard(
                              cardItem: CardItemModel.fromMap(itemMap[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Do More With OneGold',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopHomeDashBoard extends StatelessWidget {
  const TopHomeDashBoard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      color: AppColor.indigo,
      height: screenHeight / 3,
      width: screenWidth,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "\$ 22,650.51",
              style: TextStyle(
                  fontSize: 30,
                  color: AppColor.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: const Row(
                children: [
                  Text(
                    "0.97 %",
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.greenAccent,
                  )
                ],
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Account Value",
              style: TextStyle(
                fontSize: 12,
                color: AppColor.white,
              ),
            ),
            Text(
              "Since last purchase",
              style: TextStyle(
                fontSize: 10,
                color: AppColor.white,
              ),
            )
          ],
        ),
        const Divider(
          color: AppColor.white,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cash Balance",
              style: TextStyle(
                fontSize: 12,
                color: AppColor.white,
              ),
            ),
            Text(
              "Metal Holdings",
              style: TextStyle(
                fontSize: 12,
                color: AppColor.white,
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "\$ 384.87",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.info_outline,
                  color: AppColor.white,
                )
              ],
            ),
            Text(
              "\$ 22,265.64",
              style: TextStyle(
                  fontSize: 20,
                  color: AppColor.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.cardItem,
  });

  final CardItemModel cardItem;

  Color? getCartItemColor(String itemName) {
    switch (itemName) {
      case "Silver":
        return Colors.grey[700];
      case "Gold":
        return Colors.yellow[700];
      case "Platinum":
        return Colors.purple[400];
      default:
        return Colors.purple[400];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: AppColor.grey!.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: getCartItemColor(cardItem.cardItem)!
                              .withOpacity(0.5),
                          radius: 25,
                          child: Icon(
                            Icons.wallet_rounded,
                            size: 30,
                            color: getCartItemColor(cardItem.cardItem),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardItem.cardItem,
                              style: TextStyle(
                                  color: getCartItemColor(cardItem.cardItem),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${cardItem.itemQuantity} oz',
                              style: TextStyle(color: AppColor.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$ ${cardItem.itemTotalCost}",
                          style: const TextStyle(
                              fontSize: 17,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${cardItem.itemPercent} %',
                          style:
                              TextStyle(fontSize: 12, color: AppColor.darkGrey),
                        )
                      ],
                    )
                  ],
                ),
                Divider(
                  color: AppColor.lightGrey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Metal Price",
                          style:
                              TextStyle(fontSize: 12, color: AppColor.darkGrey),
                        ),
                        Text(
                          '\$ ${cardItem.itemCost}',
                          style: const TextStyle(color: AppColor.black),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Change",
                          style: TextStyle(fontSize: 12, color: AppColor.grey),
                        ),
                        Text(
                          '${cardItem.itemChangePercentage} % ',
                          style: TextStyle(fontSize: 12, color: AppColor.brown),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
