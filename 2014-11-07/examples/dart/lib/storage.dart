import 'package:gcloud/storage.dart';



void listBuckets(){
  String project = Platform.environment[PROJECT_ENV];
  String serviceKeyLocation = Platform.environment[SERVICE_KEY_LOCATION_ENV];
  final Storage storage = new Storage(client, project);
  storage.listBucketNames().listen(print);
}

void helloWorldBucket(Storage storage, String bucketName){
  storage.bucketExists(bucketName).then((exist){
      if(!exist) {
        storage.createBucket('myBucket').then((Bucket bucket) {
          print('bucket ${bucket.bucketName} is created');
          bucket.write("Hello world");
          bucket.
        });
      }
  });
  storage.
}
/*
void helloACL(Storage storage, Bucket bucket){
  storage.bucketI
}
*/
