project(
  'oolite.oxp.Bulletproof',
  license       : 'UNLICENSE',
  version       : '0.0.1',
)

PROJECT_NAME     = meson.project_name()
PROJECT_VERSION  = meson.project_version()
PROJECT_LICENSE  = meson.project_license().get(0)

prj_config = configuration_data(
  {
    'OXP_TITLE'       : 'Bulletproof OXP',
    'OXP_DESCRIPTION' : '[TODO]',
    'OXP_AUTHOR'      : 'mils32k',
    'OXP_IDENTIFIER'  : 'oolite.oxp.mils32k.Bulletproof',
    'OXP_VERSION'     : PROJECT_VERSION,
    'OXP_LICENSE'     : PROJECT_LICENSE,
    'OXP_OOLITE'      : '1.90',
    'OXP_CATEGORY'    : 'Misc',
    'OXP_INFOURL'     : 'https://github.com/mlewissmith/oolite.oxp.Bulletproof',
  }
)

################################################################################

oxp_srcdir = 'Bulletproof.oxp'
oxp_files = []
subdir(oxp_srcdir)




oxz_file = prj_config.get('OXP_IDENTIFIER') + '.oxz'
ZIP_SH = find_program('zip.sh', required : true)
oxz_target = custom_target(
  'oxz',
  input            : oxp_files,
  output           : oxz_file,
  env              : {
                       'ZIP_OPTS'    : '-MM -FS -v',
                       'ZIP_BASEDIR' : oxp_srcdir,
                     },
  command          : [ZIP_SH, '@OUTPUT@', '@INPUT@'],
  build_by_default : true,
)

