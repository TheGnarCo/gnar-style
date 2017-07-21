require "spec_helper"
require "gnar/style/cli/application"

module Gnar
  module Style
    module Cli
      RSpec.describe Application do
        describe ".source_root" do
          it "traverses up the tree and into the gnar_style directory" do
            end_dir = "lib/gnar/style/cli/../../../../gnar_style"
            expect(Gnar::Style::Cli::Application.source_root).to end_with end_dir
          end
        end

        describe "#copy_local" do
          subject(:cli) { Gnar::Style::Cli::Application.new }

          before { allow(cli).to receive(:copy_file) }

          it "copies the default rubocop file into a gnar_style directory" do
            cli.copy_local

            expect(cli).to have_received(:copy_file)
              .with("rubocop.yml", "gnar_style/rubocop.yml")

            expect(cli).not_to have_received(:copy_file)
              .with("rubocop_gem.yml", "gnar_style/rubocop_gem.yml")
            expect(cli).not_to have_received(:copy_file)
              .with("rubocop_rails.yml", "gnar_style/rubocop_rails.yml")
          end

          context "for a gem" do
            it "copies the default and gem rubocop files into a gnar_style directory" do
              cli.options = { format: "gem" }
              cli.copy_local

              expect(cli).to have_received(:copy_file)
                .with("rubocop.yml", "gnar_style/rubocop.yml")
              expect(cli).to have_received(:copy_file)
                .with("rubocop_gem.yml", "gnar_style/rubocop_gem.yml")

              expect(cli).not_to have_received(:copy_file)
                .with("rubocop_rails.yml", "gnar_style/rubocop_rails.yml")
            end
          end

          context "for a rails app" do
            it "copies the default and rails rubocop files into a gnar_style directory" do
              cli.options = { format: "rails" }
              cli.copy_local

              expect(cli).to have_received(:copy_file)
                .with("rubocop.yml", "gnar_style/rubocop.yml")
              expect(cli).to have_received(:copy_file)
                .with("rubocop_rails.yml", "gnar_style/rubocop_rails.yml")

              expect(cli).not_to have_received(:copy_file)
                .with("rubocop_gem.yml", "gnar_style/rubocop_gem.yml")
            end
          end
        end
      end
    end
  end
end
