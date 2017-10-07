describe Hbc::CLI::InternalStanza, :cask do

  it "shows stanza of the Specified Cask" do
    command = described_class.new("gpg", "with-gpg");
    command.run
    # TODO check result
  end

  it "raises an exception when stanza is invalid" do
    expect {
     described_class.new("invalid_stanza", "with-gpg");
    }.to raise_error(/Illegal stanza/);
  end

  it "raises an exception when normal stanza is not present on cask" do
     command = described_class.new("caveats", "with-gpg");
     expect {
       command.run
     }.to raise_error(/no such stanza/)
  end

  it "raises an exception when artifact stanza is not present on cask" do
     command = described_class.new("zap", "with-gpg");
     expect {
       command.run
     }.to raise_error(/no such stanza/)
  end
end
