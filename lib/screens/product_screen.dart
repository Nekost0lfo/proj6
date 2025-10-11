import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/product_card.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _quantity = 1;
  bool _isAddedToCart = false;

  void _addToCart() {
    setState(() {
      _isAddedToCart = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} added to cart'),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.surface,
              ),
              child: widget.product.imageUrl.isNotEmpty
                  ? Image.asset(
                      'assets/images/${widget.product.imageUrl}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.background,
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 64,
                            color: AppColors.textHint,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: AppColors.background,
                      child: const Icon(
                        Icons.image,
                        size: 64,
                        color: AppColors.textHint,
                      ),
                    ),
            ),
            
            // Product Info
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  Text(
                    widget.product.category,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Product Name
                  Text(
                    widget.product.name,
                    style: AppTextStyles.h3,
                  ),
                  const SizedBox(height: 12),
                  
                  // Rating
                  if (widget.product.rating > 0) ...[
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 20,
                          color: AppColors.accent,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.product.rating.toStringAsFixed(1),
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${widget.product.reviewCount} reviews)',
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  
                  // Price
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.priceLarge,
                  ),
                  const SizedBox(height: 20),
                  
                  // Description
                  Text(
                    'Description',
                    style: AppTextStyles.h5,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.description,
                    style: AppTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  
                  // Quantity Selector
                  Text(
                    'Quantity',
                    style: AppTextStyles.h5,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: _decrementQuantity,
                              icon: const Icon(Icons.remove),
                              constraints: const BoxConstraints(
                                minWidth: 40,
                                minHeight: 40,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '$_quantity',
                                style: AppTextStyles.bodyLarge.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: _incrementQuantity,
                              icon: const Icon(Icons.add),
                              constraints: const BoxConstraints(
                                minWidth: 40,
                                minHeight: 40,
                              ),
                            ),
                          ],
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
      bottomNavigationBar: Container(
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
          child: Row(
            children: [
              // Total Price
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: AppTextStyles.caption,
                    ),
                    Text(
                      '\$${(widget.product.price * _quantity).toStringAsFixed(2)}',
                      style: AppTextStyles.priceLarge,
                    ),
                  ],
                ),
              ),
              
              // Add to Cart Button
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: _isAddedToCart ? null : _addToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isAddedToCart ? AppColors.success : AppColors.primary,
                    foregroundColor: AppColors.buttonText,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _isAddedToCart ? 'Added to Cart' : 'Add to Cart',
                    style: AppTextStyles.buttonLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

