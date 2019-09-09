//
//  ViewController.h
//  GenerateParol
//
//  Created by Konstantin Melekhin on 07/09/2019.
//  Copyright © 2019 Konstantin Melekhin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *closureButton;
@property (weak, nonatomic) IBOutlet UIButton *delegateButton;
@property (weak, nonatomic) IBOutlet UIButton *startGenerationButton;
@property (weak, nonatomic) IBOutlet UILabel *parolLabel;

@end

