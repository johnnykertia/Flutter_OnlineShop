import 'package:dartz/dartz.dart';
import 'package:flutter_online_shop/core/constants/variables.dart';
import 'package:flutter_online_shop/data/models/responses/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSources {
  Future<Either<String, ProductResponseModel>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/products'));

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Terjadi Kesalahan John');
    }
  }

  Future<Either<String, ProductResponseModel>> getProductsByCategory(int categoryId) async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/products?category_id=$categoryId'));

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Terjadi Kesalahan John');
    }
  }
}
