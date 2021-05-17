-- you only know the value of the node and the parent of the node
-- determine if node is root, leaf, or inner node

-- output: value, classification

-- note: if node value appears in Column P (Parent), it will be an Inner Node. Otherwise it will be Leaf.
SELECT N, IF (P IS NULL, 'Root', IF(BST.N IN (SELECT P FROM BST), 'Inner', 'Leaf')) 
FROM BST
ORDER BY N;