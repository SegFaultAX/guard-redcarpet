require 'guard'
require 'guard/guard'
require 'guard/watcher'
require 'redcarpet'

module Guard
  class Redcarpet < Guard

    def initialize(watchers = [], options = {})
      super(watchers, {
        :notifications => true
      }.merge(options))
      @watchers, @options = watchers, options
    end

    def compile_file(file)
      compile_markdown(File.new(file).read)
    end

    def compile_markdown(content)
      begin
        render = ::Redcarpet::Render::HTML.new(@options[:render_options] || {})
        markdown = ::Redcarpet::Markdown.new(render, (@options[:markdown_options] || {}))
        markdown.render content
      rescue StandardError => e
        ::Guard::UI.info "Redcarpet Error: #{e}"
      end
    end

    def get_output(file)
      file_dir = File.dirname(file)
      file_dir = File.join(@options[:output], file_dir) if @options[:output]
      file_name = File.basename(file).split(".")[0..-2].join(".") # remove extension

      file_dir == '' ? file_name : File.join(file_dir, file_name)
    end

    def run_all
      run_on_change Watcher.match_files(self, Dir.glob(File.join("**", "*.*")))
    end

    def run_on_change(paths)
      paths.each do |file|
        output_file = get_output file
        FileUtils.mkdir_p File.dirname(output_file)
        File.open(output_file, 'w') { |f| f.write(compile_file(file)) }
        ::Guard::UI.info "# compiled markdown in '#{file}' to html in '#{output_file}'"
        ::Guard::Notifier.notify("# compiled markdown in #{file}", :title => "Guard::Redcarpet", :image => :success) if @options[:notifications]
      end
    end

    def notify(changed_files)
      ::Guard.guards.reject{ |guard| guard == self }.each do |guard|
        paths = Watcher.match_files(guard, changed_files)
        guard.run_on_change paths unless paths.empty?
      end
    end
  end
end
