; Use the package manager
(add-to-list 'load-path "~/.emacs.d/use-package/")
(require 'use-package)
(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/"))

(package-refresh-contents)
(package-initialize)


