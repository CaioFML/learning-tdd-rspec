require 'student'
require 'course'

describe "Mocks" do
  # setup
  let(:student) { Student.new }
  let(:other_student) { Student.new }
  let(:course) { Course.new }

  it "#bar" do
    # verify
    expect(student).to receive :bar
    # exercise
    student.bar
  end

  it "args" do
    expect(student).to receive(:foo).with(123)

    student.foo(123)
  end

  it "once" do
    expect(student).to receive(:foo).with(123).once

    student.foo(123)
  end

  it "twice" do
    expect(student).to receive(:foo).with(123).twice

    student.foo(123)
    student.foo(123)
  end

  it "at_least 3 times" do
    expect(student).to receive(:foo).with(123).at_least(3).times

    student.foo(123)
    student.foo(123)
    student.foo(123)
  end

  it "return" do
    expect(student).to receive(:foo).with(123).and_return(true)

    student.foo(123)
  end
end
