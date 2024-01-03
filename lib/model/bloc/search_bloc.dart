import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled32/model/medicine_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<Searchword>((event, emit) {
      List<Medicine> searchedTitles = [];
      for (var element in medicines) {
        if (element.trade_name.contains(event.word)) {
          searchedTitles.add(element);
        }
      }
      emit(LoadedWords(medicines: searchedTitles));
    });
  }

  List<Medicine> medicines = [];
}
