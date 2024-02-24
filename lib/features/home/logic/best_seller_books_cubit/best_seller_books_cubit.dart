import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchBestSellersBooks() async {
    emit(BestSellerBooksLoading());
    var results = await homeRepo.fetchBestSellersBooks();
    results.fold((failure) {
      emit(BestSellerBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(BestSellerBooksSuccess(books: books));
    });
  }
}
