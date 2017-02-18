# SimpleUIAlertView
Apple deprecated UIAlertView, and this is a simple implementation of UIAlertView using the current standard, UIAlertController, which will ease your implementation. The interface is like the old UIAlertView with minor changes. Here's an example:

```objc 
SimpleAlertView* sav = [[SimpleAlertView alloc] initWithTitle:@"test" message:@"test me!" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@[@"say hi", @"say goodbye"] alertID:nil];
[sav show];
```

you also have to include the class SimpleAlertView in the list of your class delegates.

```objc
@interface ViewController : UIViewController <SimpleAlertDelegate>
```
and you're done. But do not forget to pass _**self**_ as the delegate when initializing, because it wouldn't work in that case.

The minor change I have applied is the concept of an alertID. This is a patch to the problem of having multiple UIAlertView at different points in the same class, when implementing the delegate methods you wouldn't know which one caused it. So including an alertID will stop this issue and you can handle as many alert view actions as you want in the delegate method. If you only have one alert in your view controller, you don't need to set it, and sending ** nil ** would just be enough to set your alertID to _**default**_. 

This is a simple implementation for the delegate method:

``` objc
- (void)didDismissWithButtonIndex:(NSInteger)index alertID:(NSString *)alertID{
    if ([alertID isEqualToString:@"default"] && index == 1) {
        NSLog(@"hi");
    }
    if ([alertID isEqualToString:@"default"] && index == 2){
        NSLog(@"goodbye");
    }
}
```
I hope you like it!
