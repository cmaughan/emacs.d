; Use the package manager
(push "use-package" load-path)
(require 'use-package)
(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/"))

(package-refresh-contents)
(package-initialize)


