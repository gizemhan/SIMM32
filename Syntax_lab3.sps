* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Survived Pclass Name Sex Age SibSp Parch Ticket Fare Cabin Embarked
  /STATISTICS=MINIMUM MAXIMUM MEAN MEDIAN
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=Survived Pclass Age SibSp Parch Fare
  /STATISTICS=MEAN STDDEV MIN MAX.

EXAMINE VARIABLES=Survived Pclass Age SibSp Parch Fare
  /PLOT BOXPLOT STEMLEAF HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Pclass COUNT()[name="COUNT"] Survived 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Pclass=col(source(s), name("Pclass"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  GUIDE: axis(dim(1), label("Pclass"))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Survived"))
  GUIDE: text.title(label("Stacked Bar Count of Pclass by Survived"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval.stack(position(Pclass*COUNT), color.interior(Survived), 
    shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Sex COUNT()[name="COUNT"] Survived MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Sex=col(source(s), name("Sex"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  GUIDE: axis(dim(1), label("Sex"))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Survived"))
  GUIDE: text.title(label("Stacked Bar Count of Sex by Survived"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval.stack(position(Sex*COUNT), color.interior(Survived), 
    shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Survived Age MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  DATA: Age=col(source(s), name("Age"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(1), label("Survived"))
  GUIDE: axis(dim(2), label("Age"))
  GUIDE: text.title(label("Simple Boxplot of Age by Survived"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: schema(position(bin.quantile.letter(Survived*Age)), label(id))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Age Survived MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Age=col(source(s), name("Age"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  GUIDE: axis(dim(1), label("Age"))
  GUIDE: axis(dim(2), label("Frequency"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Survived"))
  GUIDE: text.title(label("Stacked Bar of Age by Survived"))
  ELEMENT: interval.stack(position(summary.count(bin.rect(Age))), color.interior(Survived), 
    shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=SibSp COUNT()[name="COUNT"] Survived MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: SibSp=col(source(s), name("SibSp"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  GUIDE: axis(dim(1), label("SibSp"))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Survived"))
  GUIDE: text.title(label("Stacked Bar Count of SibSp by Survived"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval.stack(position(SibSp*COUNT), color.interior(Survived), 
    shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Survived COUNT()[name="COUNT"] SibSp MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: SibSp=col(source(s), name("SibSp"), unit.category())
  GUIDE: axis(dim(1), label("Survived"))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("SibSp"))
  GUIDE: text.title(label("Stacked Bar Count of Survived by SibSp"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval.stack(position(Survived*COUNT), color.interior(SibSp), 
    shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Survived COUNT()[name="COUNT"] Parch MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: Parch=col(source(s), name("Parch"), unit.category())
  GUIDE: axis(dim(1), label("Survived"))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Parch"))
  GUIDE: text.title(label("Stacked Bar Count of Survived by Parch"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval.stack(position(Survived*COUNT), color.interior(Parch), 
    shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Parch COUNT()[name="COUNT"] Survived MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Parch=col(source(s), name("Parch"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  GUIDE: axis(dim(1), label("Parch"))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Survived"))
  GUIDE: text.title(label("Stacked Bar Count of Parch by Survived"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval.stack(position(Parch*COUNT), color.interior(Survived), 
    shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Fare Survived MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Fare=col(source(s), name("Fare"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  GUIDE: axis(dim(1), label("Fare"))
  GUIDE: axis(dim(2), label("Frequency"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Survived"))
  GUIDE: text.title(label("Stacked Bar of Fare by Survived"))
  ELEMENT: interval.stack(position(summary.count(bin.rect(Fare))), color.interior(Survived), 
    shape.interior(shape.square))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Survived Fare MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  DATA: Fare=col(source(s), name("Fare"))
  DATA: id=col(source(s), name("$CASENUM"), unit.category())
  GUIDE: axis(dim(1), label("Survived"))
  GUIDE: axis(dim(2), label("Fare"))
  GUIDE: text.title(label("Simple Boxplot of Fare by Survived"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: schema(position(bin.quantile.letter(Survived*Fare)), label(id))
END GPL.

EXAMINE VARIABLES=Fare BY Survived
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Embarked COUNT()[name="COUNT"] Survived 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Embarked=col(source(s), name("Embarked"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  DATA: Survived=col(source(s), name("Survived"), unit.category())
  GUIDE: axis(dim(1), label("Embarked"))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Survived"))
  GUIDE: text.title(label("Stacked Bar Count of Embarked by Survived"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval.stack(position(Embarked*COUNT), color.interior(Survived), 
    shape.interior(shape.square))
END GPL.

RECODE Embarked ('C'=1) (ELSE=0) INTO embarked_C.
EXECUTE.

RECODE Embarked ('S'=1) (ELSE=0) INTO embarked_S.
EXECUTE.

RECODE Embarked ('Q'=1) (ELSE=0) INTO embarked_Q.
EXECUTE.

RECODE Sex ('male'=0) ('female'=1) INTO sex_num.
EXECUTE.

NOMREG Survived (BASE=LAST ORDER=ASCENDING) WITH Age sex_num Pclass SibSp Parch Fare embarked_C 
    embarked_S embarked_Q
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=CLASSTABLE PARAMETER SUMMARY LRT CPS STEP MFI IC
  /SAVE PREDCAT ACPROB.



COMPUTE sib_sp_cent=SibSp - .51.
EXECUTE.

COMPUTE sib_sp_cent_sq=sib_sp_cent * sib_sp_cent.
EXECUTE.

COMPUTE parch_cent=Parch - .43.
EXECUTE.

COMPUTE parch_cent_sq=parch_cent * parch_cent.
EXECUTE.

RECODE Pclass (1=1) (ELSE=0) INTO First_class.
EXECUTE.

RECODE Pclass (3=1) (ELSE=0) INTO Third_class.
EXECUTE.

RECODE Fare (0 thru 15.000=0) (ELSE=1) INTO fare_cat.
EXECUTE.


NOMREG Survived (BASE=FIRST ORDER=ASCENDING) WITH Age sex_num First_class Third_class fare_cat 
    sib_sp_cent sib_sp_cent_sq parch_cent parch_cent_sq embarked_C
  /CRITERIA CIN(95) DELTA(0) MXITER(100) MXSTEP(5) CHKSEP(20) LCONVERGE(0) PCONVERGE(0.000001) 
    SINGULAR(0.00000001)
  /MODEL
  /STEPWISE=PIN(.05) POUT(0.1) MINEFFECT(0) RULE(SINGLE) ENTRYMETHOD(LR) REMOVALMETHOD(LR)
  /INTERCEPT=INCLUDE
  /PRINT=CLASSTABLE PARAMETER SUMMARY LRT CPS STEP MFI IC
  /SAVE PREDCAT ACPROB.


