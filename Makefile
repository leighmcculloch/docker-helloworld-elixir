run: build
	./helloworld

build:
	rm -fR _build deps
	mix deps.get
	MIX_ENV=prod mix escript.build

docker-build:
	rm -fR _build deps
	docker run --rm -v $$PWD:$$PWD -w $$PWD -e "MIX_ENV=prod" msaraiva/elixir-dev sh -c "mix deps.get && mix escript.build"
	docker build -t leighmcculloch/helloworld-elixir .

docker-run:
	docker run -it -p 8080:80 leighmcculloch/helloworld-elixir

docker-push:
	docker push leighmcculloch/helloworld-elixir
