//
//  Parser.h
//  topmovies
//
//  Created by Rocky on 1/19/17.
//  Copyright © 2017 Rocky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject


-(instancetype) initWithContentsOfCsvFile:(NSURL *)url;

@property(strong) NSURL *csvUrl;

-(void) parseCsvFileWithCompletionHandler:(void(^)(NSArray *results) )completionBlock;

@end
