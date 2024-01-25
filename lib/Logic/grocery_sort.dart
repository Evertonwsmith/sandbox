import 'package:sandbox/Data/foodLists.dart';

List<String> grocerySort(List items) {
  List one = [];
  List two = [];
  List three = [];
  List four = [];
  List five = [];
  List six = [];
  List seven = [];
  List eight = [];
  List nine = [];
  List ten = [];

  items.forEach((item) {
    if (oneList.contains(item)) {
      one.add(item);
    } else if (twoList.contains(item)) {
      two.add(item);
    } else if (threeList.contains(item)) {
      three.add(item);
    } else if (fourList.contains(item)) {
      four.add(item);
    } else if (fiveList.contains(item)) {
      five.add(item);
    } else if (sixList.contains(item)) {
      six.add(item);
    } else if (sevenList.contains(item)) {
      seven.add(item);
    } else if (eightList.contains(item)) {
      eight.add(item);
    } else if (nineList.contains(item)) {
      nine.add(item);
    } else if (tenList.contains(item)) {
      ten.add(item);
    } else
      (five.add(item));
  });
  List<String> newItems = [];
  int count = 0;
  for (int i = 0; i < one.length; i++) {
    newItems.add(one[i]);
    count++;
  }
  for (int i = 0; i < two.length; i++) {
    newItems.add(two[i]);
    count++;
  }
  for (int i = 0; i < three.length; i++) {
    newItems.add(three[i]);
    count++;
  }
  for (int i = 0; i < four.length; i++) {
    newItems.add(four[i]);
    count++;
  }
  for (int i = 0; i < five.length; i++) {
    newItems.add(five[i]);
    count++;
  }
  for (int i = 0; i < six.length; i++) {
    newItems.add(six[i]);
    count++;
  }
  for (int i = 0; i < seven.length; i++) {
    newItems.add(seven[i]);
    count++;
  }
  for (int i = 0; i < eight.length; i++) {
    newItems.add(eight[i]);
    count++;
  }
  for (int i = 0; i < nine.length; i++) {
    newItems.add(nine[i]);
    count++;
  }
  for (int i = 0; i < ten.length; i++) {
    newItems.add(ten[i]);
    count++;
  }
  print(newItems);
  return newItems;
}
