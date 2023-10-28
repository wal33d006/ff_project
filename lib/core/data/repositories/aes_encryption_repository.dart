import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:encrypt/encrypt.dart';
import 'package:ff_project/core/domain/failures/encryption_failure.dart';
import 'package:ff_project/core/domain/repositories/encryption_repository.dart';
import 'package:fpdart/fpdart.dart';

class AesEncryptionRepository implements EncryptionRepository {
  final secretKey = 'FF256FF256K';
  final salt = 'fa9b8ba73fe30d8dfcf4c59532148522';
  final encryptionIv = 'a715fed0af06cce82dcc1e69fc832cfe';

  final _pbkdf2 = Pbkdf2(
    macAlgorithm: Hmac.sha1(),
    iterations: 1000,
    bits: 128,
  );

  Future<Key> _getSecretKey() async {
    final newSecretKey = await _pbkdf2.deriveKeyFromPassword(
      password: secretKey,
      nonce: decodeHexString(salt),
    );

    final secretKeyBytes = await newSecretKey.extractBytes();
    final key = Key.fromBase64(base64Encode(secretKeyBytes));

    return key;
  }

  IV get _iv => IV.fromBase64(base64Encode(decodeHexString(encryptionIv)));

  @override
  Future<Either<EncryptionFailure, String>> encrypt(String text) async {
    try {
      final encrypter = Encrypter(AES(await _getSecretKey(), mode: AESMode.cbc));
      return right(encrypter.encrypt(text, iv: _iv).base64);
    } catch (ex) {
      return left(EncryptionFailure(error: 'Failed to encrypt. Reason: ${ex.toString()}'));
    }
  }

  @override
  Future<Either<EncryptionFailure, String>> decrypt(String text) async {
    try {
      final encrypter = Encrypter(AES(await _getSecretKey(), mode: AESMode.cbc));
      final encrypted = Encrypted.fromBase64(text);
      return right(encrypter.decrypt(encrypted, iv: _iv));
    } catch (ex) {
      return left(EncryptionFailure(error: 'Failed to decrypt. Reason: ${ex.toString()}'));
    }
  }
}
