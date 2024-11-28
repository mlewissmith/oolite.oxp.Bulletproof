project(
  'oolite.oxp.Bulletproof',
  license       : 'UNLICENSE',
  version       : '0.0.2',
)

PROJECT_NAME     = meson.project_name()
PROJECT_VERSION  = meson.project_version()
PROJECT_LICENSE  = meson.project_license().get(0)

oxp_cfg_data = configuration_data(
  {
    'OXP_TITLE'       : 'Bulletproof',
    'OXP_DESCRIPTION' : 'Player\'s ship is immune to lasers',
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

ZIP_SH = find_program('zip.sh', required : true)
oxz = custom_target(
  'oxz',
  input            : oxp_files,
  output           : oxp_cfg_data.get('OXP_IDENTIFIER') + '.oxz',
  env              : {
                       'ZIP_OPTS'    : '-FS -v',
                       'ZIP_BASEDIR' : oxp_srcdir,
                     },
  command          : [ ZIP_SH, '@OUTPUT@', '@INPUT@' ],
  build_by_default : true,
)

oxz_versioned = custom_target(
  'oxz-versioned',
  input            : oxp_files,
  output           : oxp_cfg_data.get('OXP_IDENTIFIER')
                     + '-' + PROJECT_VERSION
                     + '.oxz',
  env              : {
                       'ZIP_OPTS'    : '-FS -v',
                       'ZIP_BASEDIR' : oxp_srcdir,
                     },
  command          : [ ZIP_SH, '@OUTPUT@', '@INPUT@' ],
  build_by_default : true,
)

################################################################################

verify_oxp = custom_target(
  'verify-oxp',
  output : '.PHONY.verify-oxp',
  command : [ 'head', '-n-0', oxp_files ],
)

verify_oxz = custom_target(
  'verify-oxz',
  output : '.PHONY.verify-oxz',
  command : [ 'unzip', '-l', oxz ],
)

custom_target(
  'verify',
  output  : '.PHONY.verify',
  depends : [ verify_oxp, verify_oxz ],
  command : [ 'true' ],
)
