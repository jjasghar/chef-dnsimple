require 'spec_helper'
require 'fog/dnsimple'

describe 'dnsimple_test::destroy_record_no_exists' do
  include_context 'dnsimple'

  context 'with no record with same name and type' do
    it 'does not perform any operation' do
      create_record_to_update

      dnsimple_resource = chef_run.find_resource('dnsimple_record', 'name')
      expect(dnsimple_resource.updated_by_last_action?).to be_falsy
      expect(Fog::DNS::DNSimple::Record).not_to receive(:destroy)

      record = dnsimple_zone.records.detect { |r| r.name == 'existing' }
      expect(record.value).to eq '2.2.2.2'
    end
  end
end
