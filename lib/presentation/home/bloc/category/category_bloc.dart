// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/category_remote_datasources.dart';
import '../../../../data/models/responses/category_response_model.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDataSources _categoryRemoteDataSources;
  CategoryBloc(
    this._categoryRemoteDataSources,
  ) : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      final response = await _categoryRemoteDataSources.getCategories();
      response.fold((l) => emit(CategoryState.error('Internal Server Error')),
          (r) => emit(CategoryState.loaded(r.data!)));
      ;
    });
  }
}
