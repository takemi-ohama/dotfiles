def textile_to_markdown(textile)
  d = []
  pre = false
  table_header = false
  text_line = false

  textile.each_line do |s|
     s.chomp!

    if pre
      if s =~ /<\/pre>/
        d << "~~~"
        pre = false
      else
        d << s
      end
      next
    end

    s.gsub!(/(^|\s)\*([^\s\*].*?)\*(\s|$)/, " **\\2** ")
    s.gsub!(/(^|\s)@([^\s].*?)@(\s|$)/, " `\\2` ")
    s.gsub!(/(^|\s)-([^\s].*?)-(\s|$)/, " ~~\\2~~ ")
    s.gsub!(/"(.*?)":(.*?)\.html/, " [\\1](\\2.html) ")

    d << ""  if text_line
    text_line = false

    case s
    when /^<pre>/
      d << "~~~"
      pre = true
    when /^\*\*\* (.*)$/
      d << "      * " + $1
    when /^\*\* (.*)$/
      d << "   * " + $1
    when /^\* (.*)$/
      d << "* " + $1
    when /^\#\#\# (.*)$/
      d << "      1. " + $1
    when /^\#\# (.*)$/
      d << "   1. " + $1
    when /^\# (.*)$/
      d << "1. " + $1
    when /^h(\d)\. (.*)$/
      d << "#" * $1.to_i + " " + $2
    when /^!(.*?)!/
      d << "![](#{$1})"
    when /^\|_\./
      d << s.gsub("|_.", "| ")
      table_header = true
    when /^\|/
      d << s.gsub(/\=\..+?\|/, ":---:|").gsub(/\s+.+?\s+\|/, "---|") if table_header
      table_header = false
      d << s.gsub("|=.", "| ")
    when /^\s*$/
      d << s
    else
      d << s
      text_line = true
    end
  end

  d.join("\n") + "\n"
end

textile = ""
begin
	File.open('test.txt') do |file|
		textile = file.read
	end
rescue SystemCallError => e
	puts "system error."
rescue IOError => e
	puts "IO error."
end

puts textile_to_markdown(textile)
	

