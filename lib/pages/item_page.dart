import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paginated_data_table_app/pages/item_table.dart';
import '../bloc/item_bloc.dart';
import '../bloc/item_event.dart';
import '../repository/item_repository.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemBloc(itemRepository: ItemRepository())
        ..add(FetchItems(page: 1, pageSize: 10)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Paginated Data Table'),
        ),
        body: const ItemTable(),
      ),
    );
  }
}
