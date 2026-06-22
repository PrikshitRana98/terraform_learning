# 📘 Terraform Notes

---

## 🧩 What is Terraform?

**Terraform** is an open-source **Infrastructure as Code (IaC)** tool developed by HashiCorp.

It allows you to define, provision, and manage infrastructure using **HCL**.

---

## 🎯 Why Do We Use Terraform?

* Infrastructure as Code (IaC)
* Automation
* Multi-cloud support
* Consistency
* Execution plan
* State management
* Collaboration

---

## ☁️ Azure Resource Group in Terraform

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = "East US"
}
```

---

## ⚙️ Terraform Command: `terraform init`

* Initializes project
* Downloads providers & modules
* Sets up backend

---

## 🔁 Terraform Workflow

```bash
terraform init
terraform plan
terraform apply
```

---

## 📂 Multiple `.tf` Files

* All `.tf` files in a folder = **one configuration**
* Order doesn’t matter
* Terraform auto-handles dependencies

---

## 🌐 Web Server in Terraform

### 🔹 Types

* Single VM
* Load balanced
* Auto-scaled
* Container-based

---

## 💾 Azure Storage Account in Terraform

```hcl
resource "azurerm_storage_account" "storage" {
  name                     = "mystorageacct12345"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

---

# 🔌 Provider in Terraform

## ❓ What is a Provider?

A **Provider** in Terraform is a **plugin** that allows Terraform to interact with external platforms like cloud providers, SaaS services, or other APIs.

👉 It acts as a **bridge between Terraform and the service** (like Azure, AWS, etc.)

---

## 🌍 Examples of Providers

* Microsoft Azure → `azurerm`
* AWS → `aws`
* Google Cloud → `google`

---

## 🧱 Basic Provider Block

```hcl
provider "azurerm" {
  features {}
}
```

---

## 🔍 Explanation

* `provider` → Keyword to define provider
* `"azurerm"` → Azure provider name
* `features {}` → Required configuration block

---

## 🔐 Authentication (How Provider Connects)

Terraform needs credentials to access cloud.

### 🔹 Common Methods:

#### 1️⃣ Azure CLI Login

```bash
az login
```

👉 Terraform automatically uses this session

---

#### 2️⃣ Service Principal (Advanced): it is an identity(similar to human identity) used by applications or service to access Azure resource in an automated and secure way. 
it acts like a user indentity for applications inside the Azure Active directory (AAD) 



```hcl
provider "azurerm" {
  features {}

  client_id       = "xxxx"
  client_secret   = "xxxx"
  tenant_id       = "xxxx"
  subscription_id = "xxxx"
}
```

---

## ⚙️ Multiple Providers Example

```hcl
provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  features {}
}
```

👉 You can use multiple clouds in one project

---

## ⚠️ Important Points

* Provider must be defined before using resources
* Terraform downloads providers during `terraform init`
* Each resource belongs to a specific provider

---

## 🧾 Summary

* Provider = plugin to connect Terraform with services
* Required to create/manage resources
* Examples: `azurerm`, `aws`, `google`
* Handles authentication & API communication

---

## 🏗️ Why do we need Infrastructure as Code (IaC)?

### 📌 Short Answer:

👉 We need IaC to **automate, standardize, and scale infrastructure** without manual work.

---

# 🚀 Key Reasons

## ⚡ 1. Automation (No Manual Work)

* No clicking in cloud console
* Write code → run → infra ready

👉 Saves time + effort

---

## 🔁 2. Consistency (No Human Errors)

* Same code = same infrastructure
* Avoid “works on my machine” issues

---

## 📂 3. Version Control

* Store infra in Git
* Track changes like code

👉 You can rollback anytime

---

## 📈 4. Scalability

* Easily create:

  * Dev
  * Staging
  * Production

👉 Just reuse code

---

## 🧪 5. Faster Testing & Deployment

* Spin up infra quickly
* Destroy after testing

---

## 🔐 6. Better Security & Control

* Define permissions in code
* No random manual changes

---

## 💰 7. Cost Optimization

* Remove unused resources easily
* Avoid forgotten infra

---

## 🧠 Real Problem Without IaC

❌ Manual setup:

* 10 steps to create server
* Done differently every time
* Hard to debug

✅ With IaC:

```bash
terraform apply
```

👉 Everything created in one go

---

## 🔧 Example Tool

* Terraform

---

# 🎯 Interview One-Liner

👉 “IaC is needed to automate infrastructure provisioning, ensure consistency, enable version control, and scale environments efficiently.”

## ☁️ How Terraform helps in IaC

### 📌 Core Idea:

Terraform helps by letting you **write infrastructure as code and automatically create/manage it across clouds**.

---

# ⚙️ 1. Automation (One Command Infra)

Instead of manual setup:

```bash
terraform apply
```

👉 Terraform:

* Creates servers
* Sets up network
* Configures storage

All **automatically**

---

# 🔁 2. Consistency (Same Infra Every Time)

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "prod-rg"
  location = "Central India"
}
```

👉 Run multiple times → same result
👉 No manual mistakes

---

# 📂 3. Version Control (Git Friendly)

* Store `.tf` files in Git
* Track infra changes like code

👉 Example:

* Who changed server size?
* When DB added?

Everything tracked

---

# 📊 4. Execution Plan (Before Apply)

```bash
terraform plan
```

👉 Shows:

* What will be created
* What will be deleted
* What will change

👉 Safe deployments (no surprises)

---

# 🧠 5. State Management (Very Important)

Terraform keeps a **state file**:

```text
terraform.tfstate
```

👉 Tracks:

* What resources exist
* Their current state

👉 Helps in:

* Updates
* Deletions
* Sync with real infra

---

# 🔌 6. Multi-Cloud Support

👉 Same tool manages:

* Amazon Web Services
* Microsoft Azure
* Google Cloud Platform

---

# 📦 7. Reusability (Modules)

```hcl
module "vpc" {
  source = "./modules/vpc"
}
```

👉 Write once → reuse everywhere

---

# ⚡ 8. Easy Scaling

👉 Need 10 servers?

```hcl
count = 10
```

👉 Done instantly

---

# 🔄 Real Flow

```text
Write Code → terraform init → terraform plan → terraform apply
```

---

# 🧠 Real Example (Your Case)

Without Terraform ❌:

* Manually create VM
* Setup DB
* Configure storage

With Terraform ✅:

* Write code once
* Run → everything ready

---

# 🎯 Interview One-Liner

👉 “Terraform enables IaC by automating infrastructure provisioning, maintaining state, providing execution plans, and supporting multi-cloud deployments.”

---

If you want next:
👉 I can explain **Terraform state file deeply (very important for interviews)**
👉 OR **real-world project setup (React Native backend infra using Terraform)** 🚀

Great—let’s go deep into the **Terraform State File** first (this is *super important for interviews and real projects* 👇)

---

# 🧠 Terraform State File Deep Dive

## 📌 What is State File?

In Terraform, the **state file (`terraform.tfstate`)** is used to **track all infrastructure resources created by Terraform**.

👉 It is the **source of truth** for your infrastructure.

---

# 🗂️ What does it store?

The state file contains:

* Resource IDs (from cloud)
* Configuration mapping
* Metadata
* Current state of infra

👉 Example:

```json
{
  "resources": [
    {
      "type": "azurerm_resource_group",
      "name": "rg",
      "instances": [...]
    }
  ]
}
```

---

# ⚙️ Why State File is Needed

## 1. 🔄 Mapping (Code ↔ Real Infra)

Terraform needs to know:
👉 “Which resource in code = which resource in cloud”

---

## 2. ⚡ Faster Execution

* No need to call cloud APIs again and again
* Uses state for comparison

---

## 3. 🧾 Change Detection

```bash
terraform plan
```

👉 Terraform compares:

* Current state (state file)
* Desired state (your code)

👉 Then decides:

* Create
* Update
* Delete

---

# 🔄 Workflow with State

```text
Write Code
   ↓
