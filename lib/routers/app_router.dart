import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/modules/posts/cubit/post_cubit.dart';
import 'package:flutter_demo/modules/posts/pages/product_detail_page.dart';
import 'package:flutter_demo/modules/posts/pages/product_page.dart';
import 'package:flutter_demo/modules/posts/post_repository.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String productDetailRoute = '/productDetail';

  static final pageNotFound = MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text("Page not found"),
      ),
    ),
  );

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print("Route arguments => $args");

    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => PostCubit(PostRepository()),
            child: ProductPage(),
          ),
        );
      case productDetailRoute:
        if (args is String)
          return MaterialPageRoute(
              builder: (_) => ProductDetailPage(item: args));

        return pageNotFound;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
