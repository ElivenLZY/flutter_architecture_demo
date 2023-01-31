
///接口请求
abstract class IUserApi {
  Future<String> getUserInfo();

  Stream<String> getUserInfo2();
}

class UserApi implements IUserApi {
  ///接口地址
  final String _getUserInfoUrl = 'api/getUserInfo';

  @override
  Future<String> getUserInfo() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'name';
  }

  @override
  Stream<String> getUserInfo2() {
    return Stream.fromFuture(Future.delayed(const Duration(seconds: 1)))
        .map((event) => 'name');
  }
}
