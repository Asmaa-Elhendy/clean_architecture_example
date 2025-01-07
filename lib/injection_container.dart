import 'package:clean_architecture_project/core/network/network_info.dart';
import 'package:clean_architecture_project/features/posts/data/datasources/post_local-data_source.dart';
import 'package:clean_architecture_project/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_project/features/posts/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_project/features/posts/domain/repositories/post_repository.dart';
import 'package:clean_architecture_project/features/posts/domain/usecases/add_post.dart';
import 'package:clean_architecture_project/features/posts/domain/usecases/delete_post.dart';
import 'package:clean_architecture_project/features/posts/domain/usecases/get_all_posts.dart';
import 'package:clean_architecture_project/features/posts/domain/usecases/update_post.dart';
import 'package:clean_architecture_project/features/posts/presentation/bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';
import 'package:clean_architecture_project/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

final sl = GetIt.instance;

Future<void> init() async {
  ///features- posts

  //bloc
  sl.registerFactory(() => PostsBloc(getAllPostsUseCase: sl()));
  sl.registerFactory(() => AddUpdateDeletePostsBloc(
      addPostsUseCase: sl(),
      updatePostsUseCase: sl(),
      deletePostsUseCase: sl()));

  //useCases
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostsUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostsUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostsUseCase(sl()));

  //repository
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  //dataSources

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  //core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final sharedPreferences =
      await SharedPreferences.getInstance(); //return future
  sl.registerLazySingleton(
      () => sharedPreferences); //get the shared preference instance
  sl.registerLazySingleton(()=>http.Client());

  sl.registerLazySingleton(()=>InternetConnectionChecker);
}
