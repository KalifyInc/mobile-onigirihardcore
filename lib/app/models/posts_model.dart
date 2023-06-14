// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostsModel {
  final String author;
  final String bodyPost;
  final String categories;
  final String image;
  final String imageUrl;
  final String title;
  final String citation;
  final String date;
  final String description;
  final String lessDate;
  final String linkCitation;
  final String moreDate;
  final String slug;
  final String ytid;
  PostsModel({
    required this.author,
    required this.bodyPost,
    required this.categories,
    required this.image,
    required this.imageUrl,
    required this.title,
    required this.citation,
    required this.date,
    required this.description,
    required this.lessDate,
    required this.linkCitation,
    required this.moreDate,
    required this.slug,
    required this.ytid,
  });

  PostsModel copyWith({
    String? author,
    String? bodyPost,
    String? categories,
    String? image,
    String? imageUrl,
    String? title,
    String? citation,
    String? date,
    String? description,
    String? lessDate,
    String? linkCitation,
    String? moreDate,
    String? slug,
    String? ytid,
  }) {
    return PostsModel(
      author: author ?? this.author,
      bodyPost: bodyPost ?? this.bodyPost,
      categories: categories ?? this.categories,
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      citation: citation ?? this.citation,
      date: date ?? this.date,
      description: description ?? this.description,
      lessDate: lessDate ?? this.lessDate,
      linkCitation: linkCitation ?? this.linkCitation,
      moreDate: moreDate ?? this.moreDate,
      slug: slug ?? this.slug,
      ytid: ytid ?? this.ytid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'bodyPost': bodyPost,
      'categories': categories,
      'image': image,
      'imageUrl': imageUrl,
      'title': title,
      'citation': citation,
      'date': date,
      'description': description,
      'lessDate': lessDate,
      'linkCitation': linkCitation,
      'moreDate': moreDate,
      'slug': slug,
      'ytid': ytid,
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      author: map['author'] as String,
      bodyPost: map['bodyPost'] as String,
      categories: map['categories'] as String,
      image: map['image'] as String,
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      citation: map['citation'] as String,
      date: map['date'] as String,
      description: map['description'] as String,
      lessDate: map['lessDate'] as String,
      linkCitation: map['linkCitation'] as String,
      moreDate: map['moreDate'] as String,
      slug: map['slug'] as String,
      ytid: map['ytid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsModel.fromJson(String source) =>
      PostsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostsModel(author: $author, bodyPost: $bodyPost, categories: $categories, image: $image, imageUrl: $imageUrl, title: $title, citation: $citation, date: $date, description: $description, lessDate: $lessDate, linkCitation: $linkCitation, moreDate: $moreDate, slug: $slug, ytid: $ytid)';
  }

  @override
  bool operator ==(covariant PostsModel other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.bodyPost == bodyPost &&
        other.categories == categories &&
        other.image == image &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.citation == citation &&
        other.date == date &&
        other.description == description &&
        other.lessDate == lessDate &&
        other.linkCitation == linkCitation &&
        other.moreDate == moreDate &&
        other.slug == slug &&
        other.ytid == ytid;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        bodyPost.hashCode ^
        categories.hashCode ^
        image.hashCode ^
        imageUrl.hashCode ^
        title.hashCode ^
        citation.hashCode ^
        date.hashCode ^
        description.hashCode ^
        lessDate.hashCode ^
        linkCitation.hashCode ^
        moreDate.hashCode ^
        slug.hashCode ^
        ytid.hashCode;
  }
}
