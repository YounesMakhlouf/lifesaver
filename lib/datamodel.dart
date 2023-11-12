class User {
  final String name;
  final int CIN;
  final int age;
  final String groupeSanguin;

  User(
      {required this.name,
      required this.CIN,
      required this.age,
      required this.groupeSanguin});
}

class DonationHistory {
  final String date;
  final String name;

  DonationHistory({required this.date, required this.name});
}

class Event {
  String name;
  String location;
  String date;
  String image;
  String description;
  String get imageUrl => "https://picsum.photos/200";

  Event(
      {required this.name,
      required this.location,
      required this.date,
      required this.image,
      required this.description});
}

class Category {
  String name;
  List<Reward> rewards;

  Category({required this.name, required this.rewards});
}

class Reward {
  String name;
  String location;
  int cost;
  String image;
  String description;
  String get imageUrl => "https://picsum.photos/200";

  Reward(
      {required this.name,
      required this.location,
      required this.cost,
      required this.image,
      required this.description});
}

// Declarations
List<DonationHistory> donationHistory = [
  DonationHistory(
    date: '2023-11-10',
    name: 'Centre national de transfusion sanguine, CTNS',
  ),
  DonationHistory(
    date: '2023-09-15',
    name: "Collecte de sang a l'INSAT",
  ),
  DonationHistory(
    date: '2023-07-20',
    name: 'Centre national de transfusion sanguine, CTNS',
  ),
];

User kotkot =
    User(name: "Salma Bouabidi", CIN: 11003345, age: 21, groupeSanguin: "AB");

var e = Event(
    name: "ija tbara3 sahbi",
    location: "INSAT",
    date: "23-11-2023",
    image: "images/event1.png",
    description:
        "L'événement XXX est une initiative de don du sang organisée par le Club XXX en collaboration avec le Centre National de Transfusion Sanguine. Prévu pour le [date] à [lieu]. Rejoignez-nous pour faire une différence significative");
var e2 = Event(
    name: "ija tbara3 marokhra sahbi",
    location: "INSAT nab9a n3awedlek fiha?",
    date: "24-11-2023",
    image: "images/event2.png",
    description:
        "L'événement XXX est une initiative de don du sang organisée par le Club XXX en collaboration avec le Centre National de Transfusion Sanguine. Prévu pour le [date] à [lieu]. Rejoignez-nous pour faire une différence significative");

List<Event> events = [e, e2, e, e2];

var r = Reward(
    cost: 50,
    name: "Bon d'achat 10 DT",
    location: "Monoprix",
    image: "images/reward.png",
    description:
        "Obtenez un accès gratuit en présentant simplement votre QR code ou en utilisant le code promo à votre arrivée à l'espace de cours. Offre valable jusqu'au 30/11/2023.");
var r2 = Reward(
    cost: 20,
    name: "Free delivery",
    location: "Glovo",
    image: "images/reward2.png",
    description:
        "Obtenez un accès gratuit en présentant simplement votre QR code ou en utilisant le code promo à votre arrivée à l'espace de cours. Offre valable jusqu'au 30/11/2023.");

var r3 = Reward(
    cost: 20,
    name: "Acces gratuit aux cours de yoga",
    location: "California Gym",
    image: "images/reward3.png",
    description:
        "Obtenez un accès gratuit en présentant simplement votre QR code ou en utilisant le code promo à votre arrivée à l'espace de cours. Offre valable jusqu'au 30/11/2023.");

List<Reward> rewards = [r, r2, r3];
