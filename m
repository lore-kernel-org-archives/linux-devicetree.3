Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380FF43E4BA
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938304; cv=none; b=RVPYD6RwKf3NdZ/o4jRpkdOvstECpP8DqX5wZYULYHF6RFXuNiqbGS73BQcX1nD97bDkqkTyLO8jkn0KZsXUSkeuPf8DVQjXgHmrIGZgcA68lyWYgA2tNRkvax9dhndnlKtsLbh8OEz9Ly2oaDuY/yQou1cPwfqwKEuWN/P5tDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938304; c=relaxed/simple;
	bh=Z9pXeXRK71lbmOtAqQ6lI9hOJ2OhWhwmA6Q0ecc3L8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFmM9BIjHVXov6DiUKkVtusJpiYz1+TySqbui5JejIr2iUfPmGo0/o2+oNBX1pQRA5Hrs6mT1SD6XcOSALHcqV1Ma73JxEb/AWR5oH+PfnAhtJtSyaBAIuxBCMlxrj8u77ZXsaUikES7z4KubKODuCLS1HVhvjM5ci9o5jbL4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpA1Wb/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWKl1pdZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpA1Wb/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWKl1pdZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896WJHY1274428
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 07:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZ/X1RA6sssm3uzMAF4vcjz8LNFaNNi8btc44J6t3b4=; b=FpA1Wb/ibUsm0md3
	SrvGuKkU+Ji+5/pPVw0TwVI2e8M/uwWYiKKO45zz/5ZdY7k91fLNCCsv6aH2Scyn
	0YH7tMVp62/EguJrkm0wTayM2aU7S2/93BqCo+Iu8e7RXPiY1DM1QBUMhZ1iI6bz
	LmFvGElfO81WiLMaHZJ4PtNA7r5WKpXf60Xe8yRF8AL2dFwiIzH1wrbV/L/OzeTf
	+uabgx35qyXWP0oLQLJFQDmFD/fuYDbu6h0Y0Aluo/mPLsxsu+2Pm8GxL8kh8YGV
	3rEZqVqhaMVafnIqUwPPQueBbJzK7G+TvBAetvn6aza2LV13jFEWQXSTD1d6Rkjq
	DZLEig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw2ubm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:18:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fed0652bso67037715ad.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938302; x=1789543102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZ/X1RA6sssm3uzMAF4vcjz8LNFaNNi8btc44J6t3b4=;
        b=YWKl1pdZOsDQuTDW/lt/iMS/l+5HE+SNDf9M2Gefvgl9i1bjw9t3csQA3FgVAs1XC3
         dudILUbdbvT43E7OyE46GYse+LoybnfcGEZQzykR4fUGbrfEw6KC834rEl68aqyUsQHb
         6LgWh9wjzzGNAmI/epYOH3TQdPTrTpBPABgbR9dQzGjoFlHejkPLSjAQBDdvQ/1AZVTe
         g8P3/QpPL0FnGYnHu9i8YkopLzirZFb929l3TFoFTZiD/TIWalhzxsulnagckKnC1eaw
         9md3I9y6RX4puHYDsrclL5928c6DUNdQ5Eoed2IIXTpUDlTgtSRn21Z6hWJbKYJnPmZ/
         TtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938302; x=1789543102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZ/X1RA6sssm3uzMAF4vcjz8LNFaNNi8btc44J6t3b4=;
        b=VmFgOzB6NG5fGjnKgx5T+Rg9+a7ags7Y1Y/khqwqwWff8tbqyQEeQa/RCVrMPzoF3o
         OJB/1EAzBQrNCYxIiVDNMl/lxET5jhZa9i1GWKsVzPulx+mWu/hju4xRQIWytgS3TWAh
         oQoYqGrPTViRviHSacIu+jT2v9jSJCsQwJZUyn241+XayMGEHN9paWQJbEWrS6WUxpmh
         Jt2Qg0WhxaeMJYNHVXnYrg9Z+675JG6IUUVq6uq3rtP837S1WZ3Z6ZJpZLVWnR9qEyX/
         NCtP2RazK3czXrqWTQOId3tFGkLfWuYKqtQvs8/p/yOwizag9/RFjYEGPrpkocirMYfC
         vbrA==
