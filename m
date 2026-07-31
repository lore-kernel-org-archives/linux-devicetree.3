Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BBA35F16C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477235; cv=none; b=kNC5NgGM3o+UFUvcYpcac4C47y3SeIK4S2AePhvfthT93RcdcX6U8Tu4uzR/tENBynkfbtONPx8PwKt0ASnTCg+sKh58FjmiwkXQ1ruhUIT316ypYuQyuDhs/jGIksfB9SSklxmZVWl6rddlBM4FgNkQYHtlIyIIcu64Wx/2nIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477235; c=relaxed/simple;
	bh=TbWn2omPVPJIUFrb413uT0CtEMn7ALcSOCfFDea8q0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQZxz3rb8Mch/f0eCO2aDy4ecGeAJIeXiS06nV6JajQZ/C3b8d0PrEVOA9QLbUqtyil13qrGmHtxAV6trc4u0w+ygQ562hD5NlRGR4aEPvG1ph4Lbb8eGnYJRik16CsFwYgHcWZocsT38o3zQwwlEI1mAhIN2bbxVXCVgcxlwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYeqRl0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQTFw7QJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYeqRl0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQTFw7QJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5UBIH2878830
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6XBW2VUOMNQTO5Y3M800/LxQKX1APaxx1lbkAE2luv4=; b=aYeqRl0edc5CDyaN
	bYQy48/jHDbsg3yC8Lv3J98el965SUJJjH6nK4BNc/CccvwSdK4QPFCothHjAFDa
	frfFNTbd9Bc72IwmDqT3Ot8QwVcppNsbncmWYxTUTE9laFaakZ1czHH2eNpykMaZ
	r5URikCdqfscqycBn5aXE+TRepAjxyko2fr+EvuYuRWR57TQ4Y+sAZ7nMMykpd4L
	MJj1lzGdiZQYAc7GxgLZgBaNlCgLDIYV1zauePHs9w9pJ0XJDoyzW36yv+uqS+u1
	Ri+RzWSCh8tUvCjgbE1vRrkVWQGBfMGQTlen5qNK2Y7XMzZYSEOlEUDQ4ovwkFYi
	iqAIqw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnm7g2d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:53:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso405411a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477231; x=1786082031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XBW2VUOMNQTO5Y3M800/LxQKX1APaxx1lbkAE2luv4=;
        b=RQTFw7QJvNVjLbYBNQJoIIYHEhkHfgzfLql1Ns0qEpo0F+ddWAfeTk9ZEWemPiLOKK
         A6E7ZStabvEMmLAYkS2KmjUrl1V286n7ROJSFEkNZLBApZ6liaJfnFW9pv3xN5FK308o
         GPZ7MUhGFF3h3zxdXyAZLN9NIzSFF+7B6LYeS40lh/QQjzw/hTZtbDtmRZiXXjUIqDSF
         xTZTdtXC7exTSUCpryxUPgSaEEbGLP6yjnUTyBCKuCRTshYyfXNz2QbTS6bz2oSwXAKF
         qSKLeeWAII4jxRgTciLTnZO3NIBx2agGMr/jwlWhkPf1VXFFN7rxSZo/9dWt6StsuWev
         nxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477231; x=1786082031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XBW2VUOMNQTO5Y3M800/LxQKX1APaxx1lbkAE2luv4=;
        b=foVQUUtJg7RBlJVuXmzRQBA7M/e/oCVHKmyUHM39WzfrZstsXjEgW3p+spZDbtYPzh
         Jfl6mqEmvSDJb4V11I+wtO+bV3eDDvVUqdzRNhrmaMPVXAJc07YCGFC+Z6hw2lZ314CQ
         NSJehqMaw17FFEK71i1jE2Gqp4wvutBVNCGAQzEFD04Q1xGrn4yDR5R9Uej3uZ8RVtgj
         5GFEe0CEQrzddkPP5xwuriFMxj2+hr87g+nGR7ozXXj/YRzO+xpaVjGk3mrhdmdu5BPt
         a7+mczeckLQ3NOH8xWctivthvl0wHkilCKFmYOTQ8+6wAUDSY7CeSjLqtMpjKhI++S15
         y8wg==
