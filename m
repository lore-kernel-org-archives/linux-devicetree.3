Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF8E3672AA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478496; cv=none; b=BH7MHUcNy1XlPWzH9tR9QGBmCrEPwPaAdk6/vQ37r/ubQRtj/WKSP0x+qZPzUQF/4dCRTeh6Sk8I0NYngJ7x9EGVvMLauBNpJWO2binA7INucQN43bBvr/EkaM1tBz5puGJ8DKYXnydECHLswy0ooLLG57LJ0nr3XLlUVSRILh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478496; c=relaxed/simple;
	bh=NkU3dFvQLNuVr0IO6l1ErGb6cSn9Tsn8pb/Xe/a6SHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7z0SBRci4//RyrsWExGLvWvS38POhD/9XcCLvR2goE7Q5HH5MWi3ZYVRS45MTDY6w71GUDaebw4EJUcnXo+bMF51WdGWv4DgACTIKF/PP1BC0jMRmLR5xbVgsrKxQA0fkEubi5kNu1WbWjAdr7rWF5w1fBUC2NmxyV1YfhjMgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8441yUZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5aRSbID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8441yUZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5aRSbID"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67ENH2960542
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Qg4B4kRpc3PdcTpbqk6OqYURbQCiNDEzYTh3Ho14v4=; b=l8441yUZHxUNXRgA
	sFmG6LIFea8E8u4M58JuaORVZ9SSk/01eEVRURjQ9Te2ubqoVut54+xIYGED3S3R
	JCsndjtzIR3VRffwCUhKdw98eZ65XSwerHXCg6ORnkt3kuSyr5QhsbysXJObC6TU
	Wf3Za3wGCGUmDaEcvfc6f9eFfsy/jI8UaVFgY88IBhS6CeVItWXi00HEfTSSC0lf
	oyrV5VYDhCmTrmmzU3cIlZfYaKZ8/MQ3yrGqq0kxMkN1xDEnY3yAHgWN/xgtG9oa
	R05WGW1wkMSFA6pX+55gwd6wGMCjvpKjZoMue6ziKE0Jxl7DK5CnZey77x5HkKxh
	t7ocXw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5kg0p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1187686a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478493; x=1786083293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Qg4B4kRpc3PdcTpbqk6OqYURbQCiNDEzYTh3Ho14v4=;
        b=g5aRSbIDD9Hc+W4a1eejkcV2iFK9flPOJHjjKweONO/mGPvOzAKbsNQ3zG8jLMnt3F
         kclLLtdl6f5fYddTNVxgtn4ohzP4hVUybpb8X1M/yBUUGcmb45N0v9utYbnw0/9sGvj+
         he0ha9XqNs/793p7jZesrHOOLpHQsjG9c5NAXDParPt70DFXqnvU1TzouPwRb7WKZHoJ
         WM5Hrh1UAStCO68PcPgE1nx5fDUsJ+iCAA6mKXDZRnyOebOPvXjOVvKl5+99tZoDhjAU
         Si3r3f7HnCqbAzcKlLXrGpk2PzjDoWz6tyGdqkGLc3/oNSJck6yUP6vO19y/1iuAqlUf
         Z2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478493; x=1786083293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Qg4B4kRpc3PdcTpbqk6OqYURbQCiNDEzYTh3Ho14v4=;
        b=F0VehTC0f8qOZ78Juolc58/uNcbLEpmZvT8AzVP7wOSKpRgZv7N3uBJLefwudiO4+x
         pcvxVWIi6Y1owsff2WG1mSZ2Zw20j6N9hQds3Zi6u2cVvTfOXGWehMOehmwlerCdp7cm
         CbyXqJL2EZffSTnhOgLdspM0cfF6okb7+7Rnjj5QJuvoa4u5fX1tDsm6UUukDYn4iPTT
         uak022S5bSjxRidescxSXL6B/8fwHWxYQrlczTS6piB/1fLgtVff4h/UqEE+Yr988SG6
         YEv2Yn4U7NW9GKWiuGX62J5AtKTN8J1VtkcUcUh50iamznHwrYPmjz9toFmaBt59HJjw
         a3lQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqt0bMWsDh4a145giJmZJRkpraUFvJnf/3RSZX8FXTAOuRw2TmEj52Gm6w4R3MZTndwq0pFatXgyukc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+MRMoTZskaVkn6ybdhD+wYy8ZcOwMXIzErcKStIZSnm/Ekp4l
	7vgrDxghobz/tP4QIzx/Y8Pkdl+uZqUhUDHx121ygrW97djiH2YFipiPxaEk01g2/PMPC3LrYur
	ThUxRwyqlN6hpqXx38f/kHFSOPvxsKKnsCieo2CJVpPsCOQUclk6u4Ld8cK+wW1HRyPDkDDbMhV
	A=
