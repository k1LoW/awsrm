require 'thor'

module Awsrm
  class Toolbox < Thor
    desc 'docgen > doc/resources.md', 'Generate doc/resources.md document'
    def docgen
      puts Awsrm::Generator::Doc::Resource.generate_doc
    end
  end
end
