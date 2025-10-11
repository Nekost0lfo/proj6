import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.rating = 0.0,
    this.reviewCount = 0,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Product Image
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                color: AppColors.background,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: product.imageUrl.isNotEmpty
                    ? Image.asset(
                        'assets/images/${product.imageUrl}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.background,
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 48,
                              color: AppColors.textHint,
                            ),
                          );
                        },
                      )
                    : Container(
                        color: AppColors.background,
                        child: const Icon(
                          Icons.image,
                          size: 48,
                          color: AppColors.textHint,
                        ),
                      ),
              ),
            ),
            
            // Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Category
                    Text(
                      product.category,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    
                    // Product Name
                    Text(
                      product.name,
                      style: AppTextStyles.productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    
                    // Rating
                    if (product.rating > 0) ...[
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: AppColors.accent,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            product.rating.toStringAsFixed(1),
                            style: AppTextStyles.caption.copyWith(fontSize: 10),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '(${product.reviewCount})',
                            style: AppTextStyles.caption.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                    ],
                    
                    // Price and Add to Cart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: AppTextStyles.priceMedium.copyWith(fontSize: 14),
                        ),
                        InkWell(
                          onTap: onAddToCart,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add_shopping_cart,
                              size: 14,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

