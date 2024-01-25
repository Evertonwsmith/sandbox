List<String> grocerySort(List items) {
  List oneList = ['apples', 'banana', 'orange'];
  List twoList = ['coffee', 'cereal', 'tea', 'peanut butter'];
  List threeList = ['rice', 'tin', 'baking'];
  List fourList = ['chickpea', 'beans', 'spice'];
  List fiveList = ['noodle'];
  List sixList = ['sparkling', 'chips', 'water'];
  List sevenList = ['coke', 'pop', 'soda'];
  List eightList = ['tp', 'bags', 'dishsoap'];
  List nineList = ['GF', 'DF', 'Frozen Pizza', 'hashbrowns'];
  List tenList = ['yogurt', 'eggs', 'orange juice'];

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
  // items.forEach((key, value) {
  //   if (oneList.contains(value.toString())) {
  //     one.add(value);
  //   } else if (twoList.contains(value.toString())) {
  //     two.add(value);
  //   } else if (threeList.contains(value.toString())) {
  //     three.add(value);
  //   } else if (fourList.contains(value.toString())) {
  //     four.add(value);
  //   } else if (fiveList.contains(value.toString())) {
  //     five.add(value);
  //   } else if (sixList.contains(value.toString())) {
  //     six.add(value);
  //   } else if (sevenList.contains(value.toString())) {
  //     seven.add(value);
  //   } else if (eightList.contains(value.toString())) {
  //     eight.add(value);
  //   } else if (nineList.contains(value.toString())) {
  //     nine.add(value);
  //   } else if (tenList.contains(value.toString())) {
  //     ten.add(value);
  //   } else {
  //     print('Not in list');
  //     five.add(value);
  //   }
  // });
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
