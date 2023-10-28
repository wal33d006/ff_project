class EncryptedResponseJson {
  final String encryptedResponse;

  const EncryptedResponseJson({
    required this.encryptedResponse,
  });

  factory EncryptedResponseJson.fromJson(Map<String, dynamic> json) => EncryptedResponseJson(
        encryptedResponse: json['encryptedResponse'] as String? ?? '',
      );
}
