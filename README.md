# **Real-Time Security Monitoring and Response System**

## **Overview**

This project implements a **Real-Time Security Monitoring and Response System** that enhances network security by monitoring traffic in real-time, detecting anomalies, and responding automatically to security incidents. The system leverages **Zeek** for network traffic analysis, **Splunk** for log aggregation and visualization, and **Python** for automated response actions. All components are containerized using **Docker** for easy deployment and scalability.

---

## **Features**

### **1. Real-Time Traffic Monitoring**
- Detect network anomalies using Zeek.
- Generate detailed logs for analysis.

### **2. Log Aggregation and Visualization**
- Splunk aggregates logs from Zeek.
- Provides real-time dashboards for actionable insights.

### **3. Automated Incident Response**
- Python scripts automate responses to detected incidents (e.g., isolate hosts, block IPs, notify admins).

### **4. Containerized Deployment**
- Dockerized components ensure portability and simplified setup.

---

## **Setup and Usage**

### **Prerequisites**
- Docker and Docker Compose installed on your system.
- Zeek, Splunk, and Python dependencies configured in the respective `Dockerfile`.

### **Steps to Deploy**

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/security-monitoring-system.git
   cd security-monitoring-system

### **Configure the `.env` File**

1. Add environment variables such as:
   - `SPLUNK_PASSWORD`
   - `NETWORK_INTERFACE`
   - Any other necessary variables.

---

### **Start the System Using Docker Compose**

Run the following command to build and start the system:
```bash docker-compose up --build```

### **Access Splunk UI**

- **URL:** [http://localhost:8000](http://localhost:8000)  
- **Username:** `admin`  
- **Password:** Specified in `.env` file  

---

### **View Real-Time Network Activity**

1. Zeek logs are located in the `zeek/logs/` directory.
2. Analyze logs and dashboards in Splunk for actionable insights.

---

### **Test Automated Responses**

- Trigger incidents (e.g., port scans using `nmap`) to verify automated responses.

---

## **Video Demo**

Watch the full demo of the system in action on Google Drive:  
[**Real-Time Security Monitoring and Response System Demo**](https://drive.google.com/your-demo-link)

---

## **Key Components**

### **Zeek**
- Analyzes network traffic.
- Detects patterns indicating security threats.

### **Splunk**
- Aggregates and visualizes Zeek logs.
- Provides real-time dashboards and alerts.

### **Python Response Scripts**
- Handles automated actions like isolating hosts or notifying administrators.

### **Docker**
- Ensures all components run consistently across environments.

---

## **Testing**

### **1. Unit Testing**
- Python scripts in the `response/tests/` directory are tested using `pytest`.

### **2. End-to-End Testing**
- Simulate attacks and verify detection in Splunk and Zeek.
- Confirm automated response actions.

---

## **Future Enhancements**

### **1. Threat Intelligence Integration**
- Use services like AbuseIPDB to enrich detection capabilities.

### **2. Machine Learning**
- Add ML-based anomaly detection on Zeek logs.

### **3. Integration with External Systems**
- Automate reporting or integration with SIEM systems.

### **4. Cloud Deployment**
- Deploy on cloud platforms for scalability.

---

## **Contributing**

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a new feature branch.
3. Submit a pull request with a detailed description of the changes.

---

## **License**

This project is licensed under the MIT License. See the `LICENSE` file for details.