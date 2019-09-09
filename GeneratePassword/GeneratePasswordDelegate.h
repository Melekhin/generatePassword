//
//  GenerationParolDelegate.h
//  GenerateParol
//
//  Created by Konstantin Melekhin on 07/09/2019.
//  Copyright © 2019 Konstantin Melekhin. All rights reserved.
//

@protocol GeneratePasswordDelegate <NSObject>

@optional
- (void)getGenerationWith:(NSString *)password;
@end
