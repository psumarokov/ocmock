//
//  ShoppingCartTests.m
//  OCMockDemo
//
//  Created by Pavel Sumarokov on 12/21/12.
//  Copyright (c) 2012 Pavel Sumarokov. All rights reserved.
//

#import "ShoppingCartTests.h"
#import "OCMock.h"

#import "ShoppingCart.h"
#import "Product.h"
#import "TaxService.h"
#import "ShippingService.h"

@interface ShoppingCartTestable : ShoppingCart

- (NSDecimalNumber*) subtotal;

@end

@implementation ShoppingCartTestable

- (NSDecimalNumber*) subtotal {
    return [NSDecimalNumber decimalNumberWithString: @"150.00"];
}

@end

@implementation ShoppingCartTests

- (void) testShoppingCartOrderTotal {
    Product *product1 = [Product new];  // costs 100.00
    Product *product2 = [Product new];  // costs 50.00

    id mockTaxService = [OCMockObject mockForClass: [TaxService class]];
    NSDecimalNumber *product1Tax = [NSDecimalNumber decimalNumberWithString: @"10.00"];
    [[[mockTaxService expect] andReturn: product1Tax] stateTaxes: product1];
    NSDecimalNumber *product2Tax = [NSDecimalNumber decimalNumberWithString: @"5.00"];
    [[[mockTaxService expect] andReturn: product2Tax] stateTaxes: product2];

    id mockShippingService = [OCMockObject mockForClass: [ShippingService class]];
    NSDecimalNumber *shippingCost = [NSDecimalNumber decimalNumberWithString: @"20.00"];
    [[[mockShippingService expect] andReturn: shippingCost] shippingCost: OCMOCK_ANY];

    ShoppingCart *shoppingCart = [ShoppingCartTestable new];
    shoppingCart.taxService = mockTaxService;
    shoppingCart.shippingService = mockShippingService;

    [shoppingCart addProduct: product1];
    [shoppingCart addProduct: product2];
    NSDecimalNumber *orderTotal = [shoppingCart orderTotal];

    NSDecimalNumber *expectedOrderTotal = [NSDecimalNumber decimalNumberWithString: @"185.00"];
    STAssertEqualObjects(orderTotal, expectedOrderTotal, @"Verify order total");
    
    [mockTaxService verify];
    [mockShippingService verify];
}

@end
