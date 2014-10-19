main() {
  var name = "World";
  print("Hello $name");
}

class Point {
  int x, y;
  
  Point(this.x, this.y);
  Point.zero() : x = 0, y = 0;
  
  String toString() => "x: $x, y: $y";
}
