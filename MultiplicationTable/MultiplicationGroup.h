//
//  MultiplicationGroup.h
//  MultiplicationTable
//
//  Created by Eduard Galchenko on 6/19/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MultiplicationGroup : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *multiplications;

@end

NS_ASSUME_NONNULL_END
