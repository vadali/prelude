
Provides font-lock, indentation, and navigation for the Clojure
language. (http://clojure.org)

Users of older Emacs (pre-22) should get version 1.4:
http://github.com/technomancy/clojure-mode/tree/1.4

Installation:

Use package.el. You'll need to add Marmalade to your archives:

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

If you use a version of Emacs prior to 24 that doesn't include
package.el, you can get it from http://bit.ly/pkg-el23. If you have
an older package.el installed from tromey.com, you should upgrade
in order to support installation from multiple sources.

Of course, it's possible to just place it on your load-path and
require it as well if you don't mind missing out on
byte-compilation and autoloads.

Using clojure-mode with paredit is highly recommended. It is also
available using package.el from the above archive.

Use paredit as you normally would with any other mode; for instance:

  ;; require or autoload paredit-mode
  (defun turn-on-paredit () (paredit-mode 1))
  (add-hook 'clojure-mode-hook 'turn-on-paredit)

See Swank Clojure (http://github.com/technomancy/swank-clojure) for
better interaction with subprocesses via SLIME.