X-Forwarded-Encrypted: i=1; AKwUvBwFear7942PFsNaCp3c/HQXxJXJaWhh9cZQm48DeSKHa3qdIwwG0RdKD2+b2teTI8ESMpQtbN7BwhN+@vger.kernel.org
X-Gm-Message-State: AFuF++mz9gCudxYVZcPBg/X4VRZ01t2axmcfOuMZzJkKwqU1moDJS7GE
	PBKXFDumjBMYZ5twixrXqeEoCxQhU/sF9n8XUUcQk9nvWWR0+VJHjkirwQJrAttlhZ+cl9i422Y
	OaMbB/eNef0TH42JsjKQDJRjw0SISvQy5bM3hYvWrRqigazZH7+bVeAJetq0BskFG
X-Gm-Gg: AYBFou3E+6COBl6dT+6myoAPhDTBMQyv+s9dJFiHtMSwISJ6k+NIYfWSlf6YKg75Djw
	1kAGqOJPdpcoraayfx6FbnaCKJUKpva3hvPEyhkoi3qrimyA7zhk/uA0NTXSvtEo6VfwoevR6P5
	/h/rdNx1nZZxQxz0vEeKi51jgvXZzFltD/sk/47CQFzHvrBDSczrFXqWmRd2q7sziBWQUon7ayu
	6V0h0C7nj16+bpRRlxfhLatMl0RbRtskyQy3GRqS05TM8Z350jv02S7NjM/kiSRZbMPPO2mfQS9
	/h7/p09hw9sOEHB6/MSa1WbXU1SMAJPNG5QxfbX9MXezshAdcf3aFUefnWlcybobUKLGYULabFT
	Wof2tcvVNUXzIARLzENxrmqjzixZBhLCVdzLMI1GLu273P24GH2jix+qi9qeRy8aA
X-Received: by 2002:a17:903:4b4b:b0:2db:2376:6e8a with SMTP id d9443c01a7336-2db2376762bmr405414615ad.9.1788938301547;
        Wed, 09 Sep 2026 00:18:21 -0700 (PDT)
X-Received: by 2002:a17:903:4b4b:b0:2db:2376:6e8a with SMTP id d9443c01a7336-2db2376762bmr405414085ad.9.1788938301004;
        Wed, 09 Sep 2026 00:18:21 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:20 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:15 -0700
