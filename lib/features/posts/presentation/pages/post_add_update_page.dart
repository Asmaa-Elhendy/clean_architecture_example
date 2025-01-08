import 'package:clean_architecture_project/core/util/snackbar_message.dart';
import 'package:clean_architecture_project/core/widgets/loading_widget.dart';
import 'package:clean_architecture_project/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_project/features/posts/presentation/bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';
import 'package:clean_architecture_project/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/post_add_update_page/form_widget.dart';

class PostAddUpdatePage extends StatelessWidget {
  Post? post;
  bool isUpdate;
  PostAddUpdatePage({required this.isUpdate, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(isUpdate ? 'Update Post' : 'Add Post'),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child:
            BlocConsumer<AddUpdateDeletePostsBloc, AddUpdateDeletePostsState>(
                builder: (context, state) {
          if (state is LoadingAddUpdateDeletePostsState) {
            return LoadingWidget();
          }
          //   return SizedBox();
          return FormWidget(isUpdate: isUpdate, post: isUpdate ? post : null);
        }, listener: (context, state) {
          if (state is MessageAddUpdateDeletePostsState) {
            SnackBarMessage()
                .showSuccessSnackBar(message: state.Message, context: context);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => PostsPage()),
                (route) => false);
          } else if (state is ErrorAddUpdateDeletePostsState) {
            SnackBarMessage()
                .showErrorSnackBar(message: state.Message, context: context);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => PostsPage()),
                (route) => false);
          }
        }),
      ),
    );
  }
}
