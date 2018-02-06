class RecordHelper

  def self.build_or_retrieve(record, user)
    begin
      @record = Record.find(name: record['record_type'], user_id: user[:id])
      @record[:value] = record['value']
    rescue Mongoid::Errors::DocumentNotFound
      @record = Record.new('name': record['record_type'], 'value': record['value'])
    end
    @user

  end
end