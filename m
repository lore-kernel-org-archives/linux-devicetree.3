Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6604635DA52
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778228860; cv=none; b=t2EuXrUiaLwQlMyFlJsoqfirQVR59XvwPQhGzx18Tgpx5/Ph25RXzE69xvDMEKQArnnnUCQw32sLQ3i/huwXpoaJW7TRKWwQsYxU6WEA2X3bKJdsWnh1+W3JegG9K8sBU9OPvrlxZv7fw2jq4qxcYxEqzX8sRGMdEay2wgSVJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778228860; c=relaxed/simple;
	bh=NSvDLxi0/3uXdnWaRxcc/CcSxlXav4CW6qth+u36GdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RvAMuQXXaYTC+nqwSMD5mVGEX+zJM1aYAOYKwiaYugw3Px6+yVe9RE+nso2N3vw6tPY1D8yhb9yABqLps05dSW051Qjc0Emg68Bvuzjz898PEjtYJmiWC091fdcsvFWgTl8uUkNGd3lxFWDVHpadDglJKfpSj5MoLAKRnHULGeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQB7sXWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vrgqz/Ht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQB7sXWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vrgqz/Ht"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64855fqM2531224
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/10x8S0sWxZlzaPtsZ0PZjdBwBbbSaV/diC
	7aAKr1fs=; b=iQB7sXWgn4fqnyv9bRw+jytBXujUazKgCrXGatkPIQ4puotfM4f
	mU4sPPxbfV+w7XJak3OJykrhDWLzRTJy1iPqwh1yzjdaJjPa3SSSqr7tVArLeXWL
	xBbTdfNWDZhtxsrIbqGCTXFFRXBV1ONC+klLMnfZlCP6/l2q15F079ZfgZbjOwtK
	dcb61BH96z6aryg7gY15mY5TDp3ovtWfaSLJI2zJBKkPnYzAgQ8KmGXe0FZ7+9ic
	gwYehKSNgoptDu+FiGkjE8Dr47l75VeMwkPAE7pw9aLrvb1sbVdY63+rwAvBO/bx
	lQgfTphC08jkwBKbPYgqmQ9L4mH6K59FICA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9tfqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:27:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so2347417a91.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778228857; x=1778833657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/10x8S0sWxZlzaPtsZ0PZjdBwBbbSaV/diC7aAKr1fs=;
        b=Vrgqz/HtKsGvGHaKkNanb3WRvkfqfjQR7KsuTXyuejrygAs9deyFf5aEWpaLb9AWAH
         VprcqqtFRJzKryoLjH7AuAojGp/9eujpVMRuHLLwVPGbWNOKPT9jVR7Sw1B54Uw3ZZ13
         URSs27uQcGmP4ZuahnMTxO1GW1Td8j9LqBMXbi7bHi3OOCpPX9zN4MOt/QWfeC36yjXc
         ST9ePtQVXdAv4AdGXwW6A5iBVyGsVtDVAHgTzIEGqH/TSW9tGJbyj5xcaw4hzG1b8ZML
         DbJKh+/EV5IvI3prl5WnT1flTpVysfpybASOTkvA5dglOJ5MJEZ0j9vfAQgv/UQmBklD
         1DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228857; x=1778833657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/10x8S0sWxZlzaPtsZ0PZjdBwBbbSaV/diC7aAKr1fs=;
        b=ESeN4Y2fUCkKLOQPwTq0E5jiI9Ww15M1h6gVi/6hM+Itt0vhVmSjw4/sUC0pbiWk3R
         LsFFQ296U//w8Fy43Ua3Q0XZgbXzVIhtwqiqvYXusj1ZvBCGNIF2VT9AXfnv5T2NETXK
         eozNWqDhtYquxuKQhvnkeeuoVavLcVEBi/ETfnhVuEGga/W+3cllinNnoPEtpW83kYuG
         DACLBsVa4tKiJ5Pdbu6jSAu8050iUG9N5wlo//iKNlQBUzBDgyZIOehwpnRSRyr40aIv
         sX+TAouuchgIKEwf+UxHf7wHEeUu3ahSdI/omlJtsC66fvznQBGLEBNBAgcMq22lUMUE
         Hs6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+YvMk7eV0/v+V4jrQC3DpbHj4V8q4zXM3RcGo958kOLi1lD1vEVFASL505GFMdJ4swta7a+2PLQTGA@vger.kernel.org
X-Gm-Message-State: AOJu0YwETo3PlTEVHKOHucXURT2h1m7ZDs8+2uGWK8S3C3JyyS2xVUqX
	W6ICms1kHkISoej/0/DtzFkD6eGYOkvUseEYgWr5YuXepwTSFsk/SOPhE+Z3SvCbch2vvAosB5w
	S31uYf47/xVDv/8uQpI3mUGDINYIHGFJ+f+vSsJnk5Cec/PxPRm41JYRmqYbDwddS
