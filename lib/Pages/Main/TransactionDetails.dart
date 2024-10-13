import 'package:flutter/material.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          iconSize: 32,
          onPressed: () {
            print("pressed");
          },
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            icon: const Icon(Icons.more_horiz),
            iconSize: 32,
            itemBuilder: (BuildContext context) {
              return {'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Transaction Details",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        // curved background
        Column(
          children: [
            Image.asset(
              'assets/Rectangle_9.png',
              fit: BoxFit.cover,
              width: width,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * 0.75,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 35, //Text
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    width: 80,
                    height: 25,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 231, 231),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Text(
                      "Expense",
                      style: TextStyle(color: Colors.red),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\$ 85.00", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
                Theme(
                    data:
                        ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: const TransactionDetailsExpansionTile())
              ],
            ),
          ),
        )
      ]),
      bottomNavigationBar: const BottomNavigationBar(),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home_outlined,
              size: 30,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.bar_chart_rounded,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.account_balance_wallet,
                size: 30,
                color: Color(0xff2f7e79),
              ),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outlined,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class TransactionDetailsExpansionTile extends StatelessWidget {
  const TransactionDetailsExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: ExpansionTile(
          title: const Text("Transaction Details"),
          initiallyExpanded: true,
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          collapsedTextColor: Colors.black,
          shape: null,
          children: [
            TransactionDetailsEntry("Status", "Expense"),
            TransactionDetailsEntry("Time", "4:30 PM"),
            TransactionDetailsEntry("Date", "Feb 29, 2022"),
            TransactionDetailsEntry("Spending", "\$ 84.00"),
            TransactionDetailsEntry("Total", "\$ 84.00"),
          ]),
    );
  }
}

class TransactionDetailsEntry extends StatelessWidget {
  late String sLeft;
  late String sRight;
  TransactionDetailsEntry(
    this.sLeft,
    this.sRight, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: Text(
          sLeft,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
      Container(margin: const EdgeInsets.only(right: 20.0), child: Text(sRight))
    ]);
  }
}
