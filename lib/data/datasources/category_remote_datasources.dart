import 'package:dartz/dartz.dart';
import 'package:flutter_online_shop/core/constants/variables.dart';
import 'package:flutter_online_shop/data/models/responses/category_response_model.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteDataSources {
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/categories'));

    if (response.statusCode == 200) {
      return Right(CategoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Terjadi Kesalahan John');
    }
  }
}
