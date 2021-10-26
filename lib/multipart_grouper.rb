require "csv"

class MultipartGrouper
  def initialize(input_file:, group_files:)
    @input_file = input_file
    @group_files = group_files
  end

  # Implement this method
  def group
    [
      ["MRI Elbow", "MRI Forearm"],               # Created from the MRI Upper Limb group
      ["MRI Spine Coccyx", "MRI Spine Thoracic"], # Created from the MRI Axial Skeleton group
      ["MRI Thigh", "MRI Knee"]                   # Created from the MRI Lower Limb group
    ]
  end

  private

  def input_csv
    @input_csv ||= CSV.read(
      @input_file,
      headers: true
    )
  end

  def group_csvs
    @group_csvs ||=
      @group_files.map do |group_file|
        [
          group_file.split("/").last,
          CSV.read(
            group_file,
            headers: true
          )
        ]
      end
  end
end
