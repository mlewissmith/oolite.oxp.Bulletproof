fs = import('fs')

infiles = [
  'manifest.plist.in',
]

foreach infile : infiles
  assert(infile.endswith('.in'))
  outfile = fs.stem(infile)
  oxp_file = configure_file(
    input         : infile,
    output        : outfile,
    configuration : prj_config,
  )
  oxp_files += oxp_file
endforeach

subdir('Config')
subdir('Scripts')

