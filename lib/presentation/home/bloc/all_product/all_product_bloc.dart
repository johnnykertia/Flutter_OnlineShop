// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_online_shop/data/datasources/product_remote_datasources.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'all_product_bloc.freezed.dart';
part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDataSources _productRemoteDataSources;
  AllProductBloc(
    this._productRemoteDataSources,
  ) : super(const _Initial()) {
    on<_GetAllProduct>((event, emit) async {
      emit(const AllProductState.loading());
      final response = await _productRemoteDataSources.getAllProducts();
      response.fold(
          (l) => emit(const AllProductState.error('Internal Server Error')),
          (r) => emit(AllProductState.loaded(r.data!.data!)));
    });
  }
}
