; Use the package manager
(require 'package)

(add-to-list 'package-archives
	'("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	'("melpa-stable" . "http://stable.melpa.org/packages/") t)

(when (< emacs-major-version 24)

	(add-to-list 'package-archives
		'("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

