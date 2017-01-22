//
//  Parser.m
//  topmovies
//
//  Created by Rocky on 1/19/17.
//  Copyright © 2017 Rocky. All rights reserved.
//

#import "Parser.h"

@implementation Parser

-(instancetype) initWithContentsOfCsvFile:(NSURL *)url{

    self.csvUrl = url;
    
    return self;



}

-(void) parseCsvFileWithCompletionHandler:(void(^)(NSArray *results) )completionBlock
{
    
    NSString *csvData = [NSString stringWithContentsOfURL:_csvUrl encoding:NSUTF8StringEncoding error:nil];
    csvData=[csvData stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    NSArray *array =[csvData componentsSeparatedByString:@","];
    
    NSMutableArray *ratings =[[NSMutableArray alloc]init];
    for (int i= 5;i<array.count;i=i+3) {
        
        NSMutableDictionary *dict =[[NSMutableDictionary alloc]init];
        NSNumber *rating =[NSNumber numberWithDouble:[array[i] doubleValue]];
        NSNumber *ratingID =[NSNumber numberWithInt:[array[i-2]intValue]];
        
        
        [dict setValue:rating forKey:@"rating"];
        [dict setValue:ratingID forKey:@"id"];

        
        [ratings addObject:dict];
        
    }
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"rating"
                                                                 ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortByName];
    NSArray *sortedArray = [ratings sortedArrayUsingDescriptors:sortDescriptors];
    
    NSArray *topRatings =[sortedArray subarrayWithRange:NSMakeRange(0, 10)];
    
    completionBlock(topRatings);
    
    

}





@end
