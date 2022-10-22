String url = "https://b09f-2403-6200-8858-f0-c361-9441-5497-5597.ap.ngrok.io";
const notificationDeleteGroup = r"""
query NotificationsDeleteGroup($filter: JSON) {
  notifications(filter: $filter) {
    _id
    type
    fields
    approve_by {
      frist_name
      last_name
      actor
    }
    noift
  }
}
""";
const addproveDeleteGroup = r"""
mutation ApproveDeleteGroup($input: ApproveDeleteGroupInput!) {
  approveDeleteGroup(input: $input)
}
""";

const allmember = r"""
query User {
  users {
    frist_name
    _id
    last_name
    localtion
    actor
    email
  }
}
""";
