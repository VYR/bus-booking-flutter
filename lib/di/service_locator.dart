import 'package:get_it/get_it.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/usecases/login_user.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

final GetIt sl = GetIt.instance;

void initDependencies() {
  // Repository
  sl.registerLazySingleton(() => AuthRepositoryImpl());

  // Use Cases
  sl.registerFactory(() => LoginUser(sl()));

  // Blocs
  sl.registerFactory(() => AuthBloc(sl()));
}
