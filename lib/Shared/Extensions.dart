import 'package:budgetmate/Shared/Enums.dart';

extension CatExtension on TransactionCategory {
  String? get label {
    switch (this) {
      case TransactionCategory.income_salary:
        return 'Salary';
      case TransactionCategory.income_bonus:
        return 'Bonus';
      case TransactionCategory.income_freelancing:
        return 'Freelancing';
      case TransactionCategory.income_investment_gains:
        return 'Investment Gains';
      case TransactionCategory.income_rental_income:
        return 'Rental Income';
      case TransactionCategory.income_refunds:
        return 'Refunds';
      case TransactionCategory.income_grant:
        return 'Grant';

      case TransactionCategory.expense_rent:
        return 'Rent';
      case TransactionCategory.expense_utilities:
        return 'Utilities';
      case TransactionCategory.expense_groceries:
        return 'Groceries';
      case TransactionCategory.expense_transportation:
        return 'Transportation';
      case TransactionCategory.expense_insurance:
        return 'Insurance';
      case TransactionCategory.expense_healthcare:
        return 'Healthcare';
      case TransactionCategory.expense_entertainment:
        return 'Entertainment';
      case TransactionCategory.expense_shopping:
        return 'Shopping';
      case TransactionCategory.expense_dept_payment:
        return 'Dept Payment';
      case TransactionCategory.expense_investment:
        return 'Investment';
      case TransactionCategory.expense_taxes:
        return 'Taxes';
      case TransactionCategory.expense_donation:
        return 'Donation';
      default:
        return null;
    }
  }

  void talk() {
    print('meow');
  }
}
