#!/usr/bin/zsh

git verify-pack -v .git/objects/pack/pack-48d6e4094f9e4c79d72a94b372ff3fac8be667dc.idx \
| sort -k 3 -n \
| tail -10
