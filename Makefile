all: history commit push show newsboat

check:
	sort index.txt | uniq -d
	test -z "$$(sort index.txt | uniq -d)"

build: check
	./build.sh

history:
	cat index.txt >> history.txt
	sort history.txt -u -o history.txt

commit: build
	git add --all
	echo "$$(git status -s | awk 'NR==1 {printf $$1":"$$2} NR!=1 {printf " "$$1":"$$2}')\n\n$$(git status -s)" | git commit -F -

push:
	git push origin master

show:
	@echo 'https://raw.githubusercontent.com/wolfogre/blog-opml/master/index.opml'

newsboat:
	cp index.txt ~/.newsboat/urls


