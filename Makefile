HTMLS := $(patsubst %.md,%.md.html,$(wildcard */*.md *.md))
all: $(HTMLS)
%.md.html: %.md top.html bottom.html
	cat top.html > $@
	cat $< | sed -e 's/\[.*\]\(.*.md\)/&.html/g' | ./main -page >> $@
	cat bottom.html >> $@

clean:
	rm $(HTMLS)
