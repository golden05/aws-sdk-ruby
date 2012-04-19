# Copyright 2011-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

# language: en
@dynamo_db @batch_write
Feature: DynamoDB Tables

  @slow
  Scenario: Batch Writing items
    Given I create a DynamoDB table
    And the table should eventually be active
    When I batch put 25 items to the table
    Then the table should have 25 items
    When I batch delete 25 items from the table
    Then the table should have 0 items

  @slow
  Scenario: Batch Writing across tables
    Given I create a DynamoDB table
    And I create a DynamoDB table
    And the tables are eventually active
    When I batch put 10 items to each table
    Then the tables should have 10 items each
