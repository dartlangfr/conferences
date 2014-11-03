import 'dart:io';
import 'package:gcloud/storage.dart';

void listBuckets(Storage storage, String bucketName){
  storage.listBucketNames().listen(print);
  storage.bucketExists(bucketName).then((exist){
    if(!exist) {
      storage.createBucket(bucketName).then((Bucket bucket) {
        print('bucket ${bucket.bucketName} is created');
      });
    }
  });
}

void writeToBucket(Storage storage, String bucketName, String docName){
  final bucket = storage.bucket(bucketName);
  bucket.writeBytes(docName, "Hello World".codeUnits).then((ObjectInfo info){
    print('${info.name} created. Access link: ${info.downloadLink}}');
  });
  bucket.read(docName).listen(print);
}
