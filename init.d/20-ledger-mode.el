(add-to-list 'auto-mode-alist '("\\.journal" . ledger-mode))

(custom-set-variables
 '(ledger-binary-path "/usr/bin/ledger")
 '(ledger-report-format-specifiers
   (quote
    (("ledger-file" . ledger-report-ledger-file-format-specifier)
     ("PAYEE" . ledger-report-payee-format-specifier)
     ("account" . ledger-report-account-format-specifier)
     ("value" . ledger-report-value-format-specifier))))
 '(ledger-reports
   (quote
    (("本日残高" "ledger -f %(ledger-file) bal -e tomorrow")
     ("月末予定残高" "ledger -f %(ledger-file) bal -e nextmonth")
     ("期末予定残高" "ledger -f %(ledger-file) bal -e nextquater")
     ("入力済残高" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)")
     ("income" "ledger -f %(ledger-file) incomestatement")
     ("cashflow" "ledger -f %(ledger-file) cashflow"))))
 )
