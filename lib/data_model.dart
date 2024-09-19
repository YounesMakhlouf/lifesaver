class nUser {
  String name;
  int cin;
  int age;
  String image;
  String? email;
  String groupeSanguin;
  int points = 0;
  List<Donation>? donationHistory;

  nUser(
      {required this.name,
      required this.cin,
      required this.age,
      required this.groupeSanguin,
      required this.points,
      this.email,
      required this.image,
      this.donationHistory});
}

class Donation {
  final String date;
  final String location;
  final nUser beneficiary;

  Donation(
      {required this.date, required this.location, required this.beneficiary});
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

class Demande {
  String date;
  String description;

  Demande({required this.date, required this.description});
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
List<Donation> donationHistory = [
  Donation(
      date: '2023-11-10',
      location: 'Centre national de transfusion sanguine, CTNS',
      beneficiary: kotkot2),
  Donation(
      date: '2023-09-15',
      location: "Collecte de sang a l'INSAT",
      beneficiary: kotkot2),
  Donation(
      date: '2023-07-20',
      location: 'Centre national de transfusion sanguine, CTNS',
      beneficiary: kotkot2),
];

nUser kotkot = nUser(
    name: "Salma Bouabidi",
    image: "images/avatar2.png",
    cin: 11003345,
    age: 21,
    groupeSanguin: "AB",
    points: 20,
    donationHistory: donationHistory);
nUser kotkot2 = nUser(
    name: "Iron Man",
    image: "images/avatar.png",
    cin: 11003345,
    age: 21,
    groupeSanguin: "AB",
    points: 40);
nUser kotkot3 = nUser(
    name: "Ahmed Mohsen",
    image: "images/avatar3.png",
    cin: 11003345,
    age: 21,
    groupeSanguin: "AB",
    points: 60);
nUser kotkot4 = nUser(
    name: "Younes Makhlouf",
    image: "images/avatar.png",
    cin: 11003345,
    age: 21,
    groupeSanguin: "AB",
    points: 100);
List<nUser> users = [kotkot4, kotkot3, kotkot2, kotkot];

var e = Event(
    name: "Chaque goutte compte",
    location: "INSAT, Centre Urbain Nord",
    date: "23-11-2023",
    image: "images/event1.png",
    description:
        "L'événement XXX est une initiative de don du sang organisée par le Club XXX en collaboration avec le Centre National de Transfusion Sanguine. Prévu pour le [date] à [lieu]. Rejoignez-nous pour faire une différence significative");
var e2 = Event(
    name: "Sauvons des vies ensemble",
    location: "ENIT",
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
        "Profitez d'un bon de récudtion en présentant simplement votre QR code ou en utilisant le code promo. Offre valable jusqu'au 30/11/2023.");
var r2 = Reward(
    cost: 20,
    name: "Free delivery",
    location: "Glovo",
    image: "images/reward2.png",
    description:
        "Obtenez une livraison gratuite en présentant simplement votre code promo. Offre valable jusqu'au 30/11/2023.");

var r3 = Reward(
    cost: 20,
    name: "Acces gratuit aux cours de yoga",
    location: "California Gym",
    image: "images/reward3.png",
    description:
        "Obtenez un accès gratuit en présentant simplement votre QR code ou en utilisant le code promo à votre arrivée à l'espace de cours. Offre valable jusqu'au 30/11/2023.");

List<Reward> rewards = [r, r2, r3];

Demande d1 = Demande(
    date: "24-08-2023",
    description:
        "[NOM] : Agé de 8 ans, combat le cancer et a besoin de dons de sang AB. Soutenez-le.");

List<Demande> demandes = [d1, d1, d1, d1];

final nUser currentUser = kotkot;