X-Gm-Gg: AR+sD11mgth9TXuZlFVEZoWd57L37KQXngLgKwchc1GkwQnRg5/dtAVvavb3//T9HyK
	g44RbPc7s68V20IQr/5hAuuudd25lGxDK0gnfKQ9QVUpkG7URT8SdedBiN4Op3SlSXe+a4JdRAF
	BHAzbrFnyrAfEbcAyKmL0vhrLNlGudCbGXY+gP/+Kj1qbopUwY9pxqntTvOxka+FRCMH3QIJGjl
	+iB967rCWtWBnz2d31SxK24rtm4gKlDkc2EeJyo9YcaDevdhGFUixkeVS74PACLhmfp7H70CG/A
	ztnyLIz3+xZwOA5pqnjFmvDSqadhTuPzemToW5ZJlSTEi6xiD0NZVYEGVV1r9XoHVi0YKA0XcoH
	BlmSxs+Z6XrgQfRxIOWtnYaDv5zPxw+12TUmakbY4RDk1BKO9f5vF9k11ZhOGsar3
X-Received: by 2002:a17:903:1448:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2d047e395e6mr5992575ad.15.1785478493180;
        Thu, 30 Jul 2026 23:14:53 -0700 (PDT)
X-Received: by 2002:a17:903:1448:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2d047e395e6mr5992365ad.15.1785478492749;
        Thu, 30 Jul 2026 23:14:52 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:52 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:38 -0700
Subject: [PATCH v4 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-2-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=4284;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=NkU3dFvQLNuVr0IO6l1ErGb6cSn9Tsn8pb/Xe/a6SHA=;
 b=wbmwo6Ii8Ofp0ydWufnhJs3SKIzU+S++IHsHEaUEQ8/xn8D8XhPGw46eKH+6g7c3nS/uqL4Y5
 ZSNFGg/hBvKBHt2f19AXB2/d0GZt7J6hct4StYCuKYYlByssi7NYOU7
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX53hrt5qo7RPg
 vxFmXn3wCRyfWnK3HIFy5V5VXkv9ktCbhA7W1vbDHeedMvuWS0/OL4H7WnXKI1mQH880ODYf9MM
 gvuzJjILbMG15zG34hTOwgb7BIiKvHw=
X-Proofpoint-GUID: nxWOXd4qjSO7_ZUAUftMdinxxR_liMZq
X-Proofpoint-ORIG-GUID: nxWOXd4qjSO7_ZUAUftMdinxxR_liMZq
X-Authority-Analysis: v=2.4 cv=c/Obhx9l c=1 sm=1 tr=0 ts=6a6c3d5d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0meGOa8vbbZiQTQppSIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfXwL1cMXnIwI3t
 mx/2f/2HLUXpb8oAc3abjAuF1higxbghibgbV3s7nvzzF9JLlqRed/9PZmxSan8mA8HWlkepCUj
 j8ArsYKtxb67REj7ibTRro+2U7exQ7XxXkFlnMBEV5V5QNB4gEdgfonzRjqG7XaGCrVtlwTZmb3
 C2yy3/CR8MlUdVVSLKD87uIdkAEYPDHqEnnnVShyzzeSGZ/C2BefXxSr1tRhCuZ69+hvg1ZHE59
 U7R8M6m744pzawujQOgSpGxWlIi4LVAzX0pIkLc+if3/L3a6cNwHlR8FNhniSUhUTIRHVSUEJl0
 /H0di3T38ONoeUqGoZQIlI6u+0WDuyJzszUpTqDpDqR+E4EzhRPu7yDFBYSRNMzRad9eZcYqRl+
 5MI/NPnzvInpdcYZnaWoqE1fa2AKW6UUJ6N0iYPHSrW2Dc2DqNBd0NQjKDqq9kmvDfT2VDhu9LH
 /WpxmNU4LGO2GZw69BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310040

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).

The surviving cluster is re-added to the cpu-map as cluster0, since the
kernel stops scanning at the first missing clusterN index. cpu6-cpu11
are reassigned to SCMI performance domain 0, as domain 1 is no longer
present.

Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
0x380, requiring an imem size override. The rx shmem (lpri0) stays at
offset 0x0. The PDP mailbox addresses are overridden to match the
Kalambo SCP firmware.

PDC pins 109 and 110 carry the tsens6 and tsens7 upper/lower interrupts,
which are unconnected on Kalambo since both sensors are absent. Split the
range starting at pin 108 to skip them.

Add labels to the cpus and cpu-map nodes in Glymur to allow derived
SoCs to delete and redefine the cpu-map entirely.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |   4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 112 ++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 4be7edf894b5..3f1fd0973717 100644
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
index 000000000000..fb5d68bd69d7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,112 @@
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
+			  <130 717 12>,
+			  <142 251 5>,
+			  <147 796 16>,
+			  <171 4104 36>;
+};
+
+&pdp0_mbox {
+	reg = <0x0 0x17610000 0x0 0x8000>,
+	      <0x0 0x1a980000 0x0 0x8000>;
+};

-- 
2.34.1

