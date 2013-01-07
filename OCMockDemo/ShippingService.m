//
//  ShippingService.m
//  OCMockDemo
//
//  Created by Pavel Sumarokov on 12/21/12.
//  Copyright (c) 2012 Pavel Sumarokov. All rights reserved.
//

#import "ShippingService.h"

@implementation ShippingService

- (NSDecimalNumber*) shippingCost:(NSArray*)products {
    [NSException raise: @"Unimplemented method" format: @"Implement %@", NSStringFromSelector(_cmd)];
    return nil;
}

@end
