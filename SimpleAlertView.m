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
    
    self.buttonTitles = [NSMutableArray array];
    [self.buttonTitles addObject:cancelTitle];
    
    // adding the row of buttons first
    for (int i = 0; i < otherTitles.count; i++)
        [self addButtonWithTitle:[otherTitles objectAtIndex:i] WithIndex:(i + 1) WithActionStyle:UIAlertActionStyleDefault];
    [self addButtonWithTitle:cancelTitle WithIndex:0 WithActionStyle:UIAlertActionStyleCancel];
    
    return self;
}

- (void) addButtonWithTitle:(NSString *)title WithIndex:(int) index WithActionStyle: (UIAlertActionStyle) style {
    [self.buttonTitles addObject:title];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction* action) {
        
        // dismissing the alert view, then calling the delegate on completion
        [self dismissViewControllerAnimated:YES completion:
        ^(void) {}];
        self.alert = nil;
        
        // calling delegate method, if it exists
        if ([self.delegate respondsToSelector:@selector(didDismissWithButtonIndex:alertID:)])
            [self.delegate didDismissWithButtonIndex:index alertID:self.alertID];
    }];
    
    [self.alert addAction:action];
}

- (void) addButtonWithTitle:(NSString *)title {
    [self addButtonWithTitle:title WithIndex:self.numberOfButtons - 1 WithActionStyle:UIAlertActionStyleDefault];
}

- (NSString*) buttonTitleAtIndex: (int) index{
    return [self.buttonTitles objectAtIndex:index];
}

- (int) numberOfButtons {
    return (int) self.buttonTitles.count;
}

- (int) cancelButtonIndex {
    return 0;
}

// show the alert
- (void) show {
    [(UIViewController*)self.delegate presentViewController:self.alert animated:YES completion:nil];
}
@end
