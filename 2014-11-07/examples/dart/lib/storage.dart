import 'dart:io';
import 'package:gcloud/storage.dart';


void listBuckets(){
  String project = Platform.environment["GCLOUD_E2E_TEST_PROJECT"];
  String serviceKeyLocation = Platform.environment["GCLOUD_E2E_TEST_KEY"];
  final Storage storage = new Storage(serviceKeyLocation, project);
  storage.listBucketNames().listen(print);
}

void helloWorldBucket(Storage storage, String bucketName){
  storage.bucketExists(bucketName).then((exist){
      if(!exist) {
        storage.createBucket('myBucket').then((Bucket bucket) {
          print('bucket ${bucket.bucketName} is created');
          bucket.writeBytes("HelloWorldDocument", "Hello World".codeUnits).then((ObjectInfo info){
            print('${info.name} created.  You can dowload it at ${info.downloadLink}}');
          });
        });
      }
  });
}
