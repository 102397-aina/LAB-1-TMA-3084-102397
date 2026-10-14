import 'dart:io';

void main() {
  bool continueOrdering = true;
  
  while (continueOrdering) {
    print('=====================================================');
    // Display size and prices of pizza
    print('Pizza Prices:');
    print('Small: \$5');
    print('Medium: \$7');
    print('Large: \$10');

    // Ask order from customer
    stdout.write('Please enter the size of pizza you want to order (small, medium, large): ');
    String? sizeInput = stdin.readLineSync();

    if (sizeInput == null) continue;
    String size = sizeInput.trim().toLowerCase();

    int unitPrice = 0;
    String sizeName = '';

    // Switch statement to match the input size with the corresponding price
    switch (size) {
      case 'small':
        unitPrice = 5;
        sizeName = 'small';
        break;
      case 'medium':
        unitPrice = 7;
        sizeName = 'medium';
        break;
      case 'large':
        unitPrice = 10;
        sizeName = 'large';
        break;
      default:
        print('Invalid size entered. Please enter small, medium, or large.\n');
        continue;
    }

    // Ask for quantity of pizza
    stdout.write('How many pizzas do you want of $sizeName?\n: ');
    String? qtyInput = stdin.readLineSync();
    int? quantity = int.tryParse(qtyInput ?? '');

    if (quantity == null || quantity <= 0) {
      print('Invalid quantity. Please enter a valid number.\n');
      continue;
    }

    // Calculate total price
    int totalPrice = unitPrice * quantity;
    print('Your Total Payment: \$$totalPrice\n');

    // Make another order
    stdout.write('Do you want to make another order? (yes/no): ');
    String? anotherOrderInput = stdin.readLineSync();
    
    if (anotherOrderInput != null && anotherOrderInput.trim().toLowerCase() == 'no') {
      print('Thank you for your order!');
      continueOrdering = false;
    } else {
      print('\n--- Starting New Order ---\n');
    }
  }
}