terraform apply
   ↓
Create Infra
   ↓
Update terraform.tfstate
```

---

# 📁 Types of State

## 🖥️ 1. Local State (Default)

```text
terraform.tfstate
```

👉 Stored on your local machine
❌ Not safe for teams

---

## ☁️ 2. Remote State (Recommended)

Stored in cloud like:

* Amazon Web Services (S3)
* Microsoft Azure (Blob Storage)

👉 Used in teams

---

# 🔐 Remote State Example (Azure)

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg"
    storage_account_name = "storage123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```

---

# 🚨 Important Risks

## ❌ 1. Sensitive Data

* Passwor
* Keys
  👉 Stored in state file

---

## ❌ 2. State Corruption

* Manual edits = break infra

---

## ❌ 3. Team Conflicts

* Multiple people editing → issues

---

# 🛡️ Best Practices

* ✅ Use **remote state**
* ✅ Enable **state locking**
* ✅ Don’t commit `.tfstate` to Git
* ✅ Use **backend encryption**

---

# 🔒 State Locking

👉 Prevents multiple users from running Terraform at same time

Example:

* Azure Blob → supports locking
* AWS S3 + DynamoDB

---

# 🧠 Real Scenario

👉 You created a VM using Terraform

Later:

* You change VM size in code

👉 Terraform:

