import 'package:ff_project/core/domain/failures/encryption_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class EncryptionRepository {
  Future<Either<EncryptionFailure, String>> encrypt(String text);

  Future<Either<EncryptionFailure, String>> decrypt(String text);
}
