import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDetails extends StatelessWidget {
  final Animation<double> spendContainerOpacity;
  final int? selectedCard;
  const CardDetails({
    Key? key,
    required this.spendContainerOpacity,
    required this.selectedCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeTransition(
        opacity: spendContainerOpacity,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.grey[400],
                  height: 2,
                ),
                CardHistory(
                  title: "Spend at Netflix",
                  subtitle: "29 April, 1:32 AM",
                  amount: "-\$15",
                  color: Colors.red,
                ),
                CardHistory(
                  title: "Spend at Amazon",
                  subtitle: "27 April, 4:22 PM",
                  amount: "-\$399",
                  color: Colors.red,
                ),
                CardHistory(
                  title: "Cashback Received",
                  subtitle: "22 April, 2:45 AM",
                  amount: "+\$62",
                  color: Colors.green,
                ),
                CardHistory(
                  title: "Money Added",
                  subtitle: "20 April, 10:45 PM",
                  amount: "+\$600",
                  color: Colors.green,
                ),
                CardHistory(
                  title: "Paid to James Bond",
                  subtitle: "01 April, 8:32 PM",
                  amount: "-\$9999",
                  color: Colors.green,
                ),
                CardHistory(
                  title: "Paid for order #007007",
                  subtitle: "01 March, 12:11 PM",
                  amount: "-\$7",
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardHistory extends StatelessWidget {
  const CardHistory({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.color,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle, style: GoogleFonts.montserrat()),
      trailing: Text(
        amount,
        style: GoogleFonts.montserrat(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
