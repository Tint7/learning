// void main() async {
//   var value = 0;
//   await Future.doWhile(() async {
//     value++;
//     await Future.delayed(const Duration(seconds: 1));
//     if (value == 4) {
//       print('Finished with $value');
//       return false;
//     }
//     return true;
//   });
// }
// Future<void> fetchUserOrder() {
//   // Imagine that this function is fetching user info from another service or database.
//   return Future.delayed(const Duration(seconds: 3), () => print('Large Latte'));
// }

//..

// void main() {
//   fetchUserOrder();
//   print('Fetching user order...');
// }

// Future<void> fetchUserOrder() {
// // Imagine that this function is fetching user info but encounters a bug
//   return Future.delayed(const Duration(seconds: 2),
//       () => throw Exception('Logout failed: user ID is invalid'));
// }

// void main() {
//   fetchUserOrder();
//   print('Fetching user order...');
// }

//....

// Future<String> createOrderMessage() async {
//   var order = await fetchUserOrder();
//   return 'Your order is: $order';
// }

// Future<String> fetchUserOrder() =>
//     // Imagine that this function is
//     // more complex and slow.
//     Future.delayed(
//       const Duration(seconds: 2),
//       () => 'Large Latte',
//     );

// Future<void> main() async {
//   print('Fetching user order...');
//   print(await createOrderMessage());
// }

//--------

// String createOrderMessage() {
//   var order = fetchUserOrder();
//   return 'Your order is: $order';
// }

// Future<String> fetchUserOrder() =>
//     // Imagine that this function is
//     // more complex and slow.
//     Future.delayed(
//       const Duration(seconds: 2),
//       () => 'Large Latte',
//     );

// void main() {
//   print('Fetching user order...');
//   print(createOrderMessage());
// }

//------

// Future<void> printOrderMessage() async {
//   try {
//     print('Awaiting user order...');
//     var order = await fetchUserOrder();
//     print(order);
//   } catch (err) {
//     print('Caught error: $err');
//   }
// }

// Future<String> fetchUserOrder() {
//   // Imagine that this function is more complex.
//   var str = Future.delayed(
//       const Duration(seconds: 4), () => throw 'Cannot locate user order');
//   return str;
// }

// void main() async {
//   await printOrderMessage();
// }

//------

// Future<int> sumStream(Stream<int> stream) async {
//   var sum = 0;
//   await for (final value in stream) {
//     sum += value;
//   }
//   return sum;
// }

// Stream<int> countStream(int to) async* {
//   for (int i = 1; i <= to; i++) {
//     yield i;
//   }
// }

// void main() async {
//   var stream = countStream(10);
//   var sum = await sumStream(stream);
//   print(sum); // 55
// }

//-------
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (final value in stream) {
      sum += value;
    }
  } catch (e) {
    return -1;
  }

  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}

void main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // -1
}

//-------

// import 'dart:convert';
// import 'dart:io';

// void main(List<String> args) async {
//   var file = File(args[0]);
//   var lines =
//       utf8.decoder.bind(file.openRead()).transform(const LineSplitter());
//   await for (final line in lines) {
//     if (!line.startsWith('#')) print(line);
//   }
// }
