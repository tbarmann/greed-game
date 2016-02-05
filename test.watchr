watch( "lib/(.*)\.rb" ) { |md| system("ruby test/#{md[1]}_test.rb")}
watch( "test/.*_test\.rb" ) { |md| system("ruby #{md[0]}")}