X-Gm-Gg: Acq92OFJe5Az27XTMd1nmTX3XLX/4yh1ZIkux9Dl9eKA3AFHPBpujjwHqLJz2pWkWvm
	etMUjMXOKr3FxH4QGBdLRr6VTb6YpNFTFvKZYWCIXdQk8yYCSX/zioXVpGTxuV0LKI/4VLH32Qm
	f74mZ4M87UaB0a0ZiCKDsvXYnD5Qr+qrczJ53QhoI8gIGgHkcM47hw3wPaKztM27W3rjMOyXlwm
	PlDdm2ijJY6D8ycCp8DFcdcqp9dEN88UlcGuYSlFQOQ5Vju1FKZTk3pBk5vZXDMxc8xOEbwjxAd
	turq2iXq1kNuN6U3yGsMeRigSfEkVYFGqQy28CLQfnRNGx7kjlcGl4nEqRMJuD6iFrik+iWnMGW
	0Vhjakqm8ctrdVqS0T+EdYhOtfCKTFs0uKFU0NYdaQ3O+FOsIzTzZhPr7dzg=
X-Received: by 2002:a17:90b:1647:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-3662e1f05b5mr4634256a91.21.1778228856772;
        Fri, 08 May 2026 01:27:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1647:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-3662e1f05b5mr4634217a91.21.1778228856186;
        Fri, 08 May 2026 01:27:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-366490451e1sm794731a91.3.2026.05.08.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:27:35 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: kaanapali: Switch SCMI perf protocol to use power-domain-cells
Date: Fri,  8 May 2026 13:57:28 +0530
Message-ID: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Vy8iFkDpPMpaHWjAnpbjZpKA75GIbMgB
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd9e79 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=MeJGL77r1mcfaQ0cQWQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NSBTYWx0ZWRfX2be5VwDYQXLc
 4i9QoPsxVma4O5xlicfnPZ+3yjvd1eHlNKiqC9FW9m++NhQmOELeqJ56xii0+KPHU8pxbrJ3FsP
 wDoROu6ZXNgHs1X3VfWvkfyfI/d5dok39jh23fFB7QtzQMtqvb6vMQg1UZeV7HfLAtEGoUN1GNl
 ImdsexQ3by/CYxDRtDtDV3a//gUJj0J3B5wiVdTYYs2FFJnVe+bZFcboR46XE/UJiWZNPN8muzi
 xs3aotqn2GRFEw2NzthCmZFxEmpMABR7jw0rGkZyxCgwAy4XovzfpkX+qho6ZfpQ3plPKJZrPB8
 WVpEMJATbWs+KlZYMay2NRz66jJmGphgRyw55daiKKq/nlIeIBKYQlNAeCDt6q2rVikqz9jzuci
 /959o71RJaS4sTxYEyIjidCy+i5MMEozI42kN4KZHi94V+RMtAZAJlIH8IhARit9JbzKsD1w61I
 jgvx4JNKuoItc8eV1/g==
X-Proofpoint-ORIG-GUID: Vy8iFkDpPMpaHWjAnpbjZpKA75GIbMgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080085

The SCMI protocol@13 (Performance Domain Management) node was using
performance/power domain, not a clock. This was using the older
mechanism for passing the SCMI performance domain index to
scmi-cpufreq, which predates the #power-domain-cells support added
in commit 92b2028b00ff ("cpufreq: scmi: Add support to parse
domain-id using #power-domain-cells").

Switch to #power-domain-cells to match all other Qualcomm platforms
(sm8750, glymur, hamoa) and align with the semantically correct
representation.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 44 ++++++++++---------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..dab1ca696741 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -45,9 +45,8 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd0>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -62,9 +61,8 @@ cpu1: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd1>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd1>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu2: cpu@200 {
@@ -73,9 +71,8 @@ cpu2: cpu@200 {
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd2>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd2>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu3: cpu@300 {
@@ -84,9 +81,8 @@ cpu3: cpu@300 {
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd3>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd3>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu4: cpu@400 {
@@ -95,9 +91,8 @@ cpu4: cpu@400 {
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd4>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd4>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu5: cpu@500 {
@@ -106,9 +101,8 @@ cpu5: cpu@500 {
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
-			power-domains = <&cpu_pd5>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 0>;
+			power-domains = <&cpu_pd5>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu6: cpu@10000 {
@@ -117,9 +111,8 @@ cpu6: cpu@10000 {
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd6>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 1>;
+			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -134,9 +127,8 @@ cpu7: cpu@10100 {
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
 			next-level-cache = <&l2_1>;
-			power-domains = <&cpu_pd7>;
-			power-domain-names = "psci";
-			clocks = <&pdp_scmi_perf 1>;
+			power-domains = <&cpu_pd7>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 		};
 
 		cpu-map {
@@ -235,9 +227,9 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pdp_scmi_perf: protocol@13 {
+			scmi_perf: protocol@13 {
 				reg = <0x13>;
-				#clock-cells = <1>;
+				#power-domain-cells = <1>;
 			};
 		};
 	};
-- 
2.53.0

