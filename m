Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F309472F6B
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717763; cv=none; b=Ow8i/xdBhHZTwHhzC02aF9yCylXt0yRA5ZLoxU5GGRIQxCSeG+j2GQw8mUnxfzU96207A5aOlyRWkU/TcdaCL2KXMXdpKl0lk1bQtiKZIeEeoKVRkwyXvegFm2pTXSgMwZBRyo1jFlNTSR85uq5fd+C/bmCfzlmHqLBUadM5Zis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717763; c=relaxed/simple;
	bh=oGVPCkxl9vtlPpJ9nrBXAhqLyAQGRDgwwEBN+5bFsh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qY4AnhBbEMleGspsMWzHFabyI+gLJvvKH/eIylWhFVoYa+B4usN+enTCmWk9sUo8o31ykIGIUdyu8Zxiwgn2J/dPSeAFgll9xeNZEC+TPiLYR3x8V8eRNd8aT7CtgeZUZKjIShwHvPU8Mn4MzfDWM1Y7XFuB0O7gR56sCafmWV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtcCwkEq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpnGod72; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtcCwkEq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpnGod72"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xdDw123835
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVXRrvMrnsE0QWAM738Jqd7lT5yvQOg5okQQOTYnqBQ=; b=gtcCwkEqKIIl7fDd
	nsMtdiErg/Pxs0nWj4gjaZPsxngSiUIBQYXts5Ohq0MShOf4UJyKWFaSSoWZQvxh
	45aSuj9fBXwJwCJkoPDfC5HSWweb8Husm5n3vIFpY15BcqmgKgxizF9A7UfZFNcn
	GCAKsZ98qoMOe3g/U9dOT7pYNc7F2OY2CtWOLKQunL/BW7fa2BCCthdOnRH0jZ3e
	4+HjmAmkh7qsvjXLP+2CHX6JWME0zm81D6KTE0qRbQ5/aOFuIXCAdxoHV4VZ6OVS
	gDDHtRUx2txkjLohB6xAodfDrh+JJLLt8QinbG+1zt2gcL6bs2s8rpi5tX/xVqo4
	NpKQjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4sqra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so4940485a91.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717760; x=1785322560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVXRrvMrnsE0QWAM738Jqd7lT5yvQOg5okQQOTYnqBQ=;
        b=TpnGod72CL5bAxx0wcwrlSxgyIiQICxSRQU1rVSlVvDV3TV1AhVorAtYZqRXLwWGc9
         8zjXZUW2JKqHQYCR/rb8spZ2zpAZnm3MtogAxE0an2cOAZx7GvBBelIIce2i/aTOeRoh
         5jX4BKaKfJ4QRFiayH9QMI3MKbTSStoqB7IZoTdN/qKxWqddBllyVSXMIk55+6ubMmoL
         mqWXrogj0keYCp9cjW2qClk4nrhNHCI4MQbr2TkVH0t1SUAJ4ps9jX2i10ISSXZ33xCi
         cVgK3AZFYNDobsnE+jZS6NXYcv4BVp21PVAtQpZ/wmDurEGFKyXgrANeGliAFUbGv4Ao
         hooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717760; x=1785322560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVXRrvMrnsE0QWAM738Jqd7lT5yvQOg5okQQOTYnqBQ=;
        b=P1wjhB7+X81i/jr81neFtxUicCuksO0jP5IiGahqB3T76Ocm3MqwLVLsoU5J4bgUAJ
         jS488I2z4u8H484CJ0VOLUUdY2Lh4u5bH3i0J1oVlvXZKI8nEv72LCTE3oZru/+UDFjA
         KWJaWXQ7YBUDL7ngCj8ovHFoBbOfvDCFXTdiWQ7RqHE5T5D7hSA6za7680Gm7TpDFCjU
         aLeZsmrzVpIjAjwZGoDjg9LzoNoerguxvzXXPT6eZPmCylTPjICc1SvaUnHCtpXt/spS
         n2pfM9OgvUBoYgBNNgVrV8lLdfLj+JEyDBJkD4heZXMWAdoQVSYY17RSBqTA2mPSOm0o
         Q4Jw==
X-Forwarded-Encrypted: i=1; AHgh+Rplu6Tct/k3O1Fai5Qr4JyQZsoRAJ1E77WXLw43f6TD8DX7RWBJgBjZx5q/9SdRTaZo+tTaEZKdoXbo@vger.kernel.org
X-Gm-Message-State: AOJu0YxpExH6cekYppyIHPztOsQGEJcPmGvhIinSwHw3jncdEyWvtVLg
	sDcKUC1z+vMcpFAP4GOb4Snc1rAsADoMob7gnm0ax+/1KBODWKSJ3xcLgK1JQIhCj17gdbzgpAn
	UkDCAzfI3NYrZqnqGcZeRlliKAJgIOJqhlPwphbY4vbq8zKvyvtzJy2hZ/1EN55mH