X-Forwarded-Encrypted: i=1; AHgh+RoHHQwVIGGFRhP4x2jlv37rvKn9WxMc7TneC1koDisHLXcTj+10FIGT9pWA7f2E8lGnZsNK7PuKDDky@vger.kernel.org
X-Gm-Message-State: AOJu0YyShKEga2Zf9qMp7gQW5ta9OP/30Y3uv0vH0Ni+FSmpPUJQEvV1
	+/zMA21VzL6njSrLtgpf1vsC0ebwK/0YmemiJy5vWHPIi3EIpHVK5abTQ2iEw4zIfkSZY/DB5zF
	8ZLK1wb1P5ccdKYltUqLLA7yjQeEaYLF0Jr4CVk2pbGXiKfbV4NEZnjwPGNhbMqZRZNia1OnF
X-Gm-Gg: AR+sD11YewRRrvMHmaOkASqPaq8uE8ujGFEcPCVOdUI0mVBRvzXlBcuM+yDqKr0PJQQ
	JyaphNFuUR1n0Bs5/Ke1ofFwNVQjY1s6dEhUmlGpa61QBjZ5U61nbWdee4WODavVY0eKloaXjF9
	UURresgVgz6yzrvZCVsFSgAVabdby7v1yyC1ORV8UoMwbNVxpFUjxkUKrdXGrKavF8VwJxVWsAJ
	Aho1TLmWNhxNIAmVKirII2KM0bO7e0F2hgo+GIEUaqgDlQxmYHR5aSJbKGdInDkaD58OAdaPZxk
	aHIuxURtHVDXKd9nnNyUgq83IILAFlItpPZVwWivj6Ucgdy5kcInl7PA6dBkgWVmxl+fgOi5jAD
	I1QbGaaHFXEx/1EDzqJHYkjPmaS6F5ZmI2rEwIvkZRLrocZbuJQ==
X-Received: by 2002:a05:6a20:7b20:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c91b0bf2a3mr469239637.5.1785477230819;
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:7b20:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c91b0bf2a3mr469213637.5.1785477230358;
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm1643675eec.7.2026.07.30.22.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:53:48 -0700
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi GPU clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.com>
References: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
In-Reply-To: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
To: mturquette@baylibre.com, robh@kernel.org, andersson@kernel.org,
        conor+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, taniya.das@oss.qualcomm.com,
        bmasney@redhat.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785477228; l=6690;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=TbWn2omPVPJIUFrb413uT0CtEMn7ALcSOCfFDea8q0o=;
 b=Lpr4jff/WunGOZzFx51LAO2b7vBuX/mRxMATPtmKcSQw8y0hQsi014jobANWP5t3BXl4rSpLf
 5Tjja03Y1yvB12BjBvWPsasxG+py0F+2kD1Obe+0s05xenvIizYm26t
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX1XytSTR0/nv/
 /92pJfWWbrwqxoU/zf8+liCMW+K9M7lY2+84SlAj2YkjBsxUovFIYuTtzkWXDdOBys6BgT3D/4p
 LIgFl4Gqvt6fuDNSZbYUNH3eROwp29ymALu8+9fMqEXjg7wbStg4bkEoEhmfQNx9WJzlNlCLbGb
 8llG7c7kiCbotRgjvZD6svADCSaljhV3Jmkmp0uMXCmXirdQmoIhdIch+86ldExuIoYdmNmZN0h
 xxFmipM5xud4EgRXZXbYBlL3BjwNw50sdP4jSeE7fxNNiEJq1y4eAzs6rnGHTPmA3+kESRSucz0
 Kw+1xTwbe8x4MTecXgI8yzaL1o0hWTEcvUR94C3S3KH1sAZee8yNNLa0rTBAxFtsEeqanSLs5Zl
 AjvXsSbpCL6JHM8U3YIvnsPg78rERvmfbfVaK7uSw5xzRkFtPC+o3OU5t1Rq4wj9G7m8+THL2Od
 h0V3bvMAbBIAg+susTg==
X-Proofpoint-ORIG-GUID: XOibO3r_lBDyaLNbtqIfjceHDvr0-tx1
X-Authority-Analysis: v=2.4 cv=FI0rAeos c=1 sm=1 tr=0 ts=6a6c386f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1q_97lxy2FG9aqMPMkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX3sX4lAq9b/ON
 h90xDJuJr39NyASylJK8hmC5TSM3lbElkMpPZmTLT24ZI7c2BQeIu6PxaDoKMLEHEQ87YRPIPtA
 4H8/fc69EOQHg9Y4ySah4ITFu3pP6cE=
