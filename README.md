# OpenSearch SOC Lab

A containerized Security Operations Center (SOC) laboratory built with OpenSearch, OpenSearch Dashboards, Logstash, and Filebeat. This project demonstrates the complete security log ingestion lifecycle, from log generation and collection to parsing, indexing, visualization, and security monitoring.

---

## Overview

The OpenSearch SOC Lab simulates a real-world security monitoring environment by generating VPN authentication events and processing them through an Elastic-style data pipeline.

The goal of this project is to provide hands-on experience with:

* Security log collection
* Log parsing and normalization
* SIEM technologies
* OpenSearch administration
* Dashboard creation
* Security monitoring workflows
* Detection engineering fundamentals

This lab serves as a foundation for SOC Analyst, Blue Team, Detection Engineer, and Cybersecurity Engineering skill development.

---

## Features

### Security Event Generation

The environment includes a custom VPN log generator capable of producing realistic authentication events such as:

* Successful VPN logins
* Failed authentication attempts
* Multiple login attempts
* Different source IP addresses
* User activity simulation
* Geographic login information

### Log Collection

Filebeat continuously monitors security logs and forwards events to Logstash for processing.

### Log Processing

Logstash performs:

* Log parsing
* Field extraction
* Timestamp normalization
* Data enrichment
* Structured event creation

### Search and Storage

OpenSearch stores parsed events and enables:

* Fast searching
* Threat hunting
* Security investigations
* Historical analysis

### Visualization

OpenSearch Dashboards provides:

* Security dashboards
* Log exploration
* Visual analytics
* Monitoring capabilities

---

## Architecture

```text
+----------------------+
| VPN Log Generator    |
+----------+-----------+
           |
           v
+----------------------+
| Filebeat             |
| Log Collection Agent |
+----------+-----------+
           |
           v
+----------------------+
| Logstash             |
| Parsing & Processing |
+----------+-----------+
           |
           v
+----------------------+
| OpenSearch           |
| Data Storage & Query |
+----------+-----------+
           |
           v
+----------------------+
| OpenSearch Dashboards|
| Visualization Layer  |
+----------------------+
```

---

## Technology Stack

| Component             | Purpose                           |
| --------------------- | --------------------------------- |
| OpenSearch            | Search and analytics engine       |
| OpenSearch Dashboards | Data visualization and monitoring |
| Logstash              | Log processing and parsing        |
| Filebeat              | Log collection                    |
| Docker Compose        | Container orchestration           |
| Bash                  | Log generation scripts            |

---

## Project Structure

```text
opensearch-soc-lab/
│
├── docker-compose.yml
│
├── filebeat/
│   └── filebeat.yml
│
├── logstash/
│   ├── pipeline/
│   │   └── pipeline.conf
│   └── config/
│
├── logs/
│   └── vpn.log
│
├── scripts/
│   └── generate_vpn_logs.sh
│
└── README.md
```

---

## Data Flow

### Step 1 – Log Generation

A custom script generates VPN authentication logs.

Example:

```log
2025-06-01T10:15:21Z vpn-gateway LOGIN_SUCCESS user=jdoe src_ip=192.168.1.100 country=Hungary
```

---

### Step 2 – Filebeat Collection

Filebeat continuously monitors:

```text
logs/vpn.log
```

and ships events to Logstash.

---

### Step 3 – Log Parsing

Logstash uses Grok patterns to extract structured fields:

```json
{
  "user": "jdoe",
  "src_ip": "192.168.1.100",
  "country": "Hungary",
  "action": "LOGIN_SUCCESS"
}
```

---

### Step 4 – Indexing

Processed logs are stored in OpenSearch indexes.

Example index:

```text
vpn-logs-2025.06.01
```

---

### Step 5 – Analysis

Security analysts can:

* Search events
* Filter by user
* Investigate suspicious logins
* Create dashboards
* Build alerts

---

## Installation

### Prerequisites

* Docker
* Docker Compose
* Git

---

### Clone Repository

```bash
git clone https://github.com/tothadam710/opensearch-soc-lab.git

cd opensearch-soc-lab
```

---

### Start the Environment

```bash
docker-compose up --build -d
```

Verify running containers:

```bash
docker ps
```

---

### Access OpenSearch Dashboards

Default URL:

```text
http://localhost:5601
```

Login:

```text
Username: admin
Password: <configured password>
```

---

## Generating Sample Data

Run:

```bash
./scripts/generate_vpn_logs.sh
```

or

```bash
bash generate_vpn_logs.sh
```

Generated events will automatically flow through the pipeline.

---

## Security Monitoring Use Cases

### Use Case 1 – VPN Brute Force Attack

Monitor repeated failed login attempts from the same source IP.

MITRE ATT&CK:

```text
T1110 – Brute Force
```

---

### Use Case 2 – External Remote Access

Monitor VPN logins from external locations.

MITRE ATT&CK:

```text
T1133 – External Remote Services
```

---

### Use Case 3 – Valid Account Usage

Detect logins using privileged accounts.

MITRE ATT&CK:

```text
T1078 – Valid Accounts
```

---

### Use Case 4 – Geographic Anomalies

Detect authentication events originating from unexpected countries.

Potential indicators:

* Credential theft
* Account compromise
* Unauthorized access

---

## Future Improvements

Planned enhancements include:

### Security Detections

* Brute force detection rules
* Impossible travel detection
* Account lockout monitoring
* Privileged account monitoring

### Additional Log Sources

* Windows Event Logs
* Sysmon
* Suricata
* Zeek
* Linux Auditd
* Firewall logs

### Threat Intelligence

* IP reputation enrichment
* GeoIP lookups
* Threat feed integration

### Automation

* Alerting workflows
* Automated response actions
* Case management integration

---

## Dashboard Ideas

Example visualizations:

* VPN login trends
* Failed login statistics
* Top source countries
* Top authenticated users
* Login success vs failure ratio
* Security events by hour
* High-risk login activity

---

## Learning Objectives

This project demonstrates practical experience with:

* SIEM architecture
* OpenSearch administration
* Security log analysis
* Log parsing with Grok
* Docker containerization
* Security monitoring workflows
* Detection engineering fundamentals
* Threat hunting concepts

---

## Screenshots

### Architecture

Insert architecture diagram here.

---

### OpenSearch Dashboard

Insert dashboard screenshot here.

---

### Security Analytics

Insert security monitoring screenshots here.

---

## Disclaimer

This project is intended for educational and laboratory purposes only.

The generated data is simulated and does not contain real user information.

---

## Author

**Ádám Tóth**

Cybersecurity enthusiast focused on:

* SOC Operations
* Detection Engineering
* Threat Hunting
* SIEM Technologies
* Blue Team Security

GitHub:

https://github.com/tothadam710

---

## License

This project is released under the MIT License.
