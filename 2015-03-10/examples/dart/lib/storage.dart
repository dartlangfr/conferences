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

void writeToBucket(Storage storage, String bucketName, String userName, List<int> avatar){
  final bucket = storage.bucket(bucketName);
  bucket.writeBytes(userName, avatar).then((ObjectInfo info){
    print('${info.name} created. Access link: ${info.downloadLink}}');
  });
  bucket.read(userName).listen(print);
}
