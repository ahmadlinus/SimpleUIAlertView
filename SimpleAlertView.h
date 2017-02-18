//
//  SimpleAlertView.h
//  testrecorder
//
//  Created by pro on 11/30/1395 AP.
//  Copyright © 1395 pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol SimpleAlertViewDelegate;

@interface SimpleAlertView : UIViewController

@property (weak, nonatomic) NSString* viewTitle;
@property (weak, nonatomic) NSString* message;
@property (weak, nonatomic) NSArray* buttonTitles;
@property (weak, nonatomic) NSString* alertID;
@property (weak, nonatomic) id <SimpleAlertViewDelegate> delegate;
@property (strong, nonatomic) UIAlertController* alert;

- (id) initWithTitle: (NSString*) title message:(NSString*) message delegate: (id) del cancelButtonTitle: (NSString*) cancelTitle otherButtonTitles: (NSArray*) otherTitles alertID: (NSString*) alertID;
- (void) setPropertyUsingDictionary: (NSDictionary*) propertyDictionary;
- (void) show;
@end

@protocol SimpleAlertViewDelegate <NSObject>
@optional
- (void) didDismissWithButtonIndex:(NSInteger) index alertID:(NSString*) alertID;
@end
