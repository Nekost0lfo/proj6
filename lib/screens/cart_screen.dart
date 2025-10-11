import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/product_card.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _cartItems = [
    CartItem(
      product: Product(
        id: '1',
        name: 'Wireless Bluetooth Headphones',
        description: 'High-quality wireless headphones with noise cancellation',
        price: 99.99,
        imageUrl: 'wireless.jpg',
        category: 'Electronics',
        rating: 4.5,
        reviewCount: 128,
      ),
      quantity: 2,
    ),
    CartItem(
      product: Product(
        id: '3',
        name: 'Cotton T-Shirt',
        description: 'Comfortable cotton t-shirt in various colors',
        price: 24.99,
        imageUrl: 'tshirt.jpg',
        category: 'Clothing',
        rating: 4.2,
        reviewCount: 45,
      ),
      quantity: 1,
    ),
  ];

  double get _totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void _updateQuantity(CartItem item, int newQuantity) {
    setState(() {
      if (newQuantity <= 0) {
        _cartItems.remove(item);
      } else {
        item.quantity = newQuantity;
      }
    });
  }

  void _removeItem(CartItem item) {
    setState(() {
      _cartItems.remove(item);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.product.name} removed from cart'),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.error,
      ),
    );
  }

  void _proceedToCheckout() {
    if (_cartItems.isEmpty) return;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Checkout'),
        content: Text('Total: \$${_totalPrice.toStringAsFixed(2)}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _cartItems.clear();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Order placed successfully!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: _cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: AppColors.textHint,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add some products to get started',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                // Cart Items List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 2,
                        shadowColor: AppColors.shadow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              // Product Image
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.background,
                                ),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(8),
                                   child: item.product.imageUrl.isNotEmpty
                                       ? Image.asset(
                                           'assets/images/${item.product.imageUrl}',
                                           fit: BoxFit.cover,
                                           errorBuilder: (context, error, stackTrace) {
                                             return Container(
                                               color: AppColors.background,
                                               child: const Icon(
                                                 Icons.image_not_supported,
                                                 size: 32,
                                                 color: AppColors.textHint,
                                               ),
                                             );
                                           },
                                         )
                                       : Container(
                                           color: AppColors.background,
                                           child: const Icon(
                                             Icons.image,
                                             size: 32,
                                             color: AppColors.textHint,
                                           ),
                                         ),
                                 ),
                              ),
                              
                              const SizedBox(width: 16),
                              
                              // Product Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product.name,
                                      style: AppTextStyles.productTitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${item.product.price.toStringAsFixed(2)}',
                                      style: AppTextStyles.priceMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    
                                    // Quantity Controls
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.border),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                onPressed: () => _updateQuantity(item, item.quantity - 1),
                                                icon: const Icon(Icons.remove, size: 16),
                                                constraints: const BoxConstraints(
                                                  minWidth: 32,
                                                  minHeight: 32,
                                                ),
                                                padding: EdgeInsets.zero,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                                child: Text(
                                                  '${item.quantity}',
                                                  style: AppTextStyles.bodyMedium.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () => _updateQuantity(item, item.quantity + 1),
                                                icon: const Icon(Icons.add, size: 16),
                                                constraints: const BoxConstraints(
                                                  minWidth: 32,
                                                  minHeight: 32,
                                                ),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () => _removeItem(item),
                                          icon: const Icon(
                                            Icons.delete_outline,
                                            color: AppColors.error,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Total and Checkout
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        // Total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total (${_cartItems.length} items)',
                              style: AppTextStyles.h5,
                            ),
                            Text(
                              '\$${_totalPrice.toStringAsFixed(2)}',
                              style: AppTextStyles.priceLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        
                        // Checkout Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _proceedToCheckout,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.buttonText,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Proceed to Checkout',
                              style: AppTextStyles.buttonLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
