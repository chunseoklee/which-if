(defun which-if ()
  "Show #ifdef hierarchy of current cursor"
  (interactive)
  (let ((pos (point)) (depth 0) (result nil))
    (while (and (/= 1 (point))
           (re-search-backward "^\\s-*#\\(if\\|ifndef\\|el\\|endif\\)" nil t))
      (push (buffer-substring-no-properties 
             (line-beginning-position)
             (line-end-position))
            result))

    (with-output-to-temp-buffer "*ifdef output*"
      (while result
        (print (car result))
        (setq result (cdr result)))
      (switch-to-buffer "*ifdef output*"))))   
   

      
