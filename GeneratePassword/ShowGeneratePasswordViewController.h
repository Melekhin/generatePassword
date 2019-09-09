//
//  ShowGenerateParolViweController.h
//  GenerateParol
//
//  Created by Konstantin Melekhin on 07/09/2019.
//  Copyright © 2019 Konstantin Melekhin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    closure,
    delegate,
} InstructionsType;

@interface ShowGeneratePasswordViewController : UIViewController

- (void) configure:(InstructionsType) type;

@end

