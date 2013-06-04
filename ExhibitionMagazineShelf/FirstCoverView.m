//
//  FirstCoverView.m
//  ExhibitionMagazineShelf
//
//  Created by 秦鑫 on 13-4-3.
//  Copyright (c) 2013年 TodaySybor. All rights reserved.
//

#import "FirstCoverView.h"
#import "Exhibition.h"
@implementation FirstCoverView
@synthesize exhibitionID = _exhibitionID;
@synthesize cover = _cover;
@synthesize button = _button;
@synthesize progress = _progress;
@synthesize title = _title;
@synthesize description = _description;

//-(id)initWithCoder:(NSCoder *)aDecoder
//{
//    if(self = [super initWithCoder:aDecoder]){
//        
//    }
//}

- (id)initWithFrame:(CGRect)frame  //[[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont fontWithName:@"MicrosoftYaHei" size:14.0],UITextAttributeFont, nil] forState:UIControlStateNormal];

{
    self = [super initWithFrame:frame];
    if (self) {
        // frame
        self.frame = CGRectMake(0, 0, 512, 192);
        // title label
        _title = [[UILabel alloc] initWithFrame:CGRectMake(272, 40, 224, 40)];
        _title.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15.0];
        _title.textColor=[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0f];
        _title.textAlignment = UITextAlignmentLeft;
        _title.lineBreakMode = UILineBreakModeTailTruncation;
        _title.numberOfLines = 2;
        _title.backgroundColor = [UIColor clearColor];
        _title.shadowColor = [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0f];
        _title.shadowOffset = CGSizeMake(0.1, 0.1);
        //description label
        _description = [[UILabel alloc] initWithFrame:CGRectMake(272, 80, 224, 76)];
        _description.font = [UIFont fontWithName:@"MicrosoftYaHei" size:12.0];
        _description.textColor = [UIColor colorWithRed:153.0/255 green:153.0/255 blue:153.0/255 alpha:1.0f];
        _description.backgroundColor = [UIColor clearColor];
        _description.textAlignment = UITextAlignmentLeft;
        _description.lineBreakMode = UILineBreakModeTailTruncation;
        _description.numberOfLines = 4;
        //imageView
        _cover = [[UIImageView alloc] initWithFrame:CGRectMake(40, 50, 202, 169)];
        _cover.userInteractionEnabled = YES;
        [_cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonCallback:)]];
        //circol corner image
        CALayer *layer = [_cover layer];
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:10.0];
        // progress
        UIImage *backgroundImage = [UIImage imageNamed:@"progressBar_background_before.png"];
        UIImage *foregroundImage = [UIImage imageNamed:@"processBar_before.png"];
        _progress = [[MCProgressBar alloc] initWithFrame:CGRectMake(41, 184, 200, 8) backgroundImage:backgroundImage foregroundImage:foregroundImage];
        _progress.alpha=0.0;
        
        // button
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setBackgroundImage:[UIImage imageNamed:@"download_button.png"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonCallback:) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:14.0];
        [_button setTitle:@"下 载" forState:UIControlStateNormal];
        _button.frame=CGRectMake(272, 166, 76, 26);
        
        [self addSubview:_title];
        [self addSubview:_description];
        [self addSubview:_cover];
        [self addSubview:_progress];
        [self addSubview:_button];
    }
    return self;
}

#pragma mark - ShelfViewControllerProtocol

-(void)buttonCallback:(id)sender
{
    
    [_delegate coverSelected:self];
}

#pragma mark - KVO and Notifications

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    float value = [[change objectForKey:NSKeyValueChangeNewKey] floatValue];
    _progress.progress=value;
}

-(void)exhibitionDidEndDownload:(NSNotification *)notification
{
    id obj = [notification object];
    _progress.alpha=0.0;
    [_button setBackgroundImage:[UIImage imageNamed:@"view_button.png"] forState:UIControlStateNormal];
    [_button setTitle:@"观 看" forState:UIControlStateNormal];
    _button.alpha=1.0;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EXHIBITION_END_OF_DOWNLOAD_NOTIFICATION object:obj];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EXHIBITION_FAILED_DOWNLOAD_NOTIFICATION object:obj];
    [obj removeObserver:self forKeyPath:@"downloadProgress"];
}

-(void)exhibitionDidFailDownload:(NSNotification *)notification
{
    id obj = [notification object];
    _progress.alpha=0.0;
    [_button setBackgroundImage:[UIImage imageNamed:@"download_button.png"] forState:UIControlStateNormal];
    [_button setTitle:@"下 载" forState:UIControlStateNormal];
    _button.alpha=1.0;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EXHIBITION_END_OF_DOWNLOAD_NOTIFICATION object:obj];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EXHIBITION_FAILED_DOWNLOAD_NOTIFICATION object:obj];
    [obj removeObserver:self forKeyPath:@"downloadProgress"];
}

-(void)exhibitionChangeButton:(NSNotification *)notification
{
    NSLog(@"Change Button !!!");
    id obj = [notification object];
    _progress.alpha=0.0;
    [_button setBackgroundImage:[UIImage imageNamed:@"download_button.png"] forState:UIControlStateNormal];
    [_button setTitle:@"下 载" forState:UIControlStateNormal];
    _button.alpha=1.0;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EXHIBITION_END_OF_DOWNLOAD_NOTIFICATION object:obj];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EXHIBITION_FAILED_DOWNLOAD_NOTIFICATION object:obj];
    [obj removeObserver:self forKeyPath:@"downloadProgress"];
}

@end