1. Reads state file
2. Compares with code
3. Updates only required changes

---

# ⚡ Key Concept (VERY IMPORTANT)

👉 Terraform does **NOT scan cloud fully**
👉 It depends on **state file**

---

# 🎯 Interview One-Liner

👉 “Terraform state file is a JSON file that tracks infrastructure resources and maps configuration to real-world resources, enabling efficient updates and management.”



## ⚙️ How Terraform Works

### 📌 Simple Idea:

👉 You **write infrastructure in code** → Terraform **plans** → then **creates/updates** real cloud resources.

---

# 🔄 Complete Workflow

```text
Write Code → Init → Plan → Apply → Infrastructure Created
```

---

# 🧱 Step-by-Step Working

## 1. ✍️ Write Configuration (.tf files)

Example:

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "my-rg"
  location = "Central India"
}
```

👉 This defines **what you want**

---

## 2. ⚙️ `terraform init` (Initialization)

```bash
terraform init
```

👉 What happens:

* Downloads providers from 👉 Terraform Registry
* Sets up `.terraform/` folder

---

## 3. 📊 `terraform plan` (Execution Plan)

```bash
terraform plan
```

👉 Terraform:

* Reads your code
* Reads **state file**
* Compares both

👉 Shows:

* What will be created
* Updated
* Deleted

---

## 4. 🚀 `terraform apply` (Execution)

```bash
terraform apply
```

👉 Terraform:

1. Calls **provider plugins**
2. Providers call **cloud APIs**
3. Resources get created

---

## 5. 🧠 State File Update

👉 After apply:

* Updates `terraform.tfstate`
* Stores mapping of:

  * Code ↔ Real resources

---

# 🔌 Internal Working (Important)

```text
terraform.exe (core engine)
        ↓
Provider (AWS / Azure / GCP)
        ↓
Cloud API
        ↓
Infrastructure created
```

---

# 🔑 Key Concepts

## 🧠 1. Declarative Approach

👉 You define **WHAT you want**, not how

---

## 🔄 2. Idempotency

👉 Run multiple times → same result
👉 No duplicate resources

---

## 📂 3. State Management

👉 Keeps track of infrastructure
👉 Enables updates instead of recreation

---

## 🔗 4. Dependency Graph

Terraform builds a graph:

```text
VPC → Subnet → VM
```

👉 Executes in correct order automatically

---

# ⚡ Example Flow (Real Case)

👉 You add:

```hcl
resource "azurerm_storage_account" "storage" {}
```

👉 Run:

```bash
terraform apply
```

👉 Terraform:

* Checks state
* Sees storage not created
* Creates it
* Updates state

---

# 🎯 Interview One-Liner

👉 “Terraform works by reading declarative configuration files, creating an execution plan, and using providers to provision infrastructure while maintaining state for tracking.”

---

# 🧠 Super Important Line (for Interviews)

👉 “Terraform does not directly interact with cloud; it uses provider plugins and state file to manage infrastructure efficiently.”

---

Terraform Lifecycle

Write Code
   ↓
terraform plan
   ↓
Create / Update / Destroy
   ↓
State File Updated



<!-- terraform Plan -->
it scan the resource block, and compare the code and .terraformState file





