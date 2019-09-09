//
//  ViewController.m
//  GenerateParol
//
//  Created by Konstantin Melekhin on 07/09/2019.
//  Copyright © 2019 Konstantin Melekhin. All rights reserved.
//

#import "ViewController.h"
#import "ShowGeneratePasswordViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _delegateButton.layer.cornerRadius = 5.0;
    _delegateButton.layer.borderWidth = 3.0;
    _delegateButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    _closureButton.layer.cornerRadius = 5.0;
    _closureButton.layer.borderWidth = 3.0;
    _closureButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    _startGenerationButton.layer.cornerRadius = 5.0;
    _startGenerationButton.layer.borderWidth = 3.0;
    _startGenerationButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
}

- (IBAction)delegateActionButton:(id)sender {
    ShowGeneratePasswordViewController * controller = [[ShowGeneratePasswordViewController alloc]
                                                       initWithNibName:@"ShowGeneratePasswordViewController" bundle:nil];
    [controller configure: delegate];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)closureActionButton:(id)sender {
    ShowGeneratePasswordViewController * controller = [[ShowGeneratePasswordViewController alloc]
                                                       initWithNibName:@"ShowGeneratePasswordViewController" bundle:nil];
    [controller configure: closure];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
