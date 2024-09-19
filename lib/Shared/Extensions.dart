import 'package:budgetmate/Shared/Enums.dart';

extension TransactionIncomeCategoryExtension on TransactionIncomeCategory {
  String? get label {
    switch (this) {
      case TransactionIncomeCategory.salary:
        return 'Salary';
      case TransactionIncomeCategory.bonus:
        return 'Bonus';
      case TransactionIncomeCategory.freelancing:
        return 'Freelancing';
      case TransactionIncomeCategory.investment_gains:
        return 'Investment Gains';
      case TransactionIncomeCategory.rental_income:
        return 'Rental Income';
      case TransactionIncomeCategory.refunds:
        return 'Refunds';
      case TransactionIncomeCategory.grant:
        return 'Grant';
      default:
        return null;
    }
  }
}

extension TransactionExpenseCategoryExtension on TransactionExpenseCategory {
  String? get label {
    switch (this) {
      case TransactionExpenseCategory.rent:
        return 'Rent';
      case TransactionExpenseCategory.utilities:
        return 'Utilities';
      case TransactionExpenseCategory.groceries:
        return 'Groceries';
      case TransactionExpenseCategory.transportation:
        return 'Transportation';
      case TransactionExpenseCategory.insurance:
        return 'Insurance';
      case TransactionExpenseCategory.healthcare:
        return 'Healthcare';
      case TransactionExpenseCategory.entertainment:
        return 'Entertainment';
      case TransactionExpenseCategory.shopping:
        return 'Shopping';
      case TransactionExpenseCategory.dept_payment:
        return 'Dept Payment';
      case TransactionExpenseCategory.investment:
        return 'Investment';
      case TransactionExpenseCategory.taxes:
        return 'Taxes';
      case TransactionExpenseCategory.donation:
        return 'Donation';
    }
  }
}
