//
//  ShoppingCart.h
//  OCMockDemo
//
//  Created by Pavel Sumarokov on 12/21/12.
//  Copyright (c) 2012 Pavel Sumarokov. All rights reserved.
//


@class Product;
@class TaxService;
@class ShippingService;

@interface ShoppingCart : NSObject

- (void) addProduct:(Product*)product;
- (NSDecimalNumber*) orderTotal;

@property (nonatomic, strong) TaxService *taxService;
@property (nonatomic, strong) ShippingService *shippingService;

@end
