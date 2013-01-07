//
//  ShoppingCart.m
//  OCMockDemo
//
//  Created by Pavel Sumarokov on 12/21/12.
//  Copyright (c) 2012 Pavel Sumarokov. All rights reserved.
//

#import "ShoppingCart.h"
#import "Product.h"
#import "TaxService.h"
#import "ShippingService.h"

@interface ShoppingCart() {
    NSMutableArray *products;
}

@end

@implementation ShoppingCart

@synthesize taxService;
@synthesize shippingService;

- (id)init {
    self = [super init];
    if (self) {
        products = [NSMutableArray arrayWithCapacity: 5];
    }
    return self;
}

- (void) addProduct:(Product*)product {
    [products addObject: product];
}

- (NSDecimalNumber*) orderTotal {
    NSDecimalNumber *result = [self subtotal];

    for (Product *nextProduct in products) {
        NSDecimalNumber *taxForProduct = [taxService stateTaxes: nextProduct];
        result = [result decimalNumberByAdding: taxForProduct];
    }
    
    result = [result decimalNumberByAdding: [shippingService shippingCost: products]];

    return result;
}

- (NSDecimalNumber*) subtotal {
    [NSException raise: @"Not implemented method" format: @"Implement method %@", NSStringFromSelector(_cmd)];
    return nil;
}

@end
