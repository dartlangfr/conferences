import 'package:gcloud/storage.dart';

void helloWorldBucket(Storage storage, String bucketName){
  storage.bucketExists(bucketName).then((exist){
      if(!exist) {
        storage.createBucket('myBucket').then((Bucket bucket) {
          print('bucket ${bucket.bucketName} is created');
          bucket.write("Hello world");
        });
      }
    });
}

