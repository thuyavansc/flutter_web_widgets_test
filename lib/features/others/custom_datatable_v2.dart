
import 'package:flutter/material.dart';

class CustomDataTableV2 extends StatelessWidget {
  final List<DataRow> rows;
  final String title;
  final Color backgroundColor;

  const CustomDataTableV2({
    Key? key,
    required this.rows,
    required this.title,
    this.backgroundColor = const Color(0xFFF9FAFB),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  elevation: 3,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: 20,
                      dataRowColor: MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.white;
                      }),
                      columns: const [
                        DataColumn(label: Text('Inbox Name')),
                        DataColumn(label: Text('Total Sent')),
                        DataColumn(label: Text('Messages')),
                        DataColumn(label: Text('Max Size')),
                        DataColumn(label: Text('Last Message')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: rows,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomDataTableV2Example extends StatelessWidget {
  const CustomDataTableV2Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDataTableV2(
      title: 'All Inboxes',
      rows: List<DataRow>.generate(
        8,
            (index) => DataRow(
          cells: [
            DataCell(Row(
              children: [
                Icon(Icons.inbox, color: _getRandomColor(index)),
                const SizedBox(width: 10),
                Text('Inbox ${index + 1}')
              ],
            )),
            DataCell(Text('${100 * (index + 1)}')),
            DataCell(Text('${index % 4 + 1}/4')),
            DataCell(Text('${200 + (index * 100)}')),
            DataCell(Text('${index + 1} hours ago')),
            DataCell(Row(
              children: const [
                Icon(Icons.settings),
                SizedBox(width: 10),
                Icon(Icons.edit),
                SizedBox(width: 10),
                Icon(Icons.delete),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Color _getRandomColor(int index) {
    final colors = [Colors.pink, Colors.blue, Colors.green, Colors.purple, Colors.teal];
    return colors[index % colors.length];
  }
}
