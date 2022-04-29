class ApiResponse {
  ApiResponse({
    this.data,
    this.statusCode,
  });

  Map<String, dynamic>? data;

  int? statusCode;
}