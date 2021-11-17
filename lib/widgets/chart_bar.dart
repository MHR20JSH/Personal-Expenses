import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, Constraints) {
      return Column(
        children: <Widget>[
          Container(
              height: Constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('${spendingAmount.toStringAsFixed(0)} \$'))),
          SizedBox(
            height: Constraints.maxHeight * 0.05,
          ),
          Container(
            height: Constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    //height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Constraints.maxHeight * 0.05,
          ),
          Container(
            height: Constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
