import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';

class SimpleBarChart extends StatelessWidget {
  final List<Expense> expenses;

  SimpleBarChart({required this.expenses});

  Map<Category, double> getCategoryTotals() {
    Map<Category, double> totals = {
      Category.Food: 0,
      Category.Leisure: 0,
      Category.Travel: 0,
      Category.Work: 0,
    };

    for (var expense in expenses) {
      totals[expense.category] = totals[expense.category]! + expense.amount;
    }

    return totals;
  }

  @override
  Widget build(BuildContext context) {
    final categoryTotals = getCategoryTotals();

    final List<BarChartGroupData> barGroups = [];
    int i = 0;

    categoryTotals.forEach((category, total) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [BarChartRodData(toY: total, color: const Color.fromARGB(255, 247, 164, 97), width: 20)],
        ),
      );
      i++;
    });

    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const labels = ['Food', 'Leisure', 'Travel', 'Work'];
                  return Text(labels[value.toInt()]);
                },
              ),
            ),
          ),
          barGroups: barGroups,
        ),
      ),
    );
  }
}