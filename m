Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADBA3E171B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320994; cv=none; b=p3rcP0fS5VaXqj66OSTmQGxfdniBBHxJ3MggqiQTDSSWrUyB4hsEX2f7PDsDBevAesiIGhZzeCCP3kYIpCtnV9z8BnXpLNlqe1Zlr+KqMsb57G8enWqH7jTZQWcizt7Ptfr6l96OPNLQkC5oyNxSAGUHPVdEKc/Deg19YYI6qGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320994; c=relaxed/simple;
	bh=T6SxR7G/mTyHQ04HDB9ImIv3sNQZvFckcGEYXzgtnjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KrgfQJ+Z5eGFNC+LnGBPvmqhMeWebgA99o5DmAKGiFIImIxgYTZAFTysaZWY1RQ/K8SG7hu6FoWf95jkgv42jPx3vpoKqAygAvSzuMaPP0eXGvrnVKGpQrwoOla4w6ERnqFYGJYTpkjMpUUr9I8dJ9Q9jEF+HNstsg3dX+e2nbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARM+D2OI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZgAr5iX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARM+D2OI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZgAr5iX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66642PLv3541484
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3nXe+cX2WVLfAzs7rlgGjg
	7fT4mfc/Db8bo5IZZ1ZD4=; b=ARM+D2OIoRKFT867up3UZgzv4vdOSAxQCsXo/X
	yD2DVT9M8S/tkUeOSYckWBX0hAi4tHGoS06S1FDQDiJOmP+v16jsO1qlIkTwEHpw
	AwvsF0+rc7+u6ikqBtW8nZtgyNWrOmYPBQs6Ph+paAQJkQyJJHk1RiXonXzQ+z7v
	GXJlokwtQ9k8j2URMTn2WbgOqnCvL5yaF3lyItZTLALR4vg7RZFdPU/p4bMBH8mb
	RLDfSgOtzUpEN6oKOGWb4PX1R0n0Z1lNJYuICpBcfbya3VLgs4hRN9UnAsZ8x2qe
	SJ+M5FpL2jav9XN1CIe9vGQvNNwbVXPGOdcp63S2Xpc77k9A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnn883-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:56:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso4239894b3a.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320982; x=1783925782; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nXe+cX2WVLfAzs7rlgGjg7fT4mfc/Db8bo5IZZ1ZD4=;
        b=RZgAr5iXoFN87zVNaPmo1xBGKspqPeEcvuqZ3JQXs6nMNZFdDCWqYrSJ68EqeOyykJ
         Cslh98gIj1lWHeHJ6rJtxqg52Gphj1a4XDVOo+O7ens2vvqfGnHZ7WKF0cfRfat6I5mG
         lX1pAqCrZplccX3LotPqBaJaSa9WH2xSlzyxPa6LsK5Dl6Fh1DJeYO1dc/KIhueqreDQ
         PyQY/Cm1Ltu/6KzuZr9dHBgfgmYK4mZrEssVu71IR2SeOBD4+VbvpcdUiwAgb8A5Muve
         99RCEMjZ0CO8fpCzemsqe7ukDxcUzjkR/SRrd4cU7XtLuZVK1kLuK4FV6DUglPpUHdFf
         Gp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320982; x=1783925782;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nXe+cX2WVLfAzs7rlgGjg7fT4mfc/Db8bo5IZZ1ZD4=;
        b=LND8HuENO6n2LO3sCPRwMlFILuYgqntRXTYACh1RBTN+6DhbF5WWWsSLajE598JjmE
         Va4jon/q7GccvyyOcWb31g83fidsqCsfSFsoAJ9kLND5PVrexcQffbO9vEptRGxtpkFF
         O4+pX3wvV5ebGeGJdw676550/VPVz9acr+CROXHO0RItVpOsVhtdj7C6ln1Dk4Vei5LW
         09iGembjh1O1ERGWW1sUTxNesALrau/Y8HEjbn+0jFqQpVSvVLETSOsA2FyB0LTH6WQ5
         CZFuI53HuY8h3EE6I3jP2P1BdLEh7he0fweLfoudUK8vTF2yieNT8ZR6XKf33plQR/R+
         CqNw==