X-Proofpoint-GUID: XOibO3r_lBDyaLNbtqIfjceHDvr0-tx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310038

Add the device tree binding and clock, reset and power-domain IDs for the
Hawi graphics clock controller. This lets Hawi device trees describe the
GPU clocks, resets and power domains, and lets dtbs_check validate those
nodes.

Add the qcom,hawi-gxclkctl compatible for the Hawi GX clock controller,
using qcom,kaanapali-gxclkctl as the fallback because the register layout
is identical.

Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml | 78 ++++++++++++++++++++++
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 22 +++---
 include/dt-bindings/clock/qcom,hawi-gpucc.h        | 47 +++++++++++++
 3 files changed, 139 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
new file mode 100644
index 000000000000..3e40bc3c061d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,hawi-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on Hawi
+
+maintainers:
+  - Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
+
+description: |
+  Qualcomm graphics clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also: include/dt-bindings/clock/qcom,hawi-gpucc.h
+
+properties:
+  compatible:
+    const: qcom,hawi-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+
+  power-domains:
+    items:
+      - description: A phandle to the MX power-domain
+      - description: A phandle to the CX power-domain
+      - description: A phandle to the GMXC power-domain
+
+  required-opps:
+    items:
+      - description: MX performance points
+      - description: CX performance points
+      - description: GMXC performance points
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d90000 {
+            compatible = "qcom,hawi-gpucc";
+            reg = <0x0 0x03d90000 0x0 0x9800>;
+            clocks = <&bi_tcxo_div2>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            power-domains = <&rpmhpd RPMHPD_MX>,
+                            <&rpmhpd RPMHPD_CX>,
+                            <&rpmhpd RPMHPD_GMXC>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d3>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index e868963f659b..28b653f6b64d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -4,25 +4,31 @@
 $id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Graphics power domain Controller on Kaanapali
+title: Qualcomm Graphics GX Power Domain Controller
 
 maintainers:
   - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
-  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
-  Power domains (GDSC). This module provides the power domains control
-  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+  The Qualcomm graphics GX clock controller (GXCLKCTL) contains PLLs, clocks
+  and power domains (GDSC). This module provides the power domain control of
+  GXCLKCTL on Qualcomm SoCs, which helps the recovery of the graphics
+  subsystem.
 
   See also:
     include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
 
 properties:
   compatible:
-    enum:
-      - qcom,glymur-gxclkctl
-      - qcom,kaanapali-gxclkctl
-      - qcom,sm8750-gxclkctl
+    oneOf:
+      - enum:
+          - qcom,glymur-gxclkctl
+          - qcom,kaanapali-gxclkctl
+          - qcom,sm8750-gxclkctl
+      - items:
+          - enum:
+              - qcom,hawi-gxclkctl
+          - const: qcom,kaanapali-gxclkctl
 
   power-domains:
     description:
diff --git a/include/dt-bindings/clock/qcom,hawi-gpucc.h b/include/dt-bindings/clock/qcom,hawi-gpucc.h
new file mode 100644
index 000000000000..181534771b10
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-gpucc.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_HAWI_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_GMU_CLK					3
+#define GPU_CC_CXO_AON_CLK					4
+#define GPU_CC_CXO_CLK						5
+#define GPU_CC_DEMET_CLK					6
+#define GPU_CC_DPM_CLK						7
+#define GPU_CC_FREQ_MEASURE_CLK					8
+#define GPU_CC_GMU_CLK_SRC					9
+#define GPU_CC_GPU_SMMU_VOTE_CLK				10
+#define GPU_CC_GX_ACCU_SHIFT_CLK				11
+#define GPU_CC_HUB_AON_CLK					12
+#define GPU_CC_HUB_CLK_SRC					13
+#define GPU_CC_HUB_CX_INT_CLK					14
+#define GPU_CC_HUB_DIV_CLK_SRC					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MXG_AHB_CLK					17
+#define GPU_CC_MXG_XO_CLK					18
+#define GPU_CC_PLL0						19
+#define GPU_CC_RSCC_HUB_AON_CLK					20
+#define GPU_CC_RSCC_XO_AON_CLK					21
+#define GPU_CC_SLEEP_CLK					22
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_MXG_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_GMU_BCR						3
+#define GPU_CC_GX_BCR						4
+#define GPU_CC_MXG_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif

-- 
2.43.0

