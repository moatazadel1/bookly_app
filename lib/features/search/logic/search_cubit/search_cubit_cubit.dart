import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_cubit_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit(this.searchRepo) : super(SearchCubitInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  final SearchRepo searchRepo;

  Future<void> getSearch({required val}) async {
    emit(SearchCubitLoading());
    var result = await searchRepo.getSearch(val);
    result.fold((failure) {
      emit(SearchCubitFailure(errMessage: failure.toString()));
    }, (searchbooks) {
      emit(SearchCubitSuccess(books: searchbooks));
    });
  }
}
