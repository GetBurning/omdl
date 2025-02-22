################################################################################
# Module
################################################################################
$(eval $(call clear-local-module))
#------------------------------------------------------------------------------#

local_path        :=  shapes

local_library     :=  module \
                      \
                      basic_2d \
                      basic_2de \
                      basic_2dr \
                      basic_3d \
                      \
                      polygon_2d

local_release_add :=  svg/basic_2d_manifest.svg \
                      \
                      stl/basic_2de_manifest.stl \
                      stl/basic_2dr_manifest.stl \
                      stl/basic_3d_manifest.stl \
                      \
                      stl/polygon_2d_manifest.stl


local_backup_add  :=

local_submodules  :=

#------------------------------------------------------------------------------#
# add local module
#------------------------------------------------------------------------------#
$(eval $(call add-local-module))

################################################################################
# eof
################################################################################
