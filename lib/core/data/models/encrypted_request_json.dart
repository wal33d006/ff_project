class EncryptedRequestJson {
  final String encryptedRequest;

  const EncryptedRequestJson({
    required this.encryptedRequest,
  });

  Map<String, dynamic> toJson() {
    return {
      'encryptedRequest': encryptedRequest,
    };
  }
}
