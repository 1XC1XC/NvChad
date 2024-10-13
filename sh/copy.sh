{
    tree
    find -type f -name "*.lua" -exec echo -e '\n{}:\n```' \; -exec cat {} \; -exec echo -e '\n```' \;
} | xsel --clipboard
