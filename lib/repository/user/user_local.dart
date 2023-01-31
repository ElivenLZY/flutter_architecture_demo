
///本地数据
abstract class IUserLocal {
  Future<String> getUserInfo();
}

class UserLocal implements IUserLocal {
  @override
  Future<String> getUserInfo() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'name';
  }
}
