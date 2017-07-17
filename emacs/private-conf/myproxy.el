;; proxy設定
;; パスの暗号化
;; (base64-encode-string "username:password")
(setq url-proxy-services
      '(("http" . "proxy.example.com:8080")
        ("https" . "proxy.example.com:8080")))
(setq url-http-proxy-basic-auth-storage
      '(("proxy.example.com:8080" ("Proxy" . "base64string"))))
