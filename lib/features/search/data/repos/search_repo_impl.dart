import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/api/api_service.dart';
import 'search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> getSearch(String val) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q= $val');
      List<BookModel> search = [];
      for (var item in data['items']) {
        search.add(BookModel.fromJson(item));
      }
      return right(search);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
