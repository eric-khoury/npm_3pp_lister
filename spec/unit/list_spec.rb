require 'npm_3pp_lister/commands/list'

RSpec.describe Npm3ppLister::Commands::List do
  it "executes `list` command successfully" do
    output = StringIO.new
    options = {}
    command = Npm3ppLister::Commands::List.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
