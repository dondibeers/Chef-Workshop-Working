Dir.chdir( /home/dbeers/test ) do
        Dir.glob( "**/*" ).select { |f| File.file?( f ) }.each do |f|
            dest = "#{/tmp/dbeers}/#{f}"
            FileUtils.mkdir_p( File.dirname( dest ) )
            FileUtils.cp( f, dest )
        end
    end
