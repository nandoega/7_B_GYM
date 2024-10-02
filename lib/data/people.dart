// 1. Kelas Person
class Person {
  final String name;
  final String phone;
  final String picture;

  const Person(this.name, this.phone, this.picture);
}

// 2. Variabel List dengan nama people yang memiliki data bertipe object Person, yang merupakan
// hasil mapping data list pada baris 14 kebawah
final List<Person> people = 
  _people.map((e) => Person(e['name'] as String, e['phone'] as String, e['picture'] as String)).toList(growable: false);

final List<Map<String, Object>> _people = 
[
  {
    "_id": "640cab64485c5320804d578",
    "index": 0,
    "guid": "afae8bf8-94e6-4e97-9473-378a412e9df3",
    "isActive": true,
    "balance": "\$3,574.12",
    "picture": "http://placehold.it/32x32",
    "age": 32,
    "eyeColor": "green",
    "name": "Blanche Pena",
    "gender": "female",
    "company": "ZEDALIS",
    "email": "blanchepena@zedalis.com",
    "phone": "+1 (969) 488-2481",
    "address": "917 Hlyard Street, Hasty, Arizona, 7612",
    "about": "Deserunt non laboris sit qui voluptate excepteur pariatur sunt non sit. Commodo eu esse incididunt qui. Nisi ex est et officia.",
    "registered": "2022-03-08T03:18:44 -07:00"
  }
];
