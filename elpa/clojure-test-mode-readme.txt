
This file provides support for running Clojure tests (using the
clojure.test framework) via SLIME and seeing feedback in the test
buffer about which tests failed or errored.

Installation:

Use package.el. You'll need to add Marmalade to your archives:

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

If you use a version of Emacs prior to 24 that doesn't include
package.el, you can get it from http://bit.ly/pkg-el23. If you have
an older package.el installed from tromey.com, you should upgrade
in order to support installation from multiple sources.

This library does not currently support clojure.contrib.test-is
from Clojure Contrib's 1.0-compatibility branch. If you need it,
please use version 1.2 of clojure-test-mode:

http://github.com/technomancy/clojure-mode/tree/test-1.2
