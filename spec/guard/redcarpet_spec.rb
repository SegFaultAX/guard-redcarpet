require 'spec_helper'

describe Guard::Redcarpet do
  subject { Guard::Redcarpet.new }

  describe "run all" do
    it "should re-compile all files being watched" do
      Guard::Redcarpet.stub(:run_on_change).with([]).and_return([])
      Guard.stub(:guards).and_return([subject])
      subject.run_all
    end
  end

  describe "compiling markdown" do

  end

  describe "getting output" do
    context "default" do
      it "should return test/index.html.md as test/index.html" do
        subject.get_output("test/index.html.md").should eq("test/index.html")
      end

      it "should return test/index.html.markdown as test/index.html" do
        subject.get_output("test/index.html.markdown").should eq("test/index.html")
      end
    end

    context "with output option" do
      before :each do
        subject.options[:output] = "demo/output"
      end

      it "should return test/index.html.md as demo/output/test/index.html" do
        subject.get_output("test/index.html.md").should eq("demo/output/test/index.html")
      end

      it "should return test/index.html.markdown as demo/output/test/index.html" do
        subject.get_output("test/index.html.markdown").should eq("demo/output/test/index.html")
      end
    end
  end

  describe "compiling markdown" do
    context "default" do
      it "should use default html renderer" do
        subject.compile_markdown("# Title").should eq("<h1>Title</h1>\n")
      end
    end

    context "markdown options" do
      before :each do
        subject.options[:markdown_options] = { :strikethrough => true }
      end

      it "should use markdown options, if provided" do
        subject.compile_markdown("~~blah~~").should eq("<p><del>blah</del></p>\n")
      end
    end

    context "render options" do
      before :each do
        subject.options[:render_options] = { :no_links => true }
      end

      it "should use markdown options, if provided" do
        subject.compile_markdown("[G](http://www.google.com)").should eq("<p>[G](http:&#47;&#47;www.google.com)</p>\n")
      end
    end
  end

  describe 'building markdown to html' do
    it 'should notify other guards upon completion' do
      other_guard = mock('guard')
      other_guard.should_receive(:watchers).and_return([])
      Guard.stub(:guards).and_return([subject, other_guard])
      subject.notify([])
    end
  end  
end