Subject: [PATCH v7 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-2-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=4607;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Z9pXeXRK71lbmOtAqQ6lI9hOJ2OhWhwmA6Q0ecc3L8A=;
 b=fLo6KY8dDde41V/VCEH3FRDzBUD/ORTzGkyvWmQyfRd7sBhX9JPvkBuPf3sD7GBhDXPAE2ffV
 53m5Z1P66PrAYzIRAKP9x8oNZeBubaSy3qIJ1XphuLabkavYEN51wjT
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: CteS_D2zLJQ7bETgtLiN-CnbtRnWnpkA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX8n8LOaK/hZDd
 E+oYd6rHCwC0+paCsaT1E1m2XusgH3jl9ucwp9ql3S8ABAPNix+pJa7YnJmI7l05L5Qk/+BcK/f
 s3beLspB5norjf6Hl4MIHGIkRKNm4Hc=
X-Proofpoint-GUID: CteS_D2zLJQ7bETgtLiN-CnbtRnWnpkA
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa1083e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uk4ur7h3pE5DHNqPdj0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX3Q1E+ejYNdD7
 jVdnPNeGp09Uku2gZBl1Jmb6IZ/F8RvjSJkjG0IzLvlqgFBXIYUb02NW7r6S+EYWBi7PHLuj0zM
 8Bi02cJPkBRj3XL/JAHoyaAwrgo0NTpaDfYfdjOkkGfkgGeO8MWOfOtoLEn5Ff/0Svq6T/y6laj
 nEQmBui8weJmyJgesaCwMT5OvB17uy5UPP/FiEWavOPxFP1s9OEgx2rcTouP1eYz0sGsJzeS9pz
 nbr/Oj53xIQj5iQcP1eyNR5lzjpfjodGVsE/OBdcoSfZ2IbsqhesQSZdozuF51tp8J5/7MmymRs
 3o3IksudL3r7jQg/UukjMneZ6HRneyXXeaqy0/1Y2vsQwlpteGXTSbwoBB+KXroeL20EhrDtqnJ
 q1SPe/3irfbIRdqo/X3rET1VOALxnzjVUhh2RW6k+CPUNgQhdfF/5GOjsEbk4IUBPHhvnmD5Wx1
 Z1Eha4JRGCogTA7nR3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090081

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1
(cpu6-cpu11). The surviving cluster is re-added in the cpu-map as
cluster0, since the kernel stops scanning at the first missing clusterN
index. cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain
1 is no longer present.

Kalambo uses PDP1 for SCMI transport. The tx shmem (lpri1) sits at
offset 0x200 within imem, pushing the tx region end to 0x380, so the
imem size is overridden accordingly. The rx shmem (lpri0) remains at
offset 0x0. The PDP mailbox registers are overridden to match the
Kalambo SCP firmware.

Kalambo's PDC input mux differs from Glymur. Pins 109 and 110 carry
tsens6 and tsens7 alarms, which are absent on Kalambo, and pins 134,
138, 156, 158, 172, 181 and 202 carry gp_irq_hvm inputs with nothing
wired to them instead of wakeup GPIOs. Override the PDC ranges to
leave those pins unmapped.

Add labels to the cpus and cpu-map nodes in glymur.dtsi to allow derived
SoCs to delete and redefine the cpu-map entirely.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |   4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 119 ++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 624a9edd602c..682c6f3d5769 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -36,7 +36,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
@@ -274,7 +274,7 @@ cpu17: cpu@20500 {
 			#cooling-cells = <2>;
 		};
 
-		cpu-map {
+		cpu_map: cpu-map {
 			cluster0 {
 				core0 {
 					cpu = <&cpu0>;
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
new file mode 100644
index 000000000000..8e2077d9d0a8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "mahua.dtsi"
+
+/delete-node/ &cluster0_pd;
+/delete-node/ &cpu_map;
+/delete-node/ &cpu0;
+/delete-node/ &cpu1;
+/delete-node/ &cpu2;
+/delete-node/ &cpu3;
+/delete-node/ &cpu4;
+/delete-node/ &cpu5;
+/delete-node/ &cpu_pd0;
+/delete-node/ &cpu_pd1;
+/delete-node/ &cpu_pd2;
+/delete-node/ &cpu_pd3;
+/delete-node/ &cpu_pd4;
+/delete-node/ &cpu_pd5;
+/delete-node/ &cpu_scp_lpri1;
+
+&cpu6 {
+	power-domains = <&cpu_pd6>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu7 {
+	power-domains = <&cpu_pd7>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu8 {
+	power-domains = <&cpu_pd8>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu9 {
+	power-domains = <&cpu_pd9>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu10 {
+	power-domains = <&cpu_pd10>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu11 {
+	power-domains = <&cpu_pd11>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpus {
+	cpu-map {
+		cluster0 {
+			core0 {
+				cpu = <&cpu6>;
+			};
+
+			core1 {
+				cpu = <&cpu7>;
+			};
+
+			core2 {
+				cpu = <&cpu8>;
+			};
+
+			core3 {
+				cpu = <&cpu9>;
+			};
+
+			core4 {
+				cpu = <&cpu10>;
+			};
+
+			core5 {
+				cpu = <&cpu11>;
+			};
+		};
+	};
+};
+
+&imem {
+	reg = <0x0 0x81e08600 0x0 0x380>;
+	ranges = <0x0 0x0 0x81e08600 0x380>;
+
+	cpu_scp_lpri1: scp-sram-section@200 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x200 0x180>;
+	};
+};
+
+&pdc {
+	qcom,pdc-ranges = <0 745 38>,
+			  <40 785 11>,
+			  <51 527 4>,
+			  <57 533 10>,
+			  <70 546 4>,
+			  <75 551 18>,
+			  <108 619 1>,
+			  <111 622 19>,
+			  <130 717 4>,
+			  <135 722 3>,
+			  <139 726 3>,
+			  <142 251 5>,
+			  <147 796 9>,
+			  <157 806 1>,
+			  <159 808 4>,
+			  <171 4104 1>,
+			  <173 4106 8>,
+			  <182 4115 20>,
+			  <203 4136 4>;
+};
+
+&pdp0_mbox {
+	reg = <0x0 0x17610000 0x0 0x8000>,
+	      <0x0 0x1a980000 0x0 0x8000>;
+};

-- 
2.34.1

