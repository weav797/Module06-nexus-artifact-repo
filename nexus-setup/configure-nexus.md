# Nexus Configuration — What I Did During Training

As part of the training, after publishing Java artifacts to Nexus using both `gradle publish` and `mvn deploy`, I worked through configuring Nexus Repository to support better artifact management, access control, and cleanup. Here's a summary of what I did.

---

## 🔐 Created a Custom Deployment User

After uploading builds, I created a dedicated local (non-LDAP) Nexus user via the UI to handle future deployments. This user was given the necessary permissions to read from and write to Maven repositories.

- Username: `paul`
- Roles/Privileges assigned:
  - `nx-repository-view-maven2-maven-snapshots-*`

---

## 🗃️ Set Up a Custom Local Blob Store

Instead of using the default blob store, I created a new local blob store to logically separate storage for this set of repositories.

- Blob store name: `my-store`
- Type: Local (File system)
- Used this blob store for the hosted Maven repository I configured.

This gave me more flexibility in managing storage and cleanup tasks independently from other content. In actual practice, I would consider an AWS S3 bucket or Google Cloud Storage if these apps were deployed in a cloud environment.

---

## 🧾 Customized Privileges

I created a custom privilege to control access to the `maven-snapshots` repository and applied it to the deployment user via a new role. This helped reinforce how granular security can be managed inside Nexus.

---

## 🧹 Set Up Cleanup Policies and Tasks

To manage storage more effectively, I set up Nexus's cleanup tools. Here's how I configured them:

### Cleanup Policy
- Marked old artifacts for soft deletion across the board.
- Format: `maven2`
- Criteria: All the example artifacts using this Asset name matcher regex: `.*`

### Scheduled Task: Compact Blob Store
- Task type: `Compact blob store`
- Target: `my-store`
- Purpose: Physically remove soft-deleted components and free up disk space
- Schedule: Initially manual, but can be automated

This two-step process (soft delete + compaction) helped simulate how organizations manage artifact lifecycle and storage optimization.

---

## ✅ Summary

During the training, I went beyond just uploading builds and explored post-deployment configuration inside Nexus. Here's what I gained hands-on experience with:

- Creating custom Nexus users with scoped permissions
- Configuring a new local blob store and linking it to repositories
- Setting up Maven repositories with specific deployment and cleanup policies
- Managing storage via soft-deletion policies and compaction tasks

These steps gave me a clearer understanding of how artifact repositories are maintained in real-world environments and how to set up a self-managed infrastructure for Java artifact distribution.
