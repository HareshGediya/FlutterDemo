import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/models/post.dart';
import 'package:flutter_demo/modules/posts/cubit/post_cubit.dart';
import 'package:flutter_demo/routers/app_router.dart';
import 'package:flutter_demo/utils/local_notification_manager.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();

    LocalNotificationManager.instance.onSelectNotification =
        (String? payload) async {
      print(payload);
      await Navigator.of(context).pushNamed(AppRouter.productDetailRoute,
          arguments: "From the notification");
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product listing page"),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          } else if (state is PostLoadingFailed) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is PostLoaded) {
            final posts = state.posts;
            return _buildPostList(posts);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildPostList(List<Post> posts) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () async {
            await LocalNotificationManager.instance.showNotification();
            // Navigator.of(context).pushNamed(AppRouter.productDetailRoute,
            //     arguments: "${index + 1}: ${posts[index].title}");
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            child: Text(
              "${index + 1}: ${posts[index].title}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
