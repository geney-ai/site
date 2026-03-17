.PHONY: help
help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*?##/ { printf "  %-20s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

.PHONY: install
install: ## Install dependencies
	@pnpm install

.PHONY: dev
dev: ## Run development servers
	pnpm dev

.PHONY: dev-site
dev-site: ## Run static site dev server
	pnpm dev:site

.PHONY: build
build: ## Build all projects
	pnpm build

.PHONY: test
test: ## Run all tests
	@pnpm test

.PHONY: test-unit
test-unit: ## Run unit tests
	@pnpm test:unit

.PHONY: fmt
fmt: ## Format code
	@pnpm fmt

.PHONY: fmt-check
fmt-check: ## Check code formatting
	@pnpm fmt:check

.PHONY: types
types: ## Check types
	@pnpm types

.PHONY: lint
lint: ## Run linter
	@pnpm lint

.PHONY: lint-fix
lint-fix: ## Fix linting errors
	@pnpm lint:fix

.PHONY: check
check: fmt-check lint types test build ## Run all checks

.PHONY: clean
clean: ## Clean build artifacts and dependencies
	@pnpm clean
	@echo "Clean complete"
