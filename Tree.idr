

-- Binary tree data type.
data Tree elem = Empty
                | Node (Tree elem) elem (Tree elem)

-- Name templates for variables.
%name Tree tree, tree1

-- Binary Tree insertion.
insert : Ord elem => elem -> Tree elem -> Tree elem
insert x Empty = Node Empty x Empty
insert x (Node left val right) = case (compare x val) of
                                    LT => Node (insert x left) val right
                                    EQ => Node  left val right
                                    GT => Node left val (insert x right)


listToTree : Ord a => List a -> Tree a
listToTree [] = Empty
listToTree (x :: xs) = insert x (listToTree xs)

treeToList : Tree a -> List a
treeToList Empty = []
treeToList (Node left val right) = ?treeToList_rhs_2
