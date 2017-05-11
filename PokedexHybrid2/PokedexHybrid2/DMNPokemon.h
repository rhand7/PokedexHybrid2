//
//  DMNPokemon.h
//  PokedexHybrid2
//
//  Created by handje on 5/11/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMNPokemon : NSObject

- (instancetype)initWithName:(NSString *)name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary; 

//                          readonly b/c we're pulling from API
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
//                              cast to NSString so we can bridge from ObjC to String in Swift
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

@end

