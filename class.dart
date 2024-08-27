// Class to represent a menu item
class MenuItem {
  String name;
  double price;

  MenuItem(this.name, this.price);

  
  String toString() {
    return '$name -- $price \Rupees';
  }
}

// Class to represent an order
class Order {
  List<MenuItem> items = [];

  void addItem(MenuItem item) {
    items.add(item);
  }

  double calculateTotal() {
    return items.fold(0, (total, item) => total + item.price);
  }

  @override
  String toString() {
    return items.map((item) => item.toString()).join(', ');
  }
}

// Class to represent the restaurant and manage menu and order
class Restaurant {
  List<MenuItem> menu = [];
  Order order = Order();

  void addMenuItem(MenuItem item) {
    menu.add(item);
  }

  void showMenu() {
    if (menu.isEmpty) {
      print('The menu is currently empty.');
    } else {
      print('--- Menu ---');
      for (var item in menu) {
        print(item);
      }
    }
  }

MenuItem? findMenuItemByName(String itemName) {
  try {
    return menu.firstWhere(
      (menuItem) => menuItem.name.toLowerCase() == itemName.toLowerCase(),
    );
  } catch (e) {
    return null; // If no item is found, return null
  }
}

  void placeOrder(MenuItem item) {
    order.addItem(item);
    print('Item added to order: ${item.name}');
  }

  void checkout() {
    if (order.items.isEmpty) {
      print('No items ordered.');
    } else {
      double total = order.calculateTotal();
      print('Your total is:$total \Rupees');
    }
  }
}
