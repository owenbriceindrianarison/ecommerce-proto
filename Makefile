COMPOSE = docker compose -f docker-compose.dev.yml
EXEC    = $(COMPOSE) exec proto

.PHONY: up down build logs shell
# --- Stack ---

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

build:
	$(COMPOSE) up --build -d

logs:
	$(COMPOSE) logs proto -f

shell:
	$(EXEC) bash