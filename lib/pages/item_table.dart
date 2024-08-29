import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/item_bloc.dart';
import '../bloc/item_state.dart';
import '../models/item_model.dart';

class ItemTable extends StatelessWidget {
  const ItemTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        if (state is ItemLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ItemLoaded) {
          return PaginatedDataTable(
            header: const Text('Items'),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
            ],
            source: ItemDataSource(state.items),
            rowsPerPage: state.pageSize,
            onRowsPerPageChanged: (value) {
              // Handle rows per page change
            },
            showFirstLastButtons: true,
          );
        } else if (state is ItemError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}

class ItemDataSource extends DataTableSource {
  final List<Item> items;

  ItemDataSource(this.items);

  @override
  DataRow getRow(int index) {
    final item = items[index];
    return DataRow(
      cells: [
        DataCell(Text(item.id.toString())),
        DataCell(Text(item.name)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => items.length;

  @override
  int get selectedRowCount => 0;

  void setSelectedRowCount(int index, bool isSelected) {
    // Handle row selection if needed
  }
}
