class Post {
  final int id;
  final int userId;
  final String title;
  final String body;
  final String userName; // Nuevo campo para almacenar el nombre del usuario

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.userName,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      userName: '',
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'userName': userName,
    };
  }

  Post copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
    String? userName,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      userName: userName ?? this.userName,
    );
  }
}
