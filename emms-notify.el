;;; package --- Summary: notifications on mac os x


;;; Commentary:
;; mostly for emms, but could be useful for other things

;;; Code:

(defvar terminal-notifier-command (executable-find "terminal-notifier") "The path to terminal-notifier.")
(defun terminal-notifier-notify (title subtitle message contentImage)
  "Show a message with `terminal-notifier-command`.
uses the TITLE SUBTITLE MESSAGE and CONTENTIMAGE."
  (start-process "terminal-notifier"
                 "*terminal-notifier*"
                 terminal-notifier-command

                 "-title" title
                 "-subtitle" subtitle
                 "-message" message
                 "-appIcon" contentImage
                 "-activate" "org.gnu.Emacs"
                 "-sender" "org.gnu.Emacs"
                 ))


(defun get-path-of-cover ()
  "Get directory of current emms album using current TRACK."
  (concat
   (file-name-directory
    (emms-browser-get-track-field
     (emms-playlist-current-selected-track)
     'name))
   "cover_small.jpg"))
  

(defun emms-notify-do ()
  "Notify about current song playing."
  (interactive)
 (terminal-notifier-notify
  (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-title)
  (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-artist)
  (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-album)
  (get-path-of-cover)))
(provide 'emms-notify)
;;; emms-notify.el ends here
