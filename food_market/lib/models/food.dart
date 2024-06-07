class Food {
  final int? id;
  final String? name;
  final String? imagePath;
  final int? price;
  final List<String>? ingredients;
  final double? rating;
  final String? estimate;
  final String? description;
  final int quantity;

  Food({
    this.id,
    this.name,
    this.imagePath,
    this.price,
    this.ingredients,
    this.rating,
    this.estimate,
    this.description,
    this.quantity = 1,
  });
}

List<Food> mockFoodList = [
  Food(
    id: 1,
    name: 'Pizza with Tomato Sauce',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%201.png?alt=media&token=050fdff2-5a53-4163-9ba9-8a05d58619f0',
    price: 25,
    ingredients: [
      'Tomato',
      'Meat',
      'Sauce',
      'Leaf',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 2,
    name: 'Puree with Cucumber Topping',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%202.png?alt=media&token=a00fec3b-4d7b-4555-80be-8bf33320155a',
    price: 14,
    ingredients: [
      'Rice',
      'Lemon',
      'Cucumber',
      'Peanut',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 3,
    name: 'Salad with Extra Meat',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%203.png?alt=media&token=96f7201f-e0f1-4008-85f0-b465a49085f3',
    price: 32,
    ingredients: [
      'Egg',
      'Meat',
      'Broccoli',
      'Avocado',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 4,
    name: 'Flower Noodle with Extra Egg',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%204.png?alt=media&token=a561e845-1042-4fb3-91b2-a26e3e677f15',
    price: 17,
    ingredients: [
      'Noodle',
      'Egg',
      'Lime',
      'Shrimp',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 5,
    name: 'Cucumber Salad and Extra Corn',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%205.png?alt=media&token=41e8561f-8e1f-4613-bbf0-0051501b0808',
    price: 19,
    ingredients: [
      'Corn',
      'Long Beans',
      'Wortel',
      'Cabbage',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 6,
    name: 'Pizza with Tomato Sauce',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%201.png?alt=media&token=050fdff2-5a53-4163-9ba9-8a05d58619f0',
    price: 25,
    ingredients: [
      'Tomato',
      'Meat',
      'Sauce',
      'Leaf',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 7,
    name: 'Puree with Cucumber Topping',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%202.png?alt=media&token=a00fec3b-4d7b-4555-80be-8bf33320155a',
    price: 14,
    ingredients: [
      'Rice',
      'Lemon',
      'Cucumber',
      'Peanut',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 8,
    name: 'Salad with Extra Meat',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%203.png?alt=media&token=96f7201f-e0f1-4008-85f0-b465a49085f3',
    price: 32,
    ingredients: [
      'Egg',
      'Meat',
      'Broccoli',
      'Avocado',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 9,
    name: 'Flower Noodle with Extra Egg',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%204.png?alt=media&token=a561e845-1042-4fb3-91b2-a26e3e677f15',
    price: 17,
    ingredients: [
      'Noodle',
      'Egg',
      'Lime',
      'Shrimp',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: 10,
    name: 'Cucumber Salad and Extra Corn',
    imagePath:
        'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/Foodiy%20PNG%20Files%2Fimage%205.png?alt=media&token=41e8561f-8e1f-4613-bbf0-0051501b0808',
    price: 19,
    ingredients: [
      'Corn',
      'Long Beans',
      'Wortel',
      'Cabbage',
    ],
    rating: 0,
    estimate: '10-15 min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
];
