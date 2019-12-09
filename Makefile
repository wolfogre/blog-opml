all: build commit push

build:
	./build.sh

commit:
	git add --all
	echo "$$(git status -s | awk 'NR==1 {printf $$1":"$$2} NR!=1 {printf " "$$1":"$$2}')\n\n$$(git status -s)" | git commit -F -

push:
	git push origin master

show:
	@echo 'https://raw.githubusercontent.com/wolfogre/blog-opml/master/index.opml'

