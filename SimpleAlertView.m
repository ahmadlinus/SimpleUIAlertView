//
//  SimpleAlertView.m
//  testrecorder
//
//  Created by pro on 11/30/1395 AP.
//  Copyright © 1395 pro. All rights reserved.
//

#import "SimpleAlertView.h"


@implementation SimpleAlertView
// initialization, similar to the deprecated UIAlertView
-(id) initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)del cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSArray *)otherTitles alertID: (NSString*) alertID {
    
    self = [super init];
    self.delegate = del;
    self.alertID = alertID;
    self.viewTitle = title;
    self.message = message;
    
    if (!alertID)
        self.alertID = @"default";
    
    self.alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    // adding the row of buttons first
    for (int i = 0; i < otherTitles.count; i++) {
        
        UIAlertAction* action = [UIAlertAction actionWithTitle:[otherTitles objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {
            
            // dismissing the alert view, then calling the delegate on completion
            [self dismissViewControllerAnimated:YES completion:
             ^(void) {}];
            
            // calling delegate method, if it exists
            if ([self.delegate respondsToSelector:@selector(didDismissWithButtonIndex:alertID:)]){
                [self.delegate didDismissWithButtonIndex:(i + 1) alertID:self.alertID];
            }
        }];
        
        [self.alert addAction:action];
    }
    
    // adding the Cancel button after all
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction* action) {
        
        // dismissing the alert view, then calling the delegate on completion
        [self dismissViewControllerAnimated:YES completion:
         ^(void) {}];
        
        // calling delegate method, if it exists
        if ([self.delegate respondsToSelector:@selector(didDismissWithButtonIndex:alertID:)]) {
            [self.delegate didDismissWithButtonIndex:0 alertID:self.alertID];
        }
        
    }];
    
    [self.alert addAction:cancelAction];
    return self;
}

// group setting of alert properties
// the input dictionary will be like: @{@"title" : @"hi", @"message" : @"hello world", @"alertID" : @"id" }
- (void) setPropertyUsingDictionary:(NSDictionary *)propertyDictionary {
    if ([propertyDictionary objectForKey:@"title"])
        self.viewTitle = [propertyDictionary objectForKey:@"title"];
    if ([propertyDictionary objectForKey:@"message"])
        self.message = [propertyDictionary objectForKey:@"message"];
    if ([propertyDictionary objectForKey:@"alertID"])
        self.alertID = [propertyDictionary objectForKey:@"alertID"];
}

// show the alert
- (void) show {
    [(UIViewController*)self.delegate presentViewController:self.alert animated:YES completion:nil];
}
@end
