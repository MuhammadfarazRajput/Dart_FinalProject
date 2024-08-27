import 'dart:io';
import 'class.dart';


void main() {

   print("\n Welcome To the NonStop Cafe");
  Restaurant restaurant = Restaurant();

  // Add some menu items
  restaurant.addMenuItem(MenuItem('Biryani', 560));
  restaurant.addMenuItem(MenuItem('Pizza', 899.9));
  restaurant.addMenuItem(MenuItem('Nan', 30));

  bool running = true;

  while (running) {
            print("\n");
            
            print('1. Show Menu');
            print('2. Place Order');
            print('3. Checkout');
            print('4. Exit');
            print("\n");
            stdout.write('Select an option: ');
            print("\n");
            String? choice = stdin.readLineSync()?.trim();

    switch (choice) {
      case '1':
        restaurant.showMenu();
        break;
      case '2':
        restaurant.showMenu();
        if (restaurant.menu.isEmpty) {
          print('Cannot place order. The menu is empty.');
          break;
        }
        stdout.write('Enter item name: ');
        String? itemName = stdin.readLineSync()?.trim();
        if (itemName == null || itemName.isEmpty) {
          print('Invalid item name.');
          break;
        }
        MenuItem? item = restaurant.findMenuItemByName(itemName);
        if (item != null) {
          restaurant.placeOrder(item);
        } else {
          print('Item not found.');
        }
        break;
      case '3':
        restaurant.checkout();
        break;
      case '4':
        running = false;
        print('ThankYou and Visit Again Exiting...\n');
        break;
      default:
        print('Invalid option. Please try again.');
    }
  }
}
