import 'package:add_task/features/todo/presentation/bloc/todo_app_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/platform/network_info.dart';
import 'domain/entities/task.dart';
import 'domain/usecases/create_task.dart';
import 'domain/usecases/delete_task.dart';
import 'domain/usecases/get_task.dart';
import 'domain/usecases/get_tasks.dart';
import 'domain/usecases/mark_task.dart';
import 'domain/usecases/update_task.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Task Management
  // Bloc
  sl.registerFactory(() => TaskBloc());

  // Use cases
  sl.registerLazySingleton(() => GetTask(sl()));
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => CreateTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));
  sl.registerLazySingleton(() => MarkTask(sl()));
  // classes
  sl.registerLazySingleton(() => <Todo>[]);

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

