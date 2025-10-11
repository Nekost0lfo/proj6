import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/product_card.dart';
import 'product_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cartItemCount = 0;
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Electronics',
    'Clothing',
    'Books',
    'Home & Garden',
    'Sports',
  ];

  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Wireless Bluetooth Headphones',
      description: 'High-quality wireless headphones with noise cancellation',
      price: 99.99,
      imageUrl: 'wireless.jpg',
      category: 'Electronics',
      rating: 4.5,
      reviewCount: 128,
    ),
    Product(
      id: '2',
      name: 'Smart Watch Series 5',
      description: 'Advanced smartwatch with health monitoring features',
      price: 299.99,
      imageUrl: 'smart5.jpg',
      category: 'Electronics',
      rating: 4.8,
      reviewCount: 89,
    ),
    Product(
      id: '3',
      name: 'Cotton T-Shirt',
      description: 'Comfortable cotton t-shirt in various colors',
      price: 24.99,
      imageUrl: 'tshirt.jpg',
      category: 'Clothing',
      rating: 4.2,
      reviewCount: 45,
    ),
    Product(
      id: '4',
      name: 'Programming Book',
      description: 'Complete guide to Flutter development',
      price: 49.99,
      imageUrl: 'compbook.jpg',
      category: 'Books',
      rating: 4.7,
      reviewCount: 67,
    ),
    Product(
      id: '5',
      name: 'Garden Tools Set',
      description: 'Professional gardening tools for home use',
      price: 79.99,
      imageUrl: 'gtools.jpg',
      category: 'Home & Garden',
      rating: 4.3,
      reviewCount: 23,
    ),
    Product(
      id: '6',
      name: 'Yoga Mat',
      description: 'Non-slip yoga mat for home workouts',
      price: 34.99,
      imageUrl: 'yogamat.jpg',
      category: 'Sports',
      rating: 4.6,
      reviewCount: 156,
    ),
  ];

  List<Product> get _filteredProducts {
    if (_selectedCategory == 'All') {
      return _products;
    }
    return _products.where((product) => product.category == _selectedCategory).toList();
  }

  void _addToCart(Product product) {
    setState(() {
      _cartItemCount++;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _navigateToProduct(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(product: product),
      ),
    );
  }

  void _navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'MAD Shop',
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: _navigateToCart,
                icon: const Icon(
                  Icons.shopping_cart,
                  color: AppColors.textPrimary,
                ),
              ),
              if (_cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.cartBadge,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$_cartItemCount',
                      style: const TextStyle(
                        color: AppColors.buttonText,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                filled: true,
                fillColor: AppColors.surface,
              ),
            ),
          ),
          
          // Category Filter
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    backgroundColor: AppColors.surface,
                    selectedColor: AppColors.primaryLight,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.buttonText : AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    side: BorderSide(
                      color: isSelected ? AppColors.primary : AppColors.border,
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Products Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = _filteredProducts[index];
                  return ProductCard(
                    product: product,
                    onTap: () => _navigateToProduct(product),
                    onAddToCart: () => _addToCart(product),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

