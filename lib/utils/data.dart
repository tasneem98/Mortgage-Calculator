class MortgageData {
  Data? purchasePrice;
  Data? downPayment;
  Data? repaymentTime;
  Data? interestRate;

  MortgageData({
    this.purchasePrice,
    this.downPayment,
    this.repaymentTime,
    this.interestRate,
  });

  MortgageData.fromJson(Map<String, dynamic> json) {
    purchasePrice = json['Purchase Price'] != null
        ? Data.fromJson(json['Purchase Price'])
        : null;
    downPayment = json['Down Payment'] != null
        ? Data.fromJson(json['Down Payment'])
        : null;
    repaymentTime = json['Repayment Time'] != null
        ? Data.fromJson(json['Repayment Time'])
        : null;
    interestRate = json['Interest Rate'] != null
        ? Data.fromJson(json['Interest Rate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (purchasePrice != null) {
      data['Purchase Price'] = purchasePrice!.toJson();
    }
    if (downPayment != null) {
      data['Down Payment'] = downPayment!.toJson();
    }
    if (repaymentTime != null) {
      data['Repayment Time'] = repaymentTime!.toJson();
    }
    if (interestRate != null) {
      data['Interest Rate'] = interestRate!.toJson();
    }
    return data;
  }
}

class Data {
  double? minimum;
  double? maximum;

  Data({this.minimum, this.maximum});

  Data.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    maximum = json['maximum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minimum'] = minimum;
    data['maximum'] = maximum;
    return data;
  }
}
