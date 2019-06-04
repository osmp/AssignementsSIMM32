* Encoding: UTF-8.

*Assignment 2

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=ENTER sex age
  /METHOD=ENTER STAI_trait pain_cat cortisol_serum mindfulness weight
  /SCATTERPLOT=(*ZPRED ,pain)
  /SAVE PRED COOK RESID.

EXAMINE VARIABLES=RES_7
  /PLOT BOXPLOT STEMLEAF HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=BACKWARD sex age STAI_trait pain_cat cortisol_serum mindfulness weight
  /SCATTERPLOT=(*ZPRED ,pain).

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA SELECTION
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT pain
  /METHOD=ENTER age pain_cat cortisol_serum mindfulness
  /METHOD=ENTER sex STAI_trait.


COMPUTE Predicted_Backward=(age * -0.079) +(pain_cat * 0.073) + (cortisol_serum * 0.393) + 
    (mindfulness * -0.224) + 4.623.
EXECUTE.

COMPUTE Predicted_Theory=(age * -0.076) +(pain_cat * 0.068) + (cortisol_serum * 0.397) + 
    (mindfulness * -0.231) + (sex * -0.263) +(STAI_trait * 0.08) + 4.712.
EXECUTE.

COMPUTE Residual_Backward=(Predicted_Backward- pain) ** 2.
EXECUTE.

COMPUTE Residual_Theory=(Predicted_Theory-pain) ** 2.
EXECUTE.


