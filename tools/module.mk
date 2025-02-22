################################################################################
# Module
################################################################################
$(eval $(call clear-local-module))
#------------------------------------------------------------------------------#

local_path        :=  tools

local_library     :=  module \
                      \
                      align \
                      extrude \
                      general \
                      polytope \
                      repeat

local_release_add :=  stl/edge_manifest.stl

local_backup_add  :=

local_submodules  := drafting

#------------------------------------------------------------------------------#
# add local module
#------------------------------------------------------------------------------#
$(eval $(call add-local-module))

################################################################################
# eof
################################################################################
