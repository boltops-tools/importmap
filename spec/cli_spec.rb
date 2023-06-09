describe Importmap::CLI do
  before(:all) do
    @args = "--from Tung"
  end

  describe "importmap" do
    it "hello" do
      out = execute("exe/importmap hello world #{@args}")
      expect(out).to include("from: Tung\nHello world")
    end

    commands = {
      "hell" => "hello",
      "hello" => "name",
      "hello -" =>  "--from",
      "hello name" => "--from",
      "hello name --" => "--from",
    }
    commands.each do |command, expected_word|
      it "completion #{command}" do
        out = execute("exe/importmap completion #{command}")
        expect(out).to include(expected_word) # only checking for one word for simplicity
      end
    end
  end
end
