require "spec_helper"
require_relative "../lib/multipart_grouper"

RSpec.describe MultipartGrouper do
  let(:group_paths) { Dir.glob("./spec/fixtures/groups/*.csv") }
  let(:input_path) { "./spec/fixtures/inputs/#{input_pathname}.csv" }

  subject do
    MultipartGrouper.new(input_file: input_path, group_files: group_paths).group
  end

  context "finds correct groups of two two and two" do
    let(:input_pathname) { "solved_example" }

    it "creates the expected mapping of 3 groups of 2 studies" do
      expect(subject).to eq(
        [
          ["MRI Elbow", "MRI Forearm"],               # Created from the MRI Upper Limb group
          ["MRI Spine Coccyx", "MRI Spine Thoracic"], # Created from the MRI Axial Skeleton group
          ["MRI Thigh", "MRI Knee"]                   # Created from the MRI Lower Limb group
        ]
      )
    end
  end

  context "Test input group one" do
    let(:input_pathname) { "test_one" }

    it "finds correct groups of two and four studies with no remainders" do
      expect(subject).to eq(
        [
          [
            "MRI Cervical Spine",
            "MRI Elbow"
          ],
          [
            "MRI Lumbar Spine",
            "MRI Pelvis",
            "MRI Spine Sacrum",
            "MRI Spine Coccyx"
          ]
        ]
      )
    end
  end

  context "Test input group two" do
    let(:input_pathname) { "test_two" }

    it "finds the expect group of 5, the one remainder is not included as it is not a group" do
      expect(subject).to eq(
        [
          [
            "MRI Thigh",
            "MRI Knee",
            "MRI Femur",
            "MRI Lower Leg",
            "MRI Ankle"
          ]
        ]
      )
    end
  end

  context "Test input group three" do
    let(:input_pathname) { "test_three" }

    it "creates the expected groups of six and two studies with no remainders" do
      expect(subject).to eq(
        [
          [
            "MRI Cervical Spine",
            "MRI Spine Coccyx",
            "MRI Spine Lumbar/Sacral",
            "MRI SIJ Both",
            "MRI Pelvis",
            "MRI Cervical Spine"
          ],
          [
            "MRI Elbow",
            "MRI Elbow"
          ]
        ]
      )
    end
  end
end
