# Take Home Task

## Background
We report on medical scans, primarily MRI and CT. These scans are often called
studies.

When studies are of related body parts they are sometimes grouped together to
become "multipart grouped studies".

Effective grouping allows us to send these related scans to the same
radiologist for reporting, resulting in a more accurate diagnosis and better
outcomes for patients. 

This task is a simplified version of the grouping we do for our day-to-day
reporting.

## Task
Inside the spec directory of this repo are two folders, groups and inputs, they
contain CSV files. Groups contains lists of related studies that can be
combined to create multipart grouped studies, there are 3 of these groups.
Inputs contains lists of studies that we would like to try and group together.

The task is to find the optimal multipart grouped studies for each set of input
studies. 

The optimal solution is when the maximum number of studies are grouped into
multipart grouped studies with 2 or more studies in the groups. As another way
of saying the same thing, we want to minimise the number of studies left
ungrouped.

If there are 6 studies in the input list, then 3 multipart groups of 2 studies
represents all 6 studies grouped, whereas a multipart group of 2, a multipart
group of 3, and one left over represents 5 grouped (and one remainder). The 3
groups of 2 is a better solution than the group of 2 and group of 3.

## Solution

Bear in mind there may be more than one correct answer - if you can make 2
multipart groups of 3 or a multipart group of 2 and a multipart group of 4 then
these are both correct answers. 

It doesn't matter which correct answer you find but ideally your solution would
be consistent in it's output.

Inside the inputs folder are three example input csv files for you to use as test
cases. There are corresponding specs with example correct answers.

The required output is an array of arrays. Each sub array represents a
multipart grouped study that you have found and should be a list of the study
names in the multipart group. 

We are not looking for the most efficient algorithm to solve this. In reality
this mapping is done outside the hot path in a background worker, so within
reason O(n) notation complexity doesn't matter. A working solution is better
than an optimal submission that doesn't solve the problem.

# Worked Example
There is also a solved example (named solved_example.csv) which corresponds to
the example spec, where 3 multipart groups of two studies can be found.

A correct answer to the solved example is:

```ruby
[
  ["MRI Thigh", "MRI Knee"],                  # Created from the MRI Lower Limb group
  ["MRI Elbow", "MRI Forearm"],               # Created from the MRI Upper Limb group
  ["MRI Spine Coccyx", "MRI Spine Thoracic"]  # Created from the MRI Axial Skeleton group
]
```

## Setup

It's assumed you have Ruby installed, if not, install it. No specific version
is required.

The example tests are RSpec, install this with:
```
bundle install
```

To run the tests:
```
rspec
```

## Submission/Suggestions
There is a starting structure included if you want to use it (but feel free to
start from scratch if you'd like to, we have no preference). 

The starting structure includes lib and spec directories, inside lib is a
MultipartGrouper class that takes in the location of the CSVs of the groups and
input data and instantiates the Ruby CSV objects, inside spec is a spec with a
hard-coded passing test.  

Please spend approximately 90 minutes (or less) on this task. You may not have
time to finish all of it. Focus on having working software and tests, it is
better to have a solution that inconsistently finds different correct answers
over one that doesn't work at all.

Please submit your response as a pull request against the main branch of the repo.
