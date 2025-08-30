import 'dart:math' show pow;

import '/utils/data.dart';

class MortgageClass {
  final _mortgageData = MortgageData.fromJson({
    "Purchase Price": {"minimum": 100000.0, "maximum": 2000000.0},

    "Down Payment": {"minimum": 10000.0, "maximum": 1000000.0},

    "Repayment Time": {"minimum": 5.0, "maximum": 40.0},
    "Interest Rate": {"minimum": 0.0, "maximum": 20.0},
  });

  // Getters of the minimum values of the mortgage data
  double get purchasePriceMinimum => _mortgageData.purchasePrice!.minimum!;

  double get downPaymentMinimum => _mortgageData.downPayment!.minimum!;

  double get repaymentTimeMinimum => _mortgageData.repaymentTime!.minimum!;

  double get interestRateMinimum => _mortgageData.interestRate!.minimum!;

  // Getters of the maximum values of the mortgage data

  double get purchasePriceMaximum => _mortgageData.purchasePrice!.maximum!;

  double get downPaymentMaximum => _mortgageData.downPayment!.maximum!;

  double get repaymentTimeMaximum => _mortgageData.repaymentTime!.maximum!;

  double get interestRateMaximum => _mortgageData.interestRate!.maximum!;

  // Output
  int loanAmount({required int purchasePrice, required int downPayment}) =>
      purchasePrice - downPayment;

  double _interestRate(int rate) =>
      rate / 100 / 12; // rate / 100(percent) / 12(months)

  double _repaymentTime(int time) => time * 12; // time * 12(months)

  // Output
  int mortgagePayment({
    required int loanAmount,
    required int rate,
    required int time,
  }) {
    /*

    loanAmount * (
    rate * pow( (1+rate), repaymentTime)
    )/(
    pow( (1+rate), repaymentTime) -1
    )

    */

    final interestRate = _interestRate(rate); // interest rate per month
    final repaymentTime = _repaymentTime(time);

    final double result =
        loanAmount *
        (interestRate * pow((1 + interestRate), repaymentTime)) /
        (pow((1 + interestRate), repaymentTime) - 1);

    return result.floor();
  }
}
