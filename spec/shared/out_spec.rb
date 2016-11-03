# frozen_string_literal: true
require 'spec_helper'
require 'securerandom'

shared_examples 'out' do
  let(:resource_contents) { SecureRandom.uuid }

  it 'idempotently pushes a version up' do
    pipe_in_file('../../spec/fixtures/out/input.json') && close_input

    expect(last_command_started).to be_successfully_executed
    expect(last_command_started.stdout).to be_json
    expect(last_command_started.stdout).to be_json_as({
      'version'  => { 'ref' => '61cebf' },
      'metadata' => [
        { 'name' => 'commit', 'value' => '61cebf' },
        { 'name' => 'author', 'value' => 'Mick Foley' },
      ]
    })
  end
end
