use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data BST:
  | empty-leaf
  | node(key :: Number, val :: String, left :: BST, right :: BST)
end
# Invariant: keys are unique, and all nodes in the left
# subtree have keys less than the key in the current node,
# all nodes in the right subtree have keys greater than
# the key in the current node

BST0 = empty-leaf
BST1 = node(1, "hello", BST0, BST0)
BST2 = node(5, "bye", BST1, BST0)
BST3 = node(6, "bye", BST2, node(10, "cs2000", BST0, BST0))

#|
fun bst-temp(bst :: BST) -> ???:
  cases (BST) bst:
    | empty-leaf => ...
    | node(k, v, left, right) => 
        ... k ...
        ... v ...
        ... bst-temp(left) ...
        ... bst-temp(right) ...
  end
end
|#

fun height(bst :: BST) -> Number:
  cases (BST) bst:
    | empty-leaf => 0
    | node(k, v, left, right) => 
        1 + num-max(height(left), height(right))
  end
where:
  height(BST0) is 0
  height(BST1) is 1
  height(BST2) is 2
  height(BST3) is 3
end


fun is-balanced(b :: BST) -> Boolean:
  doc: " indicates if the tree is balanced: this means that at every level, the height of the left and right subtrees differs by at most 1"
  cases (BST) b:
    | node(k, v, l, r) => 
      num-abs(height(l) - height(r)) <= 1
    | empty-leaf => true
  end
where:
  is-balanced(BST3) is true
end