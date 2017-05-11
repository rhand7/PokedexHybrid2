//
//  DMNPokemonController.m
//  PokedexHybrid2
//
//  Created by handje on 5/11/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "DMNPokemonController.h"
#import "DMNPokemon.h"
#import "PokedexHybrid2-Swift.h"

static NSString * const baseURLString = @"http://pokeapi.co/api/v2/pokemon/";

@implementation DMNPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(DMNPokemon * _Nullable))completion
{
    if (!completion) { completion = ^(DMNPokemon *p) { }; } //default value if completion is nil
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    [NetworkController performRequestFor:searchTerm httpMethodString:@"GET" urlParameters:nil body:nil completion:^(NSData * data, NSError * error) {
        
        if (error) {
            NSLog(@"Error getting Pokemon for %@: %@", searchTerm, error);
            completion(nil);
            return;
        }
        
        NSDictionary *dictonary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (!dictonary || ![dictonary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error parsing json: %@", error);
            completion(nil);
            return;
        }
        DMNPokemon *pokemon = [[DMNPokemon alloc] initWithDictionary:dictonary];
        completion(pokemon); 
    }];
}

@end