X-Forwarded-Encrypted: i=1; AHgh+RpL1SC+N38dgkSQtfwVaMaTSbSP6pBlR52ubj1VaSI7xrqX2njIzGyvzg/kmLClWPAr8n4rrLTDEsyO@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuJEum+EfveXtjykYiY/KPPUSmDiG7N8z56rFk9Bkuelb9hQB
	MsqH88qVh4NUNojEKDlEaqk3JPC8PbSZTxJE9NmEy5MQd7cN4NOzxq8UBedar1hlRY7OlotZMvW
	tkTN+KiuulWC8shJdfr1tPVnZD2U65HuyUrEaAoNNglybLTNiVnt+Fom88Q5vcJgfXpX929wj
X-Gm-Gg: AfdE7cmU2vpUpvEC9rWaPcWrUzDzC68aNE6pb3KbwqtV29ULiox7Q+vr7ds1GrG4OrE
	5KgRURVPV3fQQ6W/rjdeXJt3mMFxDZ+tTeP2wFk1qaDwajEn5gElcJTO5OZO/NeKKwCXuOeY1E9
	S6XvnAeVnZ7zvTwmG+CTg8A91qSEp38voqHf9nI45qecUl3gezyUke+rhjpPPCTNKlFLi3OJ7do
	6nfLTNcwkOJ5m4lyavzDnUTE5JsrP8gc8+t/EOLje+ml1YQ+mM7i01vJe66o4x2yq9TTXEpR7fC
	BjFvp0f4by5aTwxq335kJRGPgcz/KdQb+9EU2eeCAo/PsCHFR7KL5QZgmoRg/+57sFswQvWFNYO
	7TPS0tQ8OqQJ7vjaCCK8JfPa+LH8=
X-Received: by 2002:a05:6a00:b84:b0:847:9d87:5ab5 with SMTP id d2e1a72fcca58-847f6f385a6mr7432605b3a.49.1783320981990;
        Sun, 05 Jul 2026 23:56:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:b84:b0:847:9d87:5ab5 with SMTP id d2e1a72fcca58-847f6f385a6mr7432586b3a.49.1783320981491;
        Sun, 05 Jul 2026 23:56:21 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6952a0dsm3312998b3a.0.2026.07.05.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:56:20 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 12:25:59 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: add CPU capacity-dmips-mhz
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add-cpu-capacity-dmips-mhz-v1-1-85deced44b20@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH5RS2oC/x3MMQ6DMAwAwK8gz7WUhAKCr1QMkW3AAxAltIKi/
 L1Rx1vuhiRRJcFQ3RDlo0n3rcA+KqDFb7OgcjE441rTmRo9M1J4I/ngSY8LedWQcF2+6EzfsGv
 oaa1ACUKUSc9//hpz/gFJByt5bAAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783320978; l=6492;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=T6SxR7G/mTyHQ04HDB9ImIv3sNQZvFckcGEYXzgtnjA=;
 b=Is+Ya/YOrFuLzbRXGmxYljzgD7OpaP8Z+qZM2OnKCuog+EJlTMlKfOHqOEta2dubvv62i5wDz
 o1tdNjYwlbRCKwB56ON+oR5/8hhwDRxlKiFIsUSWLrT/5eBhwyfHIRW
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NyBTYWx0ZWRfX4byy8/41UmbO
 hJ7/Ksbf62Xa4b9jXb3ZE9XnuMIr6KpEmcRKJwNv+dSkPNnjUTgBDG1gq0KpUI4m5P+0LewAaOv
 T/+7eSXmZ1RWb1X2JTdgG5BP0OFmACU=
