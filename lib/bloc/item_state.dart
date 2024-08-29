// lib/bloc/item_state.dart
import 'package:paginated_data_table_app/models/item_model.dart';

abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<Item> items;
  final int pageSize;
  final int totalItems;
  final int currentPage;
  final int totalPages;

  ItemLoaded({
    required this.items,
    required this.pageSize,
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
  });
}

class ItemError extends ItemState {
  final String message;

  ItemError({required this.message});
}
