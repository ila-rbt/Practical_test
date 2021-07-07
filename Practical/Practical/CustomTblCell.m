//
//  CustomTblCell.m
//  Practical
//
//  Created by Ila Panchal on 07/07/21.
//

#import "CustomTblCell.h"

@implementation CustomTblCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Delegate Methods
#pragma mark CollectionView DataSource & Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_arrUserItemData count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

   CustomCollectionCell *cell = [collectionView   dequeueReusableCellWithReuseIdentifier:@"CustomCollectionCell" forIndexPath:indexPath];
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[_arrUserItemData objectAtIndex:indexPath.item]]];
    cell.imgViewItem.image = [UIImage imageWithData: imageData];
    
    return cell;
}


@end
