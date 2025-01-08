import 'package:clean_architecture_project/features/posts/presentation/pages/post_add_update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/posts/posts_bloc.dart';
import '../widgets/posts_page/message_display_widget.dart';
import '../widgets/posts_page/posts_list_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFltBtn(context));
  }

  AppBar _buildAppBar() => AppBar(
        title: Text("Posts"),
      );

  Widget _buildBody() => Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is LoadingPostsState) {
              return LoadingWidget();
            } else if (state is PostsFetchingSuccessState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: PostsListWidget(posts: state.posts));
            } else if (state is PostsFetchingFailureState) {
              return MessageDisplay(message: state.message);
            }
            return LoadingWidget();
          },
        ),
      );
}

_buildFltBtn(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>PostAddUpdatePage(isUpdate: false)));
    },
    child: Icon(Icons.add),
  );
}

Future<void> _onRefresh(BuildContext context) async {
  BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
}
