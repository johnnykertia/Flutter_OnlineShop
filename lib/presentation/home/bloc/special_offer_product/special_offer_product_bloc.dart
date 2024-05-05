import 'package:bloc/bloc.dart';
import 'package:flutter_online_shop/data/datasources/product_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'special_offer_product_event.dart';
part 'special_offer_product_state.dart';
part 'special_offer_product_bloc.freezed.dart';

class SpecialOfferProductBloc
    extends Bloc<SpecialOfferProductEvent, SpecialOfferProductState> {
  final ProductRemoteDataSources _productRemoteDataSources;
  SpecialOfferProductBloc(
    this._productRemoteDataSources)
      : super(const _Initial()) {
    on<SpecialOfferProductEvent>((event, emit) async {
      final response = await _productRemoteDataSources.getProductsByCategory(4);
      response.fold(
          (l) => emit(
              const SpecialOfferProductState.error('Internal Server Error')),
          (r) => emit(SpecialOfferProductState.loaded(r.data!.data!)));
    });
  }
}
