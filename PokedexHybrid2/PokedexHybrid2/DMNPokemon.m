//
//  DMNPokemon.m
//  PokedexHybrid2
//
//  Created by handje on 5/11/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "DMNPokemon.h"

@implementation DMNPokemon

- (instancetype)init
{
    return [self initWithName:@"" identifier:0 abilities:@[]]; 
}

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _identifier = identifier;
        _abilities = [abilities copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger *identifier = [dictionary[@"id"] integerValue];
    NSArray *abilityDictionary = dictionary[@"abilities"];
    
    if (![name isKindOfClass:[NSString class]] || ![abilityDictionary isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in abilityDictionary) {
        NSString *abilityName = dictionary[@"ability"][@"name"];
        if (!abilityName) { continue; }
        [abilities addObject:abilityName];
    }
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
