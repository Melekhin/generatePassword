//
//  ShowGenerateParolViewController.m
//  GenerateParol
//
//  Created by Konstantin Melekhin on 07/09/2019.
//  Copyright © 2019 Konstantin Melekhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowGeneratePasswordViewController.h"
#import "GeneratePasswordDelegate.h"

@interface ShowGeneratePasswordViewController () <GeneratePasswordDelegate>

@property (nonatomic, weak) id <GeneratePasswordDelegate> delegate;
- (void) generationPassword;
@property (nonatomic) InstructionsType type;
@property (nonatomic, weak) UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (nonatomic) NSTimer * timer;
@end

@implementation ShowGeneratePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController setNavigationBarHidden:NO];
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = newBackButton;
    
    // Initialization
    self.type = delegate;
    
    self.delegate = self;
    [self generationPassword];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(generationPassword) userInfo:nil repeats:YES];
}

- (void) back:(UIBarButtonItem *)sender {
    [self.timer invalidate];
    self.timer = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) configure:(InstructionsType) type {
    self.type = type;
}

- (void) generationPassword {
    NSString * characters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    NSMutableArray *passwordArray = [NSMutableArray array];
    [characters enumerateSubstringsInRange:NSMakeRange(0, [characters length])
                                   options:(NSStringEnumerationByComposedCharacterSequences)
                                usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                    [passwordArray addObject:substring];
                                }];
    int len = 6;
    NSMutableString * password = [NSMutableString stringWithString:@""];
    for(int i = 0; i < len; i++) {
        int rand = arc4random_uniform((u_int32_t)(passwordArray.count));
        NSString * symbol = passwordArray[rand];
        [password appendString:symbol];
    }
    // for closure
    __weak __typeof(self) weakSelf = self;
    void (^myBlock)(NSString *) = ^(NSString * passwd) {
        [weakSelf.passwordLabel setText:passwd];
    };
    
    switch (self.type) {
        case closure:
            myBlock(password);
            break;
        case delegate:
            [self.delegate getGenerationWith:password];
            break;
    }
}

// MARK: GenerateParolDelegate
- (void)getGenerationWith:(NSString *)password {
    [self.passwordLabel setText:password];
}

@end
