import 'package:budgetmate/Shared/Enums.dart';
import 'package:budgetmate/Shared/Extensions.dart';
import 'package:flutter/material.dart';

class DashboardTransaction extends StatelessWidget {
  TransactionType transactionType = TransactionType.income;
  TransactionCategory transactionCategory;
  num amount;
  DateTime dateTime;
  DashboardTransaction(this.transactionType, this.transactionCategory,
      this.amount, this.dateTime,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xfff0f6f5),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Icon(
                size: 30,
                transactionType == TransactionType.income
                    ? Icons.arrow_circle_down_rounded
                    : Icons.arrow_circle_up_rounded,
                color: transactionType == TransactionType.income
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionCategory.label!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text("${dateTime.month}, ${dateTime.day}, ${dateTime.year}")
              ],
            ),
          ),
          const Spacer(),
          Text(
            "${transactionType == TransactionType.income ? "+" : "-"}\$ ${amount.toStringAsFixed(2)}",
            style: TextStyle(
                color: transactionType == TransactionType.income
                    ? Colors.green
                    : Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
