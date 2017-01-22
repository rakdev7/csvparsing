//
//  AppDelegate.m
//  topmovies
//
//  Created by Rocky on 1/19/17.
//  Copyright © 2017 Rocky. All rights reserved.
//

#import "AppDelegate.h"
#import "Parser.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    Parser *csvParser = [[Parser alloc]initWithContentsOfCsvFile:[NSURL URLWithString:@"https://gist.githubusercontent.com/assiotis/9c54190f86b308f0bd5822119a3c8cbe/raw/7da00efd07b31ba8263611c42ec34fefdf2be2fd/movies.csv"]];
    [csvParser parseCsvFileWithCompletionHandler:^(NSArray *results) {
        
        for (NSDictionary *each in results) {
            NSLog(@"The rating for id :%@ is %@ ",[each valueForKey:@"id"],[each valueForKey:@"rating"]);

        }
        
        
    }];
    
    
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
