JAVAC = /usr/bin/javac
JFLAGS = -g
.SUFFIXES: .java .class

SRCDIR=src
BINDIR=bin
DOCDIR=doc

$(BINDIR)/%.class:$(SRCDIR)/%.java
	$(JAVAC) $(JFLAGS) -d $(BINDIR)/ -cp $(BINDIR) $<

CLASSES=windVector.class CloudData.class resultObject.class windThread.class cloudClassifier.class

CLASS_FILES=$(CLASSES:%.class=$(BINDIR)/%.class)

default: $(CLASS_FILES)

run:
	java -cp $(BINDIR) cloudClassifier

docs:
	javadoc -d $(DOCDIR) $(SRCDIR)/*.java

clean:
	rm $(BINDIR)/*.class