X-Proofpoint-ORIG-GUID: R-ZTLH7HkIgOCA8-XC5pXS_-IMEZBd3h
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4b5197 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zLzZgYUx58GfyaoRtDoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NyBTYWx0ZWRfXzZMRHOnEeN06
 Y8pqZLEjn6c7wcH0+rHIpHYiqvHIY83ks9sBWojWqLNLBNldKrSgJ+AiLKKVrjj/pQqu50vuWYE
 39tydKG8r78CiWjPrJHypVOFUE5Xj7fy1y4IJWO6d9UlV2sW2ydFgHjNPA5IqQnXRR4Uthm5afL
 bfZ7uH2PbK8XbZscBeqXjjFlrtlu5pP5tb/n8at9H0hoA9+QphD1XCE/pgBYLNUfrRi+ZnDNbWK
 8CfcajT1UVxC6/SYNcy+UdC+bhm5DBabLoVN5h75kH/4EkeKwQQfd8yDX54ER1/AQFNrWi/4yvg
 5UrOJ/PTftCNVPjuc8itePhBBHul8dSZ/IhF9Z3qMZJx9g6kPwZJavR6c6wbJaqiBsqtZfJanqz
 1zGrFf3VPVfDefSQ/nQimPXvfIowJU6F8g6YIruHD7Q4kfQzCfraCwqL0bbV9iHK9D80//jkepF
 34sTEnPAIjU45wxqAzg==
X-Proofpoint-GUID: R-ZTLH7HkIgOCA8-XC5pXS_-IMEZBd3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060067

The Glymur SoC has two distinct core types within the same Oryon
microarchitecture generation:

  - qcom,oryon-2-2 (cpu0-cpu5, cluster 0)
  - qcom,oryon-2-1 (cpu6-cpu11, cluster 1; cpu12-cpu17, cluster 2)

Without capacity-dmips-mhz the Energy Aware Scheduler treats all 18
cores as equal, leading to suboptimal task placement and frequency
selection. In particular, heavy tasks may be pinned to cluster 0  driving
them to maximum frequency/voltage while cluster 1/2 sit idle.

Fix this by using distinct capacity-dmips-mhz numbers.
Values are derived from DPC (DMIPS-per-clock) measurements at the
825.6 MHz nominal operating point:

oryon-2-2: 1024  (normalised baseline)
oryon-2-1: 1372  (ratio ~1.34x vs oryon-2-2)

Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..1b5b2ed93767 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -39,6 +39,7 @@ cpu0: cpu@0 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -56,6 +57,7 @@ cpu1: cpu@100 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd1>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -67,6 +69,7 @@ cpu2: cpu@200 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd2>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -78,6 +81,7 @@ cpu3: cpu@300 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd3>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -89,6 +93,7 @@ cpu4: cpu@400 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd4>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -100,6 +105,7 @@ cpu5: cpu@500 {
 			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			power-domains = <&cpu_pd5>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
@@ -111,6 +117,7 @@ cpu6: cpu@10000 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -128,6 +135,7 @@ cpu7: cpu@10100 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd7>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -139,6 +147,7 @@ cpu8: cpu@10200 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd8>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -150,6 +159,7 @@ cpu9: cpu@10300 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd9>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -161,6 +171,7 @@ cpu10: cpu@10400 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd10>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -172,6 +183,7 @@ cpu11: cpu@10500 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd11>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_1>;
@@ -183,6 +195,7 @@ cpu12: cpu@20000 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd12>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -200,6 +213,7 @@ cpu13: cpu@20100 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd13>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -211,6 +225,7 @@ cpu14: cpu@20200 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd14>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -222,6 +237,7 @@ cpu15: cpu@20300 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd15>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -233,6 +249,7 @@ cpu16: cpu@20400 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20400>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd16>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;
@@ -244,6 +261,7 @@ cpu17: cpu@20500 {
 			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20500>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1372>;
 			power-domains = <&cpu_pd17>, <&scmi_perf 2>;
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_2>;

---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260703-add-cpu-capacity-dmips-mhz-2095d25c411e

Best regards,
-- 
Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>

