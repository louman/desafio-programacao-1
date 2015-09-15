shared_context 'valid_associations' do |associations_rules|
  context 'associations' do
    associations_rules.each do |type, associations|
      associations.each do |model|
        it do
          expectation = if model.is_a?(Proc)
                          instance_exec(&model)
                        else
                          send(type, model)
                        end

          is_expected.to expectation
        end
      end
    end
  end
end
