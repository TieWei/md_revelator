require "md_revelator/reveal_render"

module Md::Revelator

  class Redcarpet_Revelator
    def self.do_reveal(input_file, output_dir)
      input = File.read(input_file)
      extends = {:no_intra_emphasis => true, :fenced_code_blocks=>true}
      output = Redcarpet::Markdown.new(Md::Revelator::RevealRender, extends).render(input)
      reveal_js = "#{File.dirname(__FILE__)}/../../reveal.js-2.6.1/*"
      FileUtils.cp_r(Dir.glob(reveal_js) , output_dir)
      File.open("#{output_dir}/index.html", "w"){|f| f.write output}
    end
  end
end