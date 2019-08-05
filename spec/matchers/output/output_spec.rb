describe 'Matcher Output' do
  it { expect { puts 'Caio' }.to output.to_stdout }
  it { expect { print 'Caio' }.to output('Caio').to_stdout }
  it { expect { puts 'Caio' }.to output(/Caio/).to_stdout }

  it { expect { warn 'Caio' }.to output.to_stderr }
  it { expect { warn 'Caio' }.to output("Caio\n").to_stderr }
  it { expect { warn 'Caio' }.to output(/Caio/).to_stderr }
end