DIR ?= /Users/pw.chu/Projects/helm-charts
WEB_PORT ?= 9098
WEB_HOST ?= 127.0.0.1

.PHONY: k9s-dir k9s-web k9s-web-dir
k9s-dir:
	@command -v expect >/dev/null 2>&1 || { \
		echo "expect is required. Install with: brew install expect"; \
		exit 1; \
	}
	@expect -c 'spawn k9s; sleep 1; send ":dir $(DIR)\r"; interact'

k9s-web:
	@command -v ttyd >/dev/null 2>&1 || { \
		echo "ttyd is required. Install with: brew install ttyd"; \
		exit 1; \
	}
	@echo "Open http://$(WEB_HOST):$(WEB_PORT) in your browser"
	@ttyd -i $(WEB_HOST) -p $(WEB_PORT) --writable k9s

k9s-web-dir:
	@command -v ttyd >/dev/null 2>&1 || { \
		echo "ttyd is required. Install with: brew install ttyd"; \
		exit 1; \
	}
	@command -v expect >/dev/null 2>&1 || { \
		echo "expect is required. Install with: brew install expect"; \
		exit 1; \
	}
	@echo "Open http://$(WEB_HOST):$(WEB_PORT) in your browser"
	@ttyd -i $(WEB_HOST) -p $(WEB_PORT) --writable expect -c 'spawn k9s; sleep 1; send ":dir $(DIR)\r"; interact'