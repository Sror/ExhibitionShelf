//
//  AboutUsViewController.m
//  ExhibitionMagazineShelf
//
//  Created by 秦 鑫 on 5/26/13.
//  Copyright (c) 2013 TodaySybor. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController
@synthesize backButton = _backButton;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark -view lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
/***********************************background****************************************/
    //load background
    UIImage *backgroundImage = [UIImage imageNamed:@"aboutus.png"];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    self.view.backgroundColor = backgroundColor;
/************************************************************************************/

    UIImageView *linkImageView = [[UIImageView alloc] initWithFrame:CGRectMake(270, 330, 200, 40)];
    [self.view addSubview:linkImageView];
    linkImageView.userInteractionEnabled = YES;
    [linkImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openURL)]];

    UIImageView *linkLogoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(460, 67, 100, 185)];
    [self.view addSubview:linkLogoImageView];
    linkLogoImageView.userInteractionEnabled = YES;
    [linkLogoImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openURL)]];
}

-(void)openURL
{
    NSLog(@"点中!!!");
    NSURL *url = [NSURL URLWithString:OPENSAFARI];
    [[UIApplication sharedApplication] openURL:url];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft  ||
       interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        return YES;
    else
        return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
