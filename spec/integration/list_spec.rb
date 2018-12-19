RSpec.describe "`npm_3pp_lister list` command", type: :cli do
  it "executes `npm_3pp_lister help list` command successfully" do
    output = `npm_3pp_lister help list`
    expected_output = <<-OUT
Usage:
  npm_3pp_lister list

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
