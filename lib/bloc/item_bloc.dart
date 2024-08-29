import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/item_model.dart';
import '../repository/item_repository.dart';
import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc({required this.itemRepository}) : super(ItemInitial()) {
    on<FetchItems>(_onFetchItems);
  }

  Future<void> _onFetchItems(FetchItems event, Emitter<ItemState> emit) async {
    emit(ItemLoading());

    try {
      final response =
          await itemRepository.fetchItems(event.page, event.pageSize);

      // Parsing the response
      final itemsData = response['items'] as List<dynamic>;
      final items = itemsData.map((data) => Item.fromJson(data)).toList();

      emit(ItemLoaded(
        items: items,
        pageSize: response['pageSize'],
        totalItems: response['totalItems'],
        currentPage: response['currentPage'],
        totalPages: response['totalPages'],
      ));
    } catch (e) {
      emit(ItemError(message: e.toString()));
    }
  }
}
