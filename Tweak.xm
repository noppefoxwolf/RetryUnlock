#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SBLockScreenViewControllerBase : UIViewController {}
-(void)viewDidLoad;
-(void)setPasscodeLockVisible:(BOOL)arg1 animated:(BOOL)arg2;
@end

%hook SBLockScreenViewControllerBase
-(void)viewDidLoad{
	%orig;
	UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
	[self.view addGestureRecognizer:tap];
}

%new
- (void)handleTapGesture:(UITapGestureRecognizer* )sender {
  %log;
  [self setPasscodeLockVisible:YES animated: YES];
}

%end