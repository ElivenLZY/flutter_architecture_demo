import 'package:flutter_architecture_demo/repository/user/user_api.dart';
import 'package:flutter_architecture_demo/repository/user/user_local.dart';

/// Desc :数据仓库
/// 1，可以聚合处理多个来源的数据，比如网络/本地（数据库/文件/sp数据）
/// 2，对数据进行转换
abstract class IUserRepository {
  ///演示跟据版本号获取新老接口数据
  Stream<String> getUserInfo();
}

class UserRepository implements IUserRepository {

  @override
  Stream<String> getUserInfo() {
    return Stream.fromFuture(Future.delayed(const Duration(seconds: 1)))
        .map((event) => 'name');
  }

}
