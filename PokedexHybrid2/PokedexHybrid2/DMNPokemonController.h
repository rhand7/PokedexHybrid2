//
//  DMNPokemonController.h
//  PokedexHybrid2
//
//  Created by handje on 5/11/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMNPokemon; //since we're not doing anything with the DMNPokemon we can make a class, if we do anything #import

NS_ASSUME_NONNULL_BEGIN  //assumes all objects have a value, and allows us to set objects as nullable aka optional

@interface DMNPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(DMNPokemon * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
