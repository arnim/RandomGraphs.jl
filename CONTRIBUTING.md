# How to contribute

## Generalities

1. Contributions are always welcome!
2. Please read the sections below for the situation that applies
3. There are a few common rules
   - never make changes in `master`
   - your pull request should pass the build before it will be merged
   - a complete pull request includes changes to the documentation if they are necessary
4. As much as possible, refer to the issue (`#number`) in your commit messages
5. When you push code that is functional and ready to be merged, **comment on the original issue**

## New models

1. Submit an issue explaining the model you plan to implement
2. Fork and create an explicitely named branch
3. Respect the functions/files naming convention
   - functions are called `model_name_graph`
   - functions are declared in `src/model_name`
   - documentation is in `doc/source/model_name.rst`
   - tests are in `tests/model_name.rst`

## Bug fixes

1. Submit an issue explaining what the problem is
2. If you know how to fix it, fork and create an explicitely named branch
3. Write additional tests if you feel they are needed
