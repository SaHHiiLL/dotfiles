
SASS = sass

SRCS = $(wildcard ./styles/*.scss)

CSS_FILES = $(SRCS:.scss=.css)

all: $(CSS_FILES) 

%.css: %.scss
	$(SASS) $< $@

clean:
	rm -f ./styles/*.css*

.PHONY: all clean