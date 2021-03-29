Command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).


# licenseClassifier
### Classifies SPDX licenses

Dart package to detect under what license a project is distributed.

### The problem

There are many packages on pub.dev. How do we know what we can and can't do with the package?
We've got a bunch of open source projects, how do we know what their licenses are?
We've got a project with a license file, but which license is it? Has it been modified?

### The solution

This package automates the process of reading LICENSE files and compares their contents to known licenses using a several strategies. It attempts to determine a project's license in the following order:

- If the license file has an explicit copyright notice, and nothing more (e.g., Copyright (c) 2015 Ben Balter), we'll assume the author intends to retain all rights, and thus the project isn't licensed.
- If the license is an exact match to a known license. If we strip away whitespace and copyright notice, we can directly compare the string.
- If we still can't match the license, we use the Sørensen–Dice coefficient, which is really good at calculating the similarity between two strings. Using this algorithm we will be able to get a percentage changed between the provided license file to the license list.

This project is inspired by @licensee github project https://github.com/licensee/licensee.

### Roadmap
- ✅ Initial Project Setup
- ✅ License List Fetching
- ✅ License Fetching
- ✅ License Content Parsing
- ⬜ Print License as markdown
- ⬜ Create Matcher
    - ⬜ Header check method
    - ⬜ Direct match method
    - ⬜ Percentage match method
- ⬜ Code formatting and documentation
- ⬜ Tests

### Project Timeline
As this project is part of GSoC (Google Summer of Code), hence the timeline of GSoC will be applied to this project.
Period within which this project is to be completed is June 7, 2021 - August 16, 2021.

### Note
This is GSoC proposal initial project, if this repository needs to be moved or removed from here, it will be done.