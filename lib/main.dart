import 'package:clean_architecture_project/core/app_theme.dart';
import 'package:clean_architecture_project/features/posts/presentation/bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';
import 'package:clean_architecture_project/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:clean_architecture_project/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di; //di: refer to dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<AddUpdateDeletePostsBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Posts App',
        theme: appTheme,
        home: PostsPage(),
      ),
    );
  }
}
