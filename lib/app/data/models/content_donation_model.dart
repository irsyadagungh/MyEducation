import 'package:cloud_firestore/cloud_firestore.dart';

class ContentDonation {
  String? category;
  String? deadline;
  String? description;
  String? donationTarget;
  String? idContent;
  String? idUser;
  String? location;
  String? photo;
  String? status;
  String? title;
  int? viewers;

  ContentDonation(
      {this.category,
      this.deadline,
      this.description,
      this.donationTarget,
      this.idContent,
      this.idUser,
      this.location,
      this.photo,
      this.status,
      this.title,
      this.viewers});

  factory ContentDonation.fromJson(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot.data()!;
    return ContentDonation(
      category: json['category'],
      deadline: json['deadline'],
      description: json['description'],
      donationTarget: json['donation_target'],
      idContent: json['idContent'],
      idUser: json['idUser'],
      location: json['location'],
      photo: json['photo'],
      status: json['status'],
      title: json['title'],
      viewers: json['viewers'],
    );
  }

  String _parseDeadline(dynamic deadline) {
    if (deadline is Timestamp) {
      // Handle Timestamp type (Firestore timestamp)
      return (deadline as Timestamp).toDate().toString();
    } else if (deadline is String) {
      // Handle String type if needed
      return deadline;
    } else {
      // Handle other types or provide a default value
      return '';
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category'] = category;
    data['deadline'] = deadline;
    data['description'] = description;
    data['donation_target'] = donationTarget;
    data['idContent'] = idContent;
    data['id_user'] = idUser;
    data['location'] = location;
    data['photo'] = photo;
    data['status'] = status;
    data['title'] = title;
    data['viewers'] = viewers;
    return data;
  }
}
