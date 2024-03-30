class Fee {
  final String? className;
  final String? feeType;
  final String? description;
  final double? amount;

  Fee({
     this.className,
    this.feeType,
    this.description,
    this.amount,
  });

  factory Fee.fromJson(Map<String, dynamic> json) {
    return Fee(
      className: json['className']as String?,
      feeType: json['feeType']as String?,
      description: json['description']as String?,
      amount: json['amount'] is int ? json['amount'].toDouble() : json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'className': className,
      'feeType': feeType,
      'description': description,
      'amount': amount,
    };
  }
  @override
  String toString() {
    return 'Fee(className: $className, feeType: $feeType, description: $description, amount: $amount)';
  }
}
