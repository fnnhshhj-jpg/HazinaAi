import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileService {
  FileService._();

  static final FileService instance = FileService._();

  /// Ilova hujjatlar papkasini olish
  Future<Directory> getAppDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  /// Faylga matn yozish
  Future<File> writeFile({
    required String fileName,
    required String content,
  }) async {
    final dir = await getAppDirectory();
    final file = File('${dir.path}/$fileName');

    return await file.writeAsString(content);
  }

  /// Fayldan matn o‘qish
  Future<String?> readFile(String fileName) async {
    try {
      final dir = await getAppDirectory();
      final file = File('${dir.path}/$fileName');

      if (!await file.exists()) {
        return null;
      }

      return await file.readAsString();
    } catch (_) {
      return null;
    }
  }

  /// Fayl mavjudligini tekshirish
  Future<bool> exists(String fileName) async {
    final dir = await getAppDirectory();
    final file = File('${dir.path}/$fileName');

    return file.exists();
  }

  /// Faylni o‘chirish
  Future<void> deleteFile(String fileName) async {
    final dir = await getAppDirectory();
    final file = File('${dir.path}/$fileName');

    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Papkadagi barcha fayllarni olish
  Future<List<FileSystemEntity>> getFiles() async {
    final dir = await getAppDirectory();
    return dir.listSync();
  }
}