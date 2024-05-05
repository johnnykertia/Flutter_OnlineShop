import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_online_shop/data/datasources/category_remote_datasources.dart';
import 'package:flutter_online_shop/data/datasources/product_remote_datasources.dart';
import 'package:flutter_online_shop/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_online_shop/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:flutter_online_shop/presentation/home/bloc/special_offer_product/special_offer_product_bloc.dart';
// import 'package:flutter_online_shop/presentation/home/pages/dashboard_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/colors.dart';
import 'core/router/app_router.dart';
import 'presentation/home/bloc/category/category_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(CategoryRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(ProductRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) =>
              BestSellerProductBloc(ProductRemoteDataSources()),
        ),
        BlocProvider(
          create: (context) =>
              SpecialOfferProductBloc(ProductRemoteDataSources()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
