import 'package:flutter_architecture_demo/repository/user/user_api.dart';
import 'package:flutter_architecture_demo/repository/user/user_local.dart';

/// Desc :数据仓库
/// 1，可以聚合处理多个来源的数据，比如网络/本地（数据库/文件/sp数据）
/// 2，对数据进行转换
abstract class IUserRepository {
  ///演示获取不同来源数据
  Future<String> getUserInfo();

  ///演示跟据版本号获取新老接口数据
  Stream<String> getUserInfo2();

  ///演示对获取到的数据进行转换
  Stream<int> getUserId();
}

class UserRepository implements IUserRepository {
  final IUserApi _userApi = UserApi();
  final IUserLocal _userLocal = UserLocal();

  @override
  Future<String> getUserInfo() async {
    //如果本地数据为空，则从网络获取
    var user = await _userLocal.getUserInfo();
    if (user.isEmpty) {
      return _userApi.getUserInfo();
    }
    return user;
  }

  @override
  Stream<String> getUserInfo2() {
    var version = 1;
    if (version > 1) {
      return _userApi.getUserInfo2();
    }
    return Stream.fromFuture(_userApi.getUserInfo());
  }

  @override
  Stream<int> getUserId() {
    return _userApi.getUserInfo2().map((event) => 1);
  }
}
