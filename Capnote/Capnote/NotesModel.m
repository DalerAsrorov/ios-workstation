//
//  NotesModel.m
//  Capnote
//
//  Created by Daler Asrorov on 12/7/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "NotesModel.h"

static NSString* kTestCurrentUserName;

@implementation NotesModel


- (instancetype) init {
    if(self = [super init]) {
         self.ref = [[FIRDatabase database] reference];
    }
    
    return self;
}

// each note has an id (time), title (string), section (string), description (string), files (array)
- (void) addNote: (NSDictionary *) note {
    NSString * key = self.generateKey;
    [[[self.ref child: @"notes"] child: key] setValue: note];
}

- (void) removeNoteAt:(NSInteger) noteID {
    
}

- (NSString *) generateKey {
    NSInteger keyTimeInSeconds = (int)[[NSDate date] timeIntervalSince1970];
    NSString * keyStr = [NSString stringWithFormat:@"%ld", keyTimeInSeconds];
    return keyStr;
}

- (void) isSubscribedTo: (NSString *) sectionName
                         completion: (void (^)(BOOL success))completionBlock {
    
    [[[[self.ref child:@"users"] child:@"dalerasrorov"] child: @"subs"]observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSDictionary *allSubs = snapshot.value;
        
        for(id key in allSubs) {
            NSString *currentNote = [[NSString alloc] initWithFormat:@"%@", key];
            
            if([currentNote isEqualToString: sectionName]) {
                completionBlock(YES);
                return;
            }
        }
        
        completionBlock(NO);
        
        // ...
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    

    
}

- (void) getSubsFeedNotes: (NSString *) sectionName
               completion: (void (^)(NSDictionary* data))completionBlock {
    
    NSDictionary *itemData = [[NSDictionary alloc] init];
    
    [[self.ref child:@"notes"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"%@", snapshot.value);
        NSDictionary *allNotes = snapshot.value;
        int counter = 0;
        
        for(id key in allNotes) {
            NSString *keyIdStr = [NSString stringWithFormat:@"%@", key];
//            NSLog(@"key=%@ value=%@", key, [myDict objectForKey:key]);
            NSDictionary *currentNote = [allNotes objectForKey:key];
            NSDictionary *currentNoteWithID = @{@"adder" : currentNote[@"adder"],
                                                @"description" : currentNote[@"description"],
                                                @"files" : currentNote[@"files"],
                                                @"title" : currentNote[@"title"],
                                                @"section" : currentNote[@"section"],
                                                @"noteID" : key
                                                };
            NSString *sectionName = currentNote[@"section"];
            
            [self isSubscribedTo:sectionName completion:^(BOOL success) {
                if(success) {
                     
                    completionBlock(currentNoteWithID);
                }
            }];
            
            NSLog(@"Note: %@", currentNote);
        }
        

        // ...
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void) getTotalNumOfSubbedNotes: (NSString *) username
                       completion: (void (^)(BOOL success))completionBlock {
    __block int counter = 0;
    
    [self getSubsFeedNotes:@"username" completion:^(NSDictionary *data) {
        counter = counter + 1;
        completionBlock(counter);
    }];
}

- (int) getNumOfSubPosts {
    int result = 0;
    
    
    return result;
}

@end
