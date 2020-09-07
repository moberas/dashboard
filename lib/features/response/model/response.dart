class Response {
  final int selectedValue;
  final DateTime dateTime;

  Response({this.selectedValue, this.dateTime});

  factory Response.fromJson(Map<String, dynamic> data) {
    if (data == null) return null;
    try {
      return Response(
        selectedValue: data['selectedValue'] ?? 0,
        dateTime: DateTime.parse(data['dateTime']) ?? DateTime.now(),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }
}
