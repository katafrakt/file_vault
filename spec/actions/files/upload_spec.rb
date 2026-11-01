# frozen_string_literal: true

RSpec.describe FileVault::Actions::Files::Upload, :db do
  after do
    FileUtils.rm_rf(SPEC_ROOT.join("tmp"))
  end

  let(:fixture) { SPEC_ROOT.join("fixtures/files/doc.docx") }

  let(:params) do
    {
      file: {
        tempfile: File.open(fixture),
        name: "doc.docx",
        filename: "doc.docx",
        type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      }
    }
  end

  it "stores the file, extracts metadata with Tika and saves it to the database" do
    response = subject.call(params)

    expect(response).to be_redirect

    file = Hanami.app["repos.file_repo"].all.last
    expect(file.filename).to eq("doc.docx")
    expect(file.pages).to eq(4)
    expect(file.title).to eq("DOCX Title Here")
    expect(file.author).to eq("John Smith")
    expect(file.description).to eq("A docx description")
  end
end
