import 'package:bloc/bloc.dart';
import 'package:flutter_online_shop/data/datasources/product_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'best_seller_product_event.dart';
part 'best_seller_product_state.dart';
part 'best_seller_product_bloc.freezed.dart';

class BestSellerProductBloc
    extends Bloc<BestSellerProductEvent, BestSellerProductState> {
  final ProductRemoteDataSources _productRemoteDataSources;
  BestSellerProductBloc(this._productRemoteDataSources)
      : super(const _Initial()) {
    on<_GetBestSellerProducts>((event, emit) async {
      final response = await _productRemoteDataSources.getProductsByCategory(1);
      response.fold(
          (l) =>
              emit(const BestSellerProductState.error('Internal Server Error')),
          (r) => emit(BestSellerProductState.loaded(r.data!.data!)));
    });
  }
}
