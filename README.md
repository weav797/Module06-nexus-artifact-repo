# Nexus Artifact Publisher

This project demonstrates setting up a private Nexus repository and publishing Java artifacts using both Gradle and Maven.<br /><br />
Source: **Techworld with Nana bootcamp**

## 🔧 Technologies Used
- Nexus
- DigitalOcean Droplet (Ubuntu)
- Java 17
- Gradle
- Maven
- Linux Shell Scripting

## 📦 Project Structure

- `nexus-setup/` - Scripts and notes for installing/configuring Nexus
- `gradle-project/` - Simple Java project built with Gradle, published to Nexus
- `maven-project/` - Simple Java project built with Maven, published to Nexus

## 🚀 Steps Performed

### 1. Provisioned a DigitalOcean Droplet
- Ubuntu 24.10
- Opened necessary firewall ports:
  - 8081 for Nexus
  - 22 for SSH (only from specific IPs for security)

### 2. Installed and Configured Nexus
- Installed Nexus using commands listed in ( `install-nexus.sh` )
  - Commands were performed manually, although there is opportunity to automate if needed.
- Created a new user with proper permissions
  -  System user named `nexus` was created for nexus tasks only
  - More details listed in ( `configure-nexus.md` )
- Used sample repository in Nexus (`maven-snapshots`)
- Note: This kind of repo is best for capturing builds for lower environments like Development/Test.

### 3. Created and Built Sample Java Projects
- One project using Gradle
- One project using Maven<br /><br />

  **Note**: Source files are from previous projects, provided by the author, Nana.
  - https://gitlab.com/twn-devops-bootcamp/latest/06-nexus/java-app
  - https://gitlab.com/twn-devops-bootcamp/latest/06-nexus/java-maven-app

### 4. Published Artifacts to Nexus
- Configured `build.gradle` and `pom.xml` to use Nexus as the repository
- Built JARs and pushed them using `gradle publish` and `mvn deploy`

### 5. Verified Uploads
- Logged into Nexus web UI
- Verified artifacts appeared in the correct repository

## 🔐 Notes
- Credentials are generally configured in `~/[insert_project_directory]/gradle.properties` and `~/.m2/settings.xml` (example templates included. see [here](https://github.com/weav797/Module06-nexus-artifact-repo/blob/main/gradle-project/gradle.properties) for gradle and [here](https://github.com/weav797/Module06-nexus-artifact-repo/blob/main/maven-project/m2/settings.xml) for maven templates.)

## 📸 Screenshots
See `/screenshots` folder for proof of Nexus setup and successful artifact uploads.

## 🧠 Lessons Learned
- Nexus setup reinforced my knowledge about Linux permissions
- Understood how build tools publish to private artifact repositories
- Gained hands-on experience in setting up internal developer infrastructure
