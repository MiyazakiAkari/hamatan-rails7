# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "react", to: "https://ga.jspm.io/npm:react@18.2.0/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@18.2.0/index.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.23.0/index.js"

pin "vue/dist/vue.esm-browser.js", to: "vue--dist--vue.esm-browser.js.js" # @3.3.7

pin "vue", to: "vue--dist--vue.esm-browser.js.js" # @3.2.41
pin_all_from "app/javascript/controllers", under: "controllers" 
