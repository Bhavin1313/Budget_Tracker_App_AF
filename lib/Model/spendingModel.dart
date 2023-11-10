class Spending {
  int? spending_id;
  String spending_name;
  String spending_amount;
  String spending_time;
  String spending_date;
  String spending_mode;
  String spending_type;

  Spending({
    this.spending_id,
    required this.spending_name,
    required this.spending_amount,
    required this.spending_time,
    required this.spending_date,
    required this.spending_mode,
    required this.spending_type,
  });

  factory Spending.FROMSQL({required Map data}) {
    return Spending(
      spending_name: data['spending_name'],
      spending_amount: data['spending_amount'],
      spending_time: data['spending_time'],
      spending_date: data['spending_date'],
      spending_mode: data['spending_mode'],
      spending_type: data['spending_type'],
      spending_id: data['spending_id'],
    );
  }
}
