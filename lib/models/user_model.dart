class UserModel {
  static String name = '';
  static String email = '';
  static String phone = '';
  static String address = '';
  static String img = '';

  List<Map<String, dynamic>> usersData = [
    {
      'nama': 'xeyla',
      'email': 'xeyla@gmail.com',
      'no': '085183520848',
      'address': 'beji',
      'img': 'assets/xeyla.png',
    },
    {
      'nama': 'najma',
      'email': 'najma@gmail.com',
      'no': '08123456789',
      'address': 'debar',
      'img': 'assets/jema.jpg',
    },
    {
      'nama': 'Dzaky',
      'email': 'Dzaky@gmail.com',
      'no': '08123456789',
      'address': 'mares',
      'img': 'assets/dzaky.png',
    },
  ];

  UserModel(String inputEmail) {
    for (var u in usersData) {
      if (u['email'] == inputEmail) {
        name = u['nama'] ?? '';
        email = u['email'] ?? '';
        phone = u['no'] ?? '';
        address = u['address'] ?? '';
        img = u['img'] ?? '';
        return;
      }
    }
  }
}
