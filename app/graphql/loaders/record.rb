class Loaders::Record < GraphQL::Batch::Loader
  def initialize(model, key = :id)
    @model = model
    @key = key
  end

  def perform(args)
    model
      .where(key => args.uniq)
      .each { |record| fulfill(record.public_send(key), record) }

    args.each { |arg| fulfill(arg, nil) unless fulfilled?(arg) }
  end

  private

  attr_reader :model, :key
end


