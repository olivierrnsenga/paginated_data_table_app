// lib/bloc/item_event.dart
abstract class ItemEvent {}

class FetchItems extends ItemEvent {
  final int page;
  final int pageSize;

  FetchItems({required this.page, required this.pageSize});
}
