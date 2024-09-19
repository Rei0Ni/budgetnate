import 'package:budgetmate/Pages/Main/AddExpense.dart';
import 'package:budgetmate/Pages/Main/AddIncome.dart';
import 'package:budgetmate/Shared/Enums.dart';
import 'package:budgetmate/Shared/Extensions.dart';
import 'package:budgetmate/Widgets/DashboardTransaction.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  String username;
  Map<String, dynamic> dashboard;

  DashboardPage(this.username, this.dashboard, {super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<DashboardTransaction> latestTransactions = [];

  @override
  void initState() {
    super.initState();
    // print(widget.dashboard["LatestTransactions"]);
    populateLatestTransactions();
  }

  Future<void> _handleRefresh() async {
    var dashboardData = await dioHelper.getDashboardData();
    setState(() {
      widget.dashboard = dashboardData!.data;
    });
    populateLatestTransactions();
  }

  void populateLatestTransactions() {
    latestTransactions = [];
    for (var transaction in widget.dashboard["LatestTransactions"]) {
      latestTransactions.add(DashboardTransaction(
          transaction["Id"],
          TransactionType.values[transaction["Type"]],
          TransactionType.values[transaction["Type"]] == TransactionType.income
              ? TransactionIncomeCategory.values[transaction["Category"]].label!
              : TransactionExpenseCategory.values
                  .where((e) => transaction["Category"] == e.idx)
                  .first
                  .label!,
          transaction["Amount"],
          DateTime.parse(transaction["Date"])));
    }

    setState(() {
      latestTransactions = latestTransactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: height * 0.9,
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/Rectangle_9.png',
                      fit: BoxFit.cover,
                      width: width,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 80, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome Back,",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            widget.username,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff2f7e79),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(64, 47, 126, 121),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 5),
                              ),
                            ]),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$ ${(widget.dashboard["Wallet"]["Balance"] as num).toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_circle_down_rounded,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Income',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '\$ ${(widget.dashboard["Wallet"]["Income"] as num).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_circle_up_rounded,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Expense',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '\$ ${(widget.dashboard["Wallet"]["Expense"] as num).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Transactions History',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            child: const Text('See all'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    // DashboardTransaction(
                    //     TransactionType.income,
                    //     TransactionCategory.income_salary,
                    //     8000.00,
                    //     DateTime.now()),
                    widget.dashboard["LatestTransactions"] != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 8),
                            child: SizedBox(
                              height: height * 0.4,
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: latestTransactions,
                              ),
                            ),
                          )
                        : const Expanded(
                            child: Center(
                              child: Text('No transactions to show.'),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(64, 47, 126, 121),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 5),
          ),
        ], borderRadius: BorderRadius.circular(50)),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              // _showTransactionTypeSheet(context);
              _showTransactionTypeDialog();
            },
            backgroundColor: const Color(0xff428681),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home_filled,
                size: 30,
                color: Color(0xff2f7e79),
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
                  Icons.wallet,
                  size: 30,
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
      ),
    );
  }

  void _showTransactionTypeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Transaction Type',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('What type of transaction?'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddIncomePage()),
                      );
                    },
                    child: const Text('Income'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddExpensePage()),
                      );
                    },
                    child: const Text('Expense'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showTransactionTypeDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Transaction Type'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please Choose the Type of Transaction'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Income'),
              onPressed: () {
                print("Income");
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddIncomePage()),
                );
              },
            ),
            TextButton(
              child: const Text('Expense'),
              onPressed: () {
                print("Expense");
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddExpensePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
