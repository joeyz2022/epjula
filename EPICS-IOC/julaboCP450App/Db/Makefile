TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db
#DB += Bronkhorst.substitution
#DB += Bronkhorst.db
#DB += devBronkhorst.proto
#DB += euromod.substitution
#DB += eurotherm24xx32xx.substitutions
#DB += eurotherm35xx.substitutions
#DB += X418.db
DB += julaboCP450.substitution
DB += julaboCP450.proto
DB += julaboCP450.db
DB += $(patsubst ../%, %, $(wildcard ../*.template))
#DB += pressure.db
#DB += watlow2.db
#DB += thermo.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

