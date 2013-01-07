//
//  TaxService.h
//  OCMockDemo
//
//  Created by Pavel Sumarokov on 12/21/12.
//  Copyright (c) 2012 Pavel Sumarokov. All rights reserved.
//

@class Product;

@interface TaxService : NSObject

- (NSDecimalNumber*) stateTaxes:(Product*)product;

@end