X-Gm-Gg: AR+sD10syPN3gQUQRn1J5WU53AttyuUwt42KYUZgrPcjBeHZzP2SRlWG/bOyAkXUV2Y
	FKa/2mfZ1BWPe6JjZhPswlNwbPpwIM7y17vN5Ui2fOnv5ridTdsIOD89+w2BrcjD6B6J9k5rJh8
	murOVNU29/YjBrcIr0fx4IUOz5fQ+b1fOSN97TeieyWune0KQ1idpcO0zLupojAB42U//kJtnwF
	vHMxVI/5rBoFn/iVhQRdAetGzcuot5jvjSJofqKreW0MTNb/J3TGCfjIIpLEkAJCmJbcYBO3P/H
	E5f86pVyjr/lOJ9zLyKKrOdUKN7VzxJ9OXUceYLznUlE4PZdYVS47G5ICfge2MGOuM2Y72ITp8p
	DfCHDd39KaD7KTXmdGF53GN7cNIC88gA/mQFRed8+7b4hEG+IaycRSwOFjhdRxCi7
X-Received: by 2002:a17:90b:5543:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-38e4b516841mr21849917a91.26.1784717759725;
        Wed, 22 Jul 2026 03:55:59 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-38e4b516841mr21849884a91.26.1784717759243;
        Wed, 22 Jul 2026 03:55:59 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:55:58 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:55:33 -0700
Subject: [PATCH v2 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-kalambo-crd-v2-2-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=3692;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=oGVPCkxl9vtlPpJ9nrBXAhqLyAQGRDgwwEBN+5bFsh4=;
 b=Np4Gg/mEqS/O2IsKCIMy+tey55nJ4GhzUyAIG3r2dAEw1Tte0PhL+5Lp/Aqik8x2VGeU0vomS
 XeNNMEsXe9LDUTyXcfosv5sLkXp1y/sRxd123M3lpP4IDt91G+/IM88
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: OQteffeZ6XFWmllSCVj-5QJ0QB90_zp1
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60a1c0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8J3Bi6UzLT9V08mYb0EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX7yGXRurPwkJQ
 TiMPMhrQXtxPoeI5583nnlMPHvsdJk4fN5YuN9RNyvdR0XdkGA6h7I24047Nn95yp6NuQrmS19h
 PRLb9mnKLdUgORoqeWFsSfGktYkTcgJ0d9jqYoR/sYNOT8+OR/Atb9Il8bhWuZ6na2+BP3+zrgo
 37WMb3OB4qAVSoRhe0ihfj9ICumZATGJ3Usbw1YaSrals8E8fejmlxiK39MM573zwW+GFPr87tz
 MFGNCSi9fJn8EGG4cksdhnxfex/1wbndCUcf7KkOJuOoNQJDoLjxMjylz1WeqogUQjCiioraYBv
 1Q4hv7tESFc2fCl6LwQELQDnCN63Po4PpNi8ZCLRGqqX6rkw7a2cLp3UsHqnz5LJGGXc+zEOlzu
 WeGCJwVR5/L50LSxzPYI1Cedsyk2fzC/SZEvvY5iF22zdhcKp3hea0fa7StRPqppK/oMDBKghCV
 zSIz4W0for6gY5o+JQA==
X-Proofpoint-ORIG-GUID: OQteffeZ6XFWmllSCVj-5QJ0QB90_zp1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX23wzHK9Wo/p3
 tp8p9yrb3084/FROB/rfdC9YsfjzPYz6YdtcuT/Q5DVgtKYb+T1W1qInGFI0Z381cU2a5ALcG3w
 EtFhTVYpeklA9f75+XTTgh76ZIYei8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220105

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).

 - The surviving cluster is re-added to the cpu-map as cluster0, since the
   kernel's cpu-map cluster scan stops at the first missing "clusterN"
   index.

 - cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain 1
   (the former cluster 0) is no longer present.

 - Point the SCMI transport at the SRAM and mailbox addresses used by
   the Kalambo SCP firmware, which differ from those inherited from
   Glymur.

Add labels to the Glymur cpu-map and its cluster nodes to allow their
removal and override on derived SoCs.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |  6 +--
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 95 +++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..66345be9f0a0 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -274,8 +274,8 @@ cpu17: cpu@20500 {
 			#cooling-cells = <2>;
 		};
 
-		cpu-map {
-			cluster0 {
+		cpu_map: cpu-map {
+			cpu_map_cluster0: cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
@@ -301,7 +301,7 @@ core5 {
 				};
 			};
 
-			cluster1 {
+			cpu_map_cluster1: cluster1 {
 				core0 {
 					cpu = <&cpu6>;
 				};
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
new file mode 100644
index 000000000000..07364a7abd9a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "mahua.dtsi"
+
+/delete-node/ &cluster0_pd;
+/delete-node/ &cpu_map_cluster0;
+/delete-node/ &cpu_map_cluster1;
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
+&cpu_map {
+	cluster0 {
+		core0 {
+			cpu = <&cpu6>;
+		};
+
+		core1 {
+			cpu = <&cpu7>;
+		};
+
+		core2 {
+			cpu = <&cpu8>;
+		};
+
+		core3 {
+			cpu = <&cpu9>;
+		};
+
+		core4 {
+			cpu = <&cpu10>;
+		};
+
+		core5 {
+			cpu = <&cpu11>;
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
+&pdp0_mbox {
+	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
+};

-- 
2.34.1

