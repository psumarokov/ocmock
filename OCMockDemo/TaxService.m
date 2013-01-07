//
//  TaxService.m
//  OCMockDemo
//
//  Created by Pavel Sumarokov on 12/21/12.
//  Copyright (c) 2012 Pavel Sumarokov. All rights reserved.
//

#import "TaxService.h"
#import "Product.h"

@implementation TaxService

- (NSDecimalNumber*) stateTaxes:(Product*)product {
    [NSException raise: @"Unimplemented method" format: @"Implement %@", NSStringFromSelector(_cmd)];
    return nil;
}

@end
