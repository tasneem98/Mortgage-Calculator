import 'package:flutter/material.dart';

import '/utils/mortgage_class.dart';
import '../main.dart' show intl;
import '../widgets/text_widget.dart';

class MortgagePage extends StatefulWidget {
  const MortgagePage({super.key});

  @override
  State<MortgagePage> createState() => _MortgagePageState();
}

class _MortgagePageState extends State<MortgagePage> {
  // Mortgage Data
  final mortgageData = MortgageClass();

  // initial values
  double _purchasePrice = 450000.0;
  double _downPayment = 135000.0;
  double _time = 25.0;
  double _rate = 3.0;

  bool _isVisible = false;

  // results
  int _loanAmount = 0;
  int _mortgageResult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.0,
              children: [
                Center(
                  child: Text(
                    'Mortgage Calculator',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                25.height,
                // const SizedBox(height: 25.0),

                // Purchase Price
                TextWidget(
                  title: 'Purchase Price: ',
                  value: _purchasePrice.toInt(),
                ),
                Slider(
                  max: mortgageData.purchasePriceMaximum,
                  min: mortgageData.purchasePriceMinimum,
                  value: _purchasePrice,
                  onChanged: (val) => setState(() => _purchasePrice = val),
                ),

                // Down Payment
                TextWidget(
                  title: 'Down Payment: ',
                  value: _downPayment.toInt(),
                ),
                Slider(
                  max: mortgageData.downPaymentMaximum,
                  min: mortgageData.downPaymentMinimum,
                  value: _downPayment,
                  onChanged: (val) => setState(() => _downPayment = val),
                ),

                // Repayment Time
                TextWidget(title: 'Repayment Time: ', value: _time.toInt()),
                Slider(
                  max: mortgageData.repaymentTimeMaximum,
                  min: mortgageData.repaymentTimeMinimum,
                  value: _time,
                  onChanged: (val) => setState(() => _time = val),
                ),

                // Interest Rate
                TextWidget(title: 'Interest Rate: ', value: _rate.toInt()),

                Slider(
                  max: mortgageData.interestRateMaximum,
                  min: mortgageData.interestRateMinimum,
                  value: _rate,
                  onChanged: (val) => setState(() => _rate = val),
                ),
                25.height,

                // Loan Amount
                Visibility(
                  visible: _isVisible,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Loan Amount:', style: kBold24),
                      Text('\$${intl.format(_loanAmount)}', style: kBold28),
                      25.height,
                      // Estimated pr.month
                      Text('Estimated pr.month:', style: kBold24),
                      Text('\$${intl.format(_mortgageResult)}', style: kBold28),
                    ],
                  ),
                ),

                25.height,

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Show results
                        _isVisible = true;

                        // Calculate loan amount
                        _loanAmount = mortgageData.loanAmount(
                          purchasePrice: _purchasePrice.toInt(),
                          downPayment: _downPayment.toInt(),
                        );

                        // Calculate mortgage result
                        _mortgageResult = mortgageData.mortgagePayment(
                          loanAmount: _loanAmount,
                          time: _time.toInt(),
                          rate: _rate.toInt(),
                        );
                      });
                    },
                    child: const Text('Get a mortgage quote'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Extension for height
extension Height on num {
  SizedBox get height => SizedBox(height: toDouble());
}
