module Hazel
  module Extensions
    module String
      def camel_case
        return self.gsub(/^./) { |l| l.capitalize } if !match(/[_-]/)
        altered_self = self.downcase.capitalize
        altered_self.scan(/[_-][a-zA-Z]/).each do |match|
          altered_self.gsub!(match, match[1].upcase)
        end

        altered_self
      end

      def camel_case!
        self.replace camel_case
      end

      def file_name
        return self.gsub(/-/, "_") if !match(/[A-Z]/)
        altered_self = self.strip

        altered_self.scan(/[A-Z]/).each do |match|
          altered_self.gsub!(match, "_#{match.downcase}")
        end

        altered_self.sub(/^_/, "").gsub(/_{2,}+/, "_").downcase
      end

      def file_name!
        self.replace file_name
      end
    end
  end
end

String.send(:include, Hazel::Extensions::String)
