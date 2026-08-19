Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87DA442366
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131941; cv=none; b=VzM/23HdnE4Cma1aGTdv0tQzOH4Bw2y1UqJu5ou126VQZaHsU+TRZMYfx8YmKgrjcbhTiS8yEchbfeWS1KOtjTcHTWKRFHz0+afoOp5Kf0T01/YMJBPz/EE5xtGgIxy6wzniYh4Sb5qsxUOOg4xWItgp6LC4uni0u1ueCpuoL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131941; c=relaxed/simple;
	bh=ciuk2GQ+TWC8MHRWwLRoBfKAcvldH+0p/RdJKdK6VdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hd9zZ1SewwMpSFHUbnKq5M8fUH4hC5UisQTaWmRn1jhJociYIy6E2UDmxj0gURYnCz6iyc95k+lUZU4OUHusZ1Dr6QIl8AihA61dWfL+GSNW+8Haq0FSoM9hEn8kSDESJ3biwwBBV9v2LC+uwiD3Rir8CfsjqDy8aTum0df3SOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2HodEDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZoln0Jk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2HodEDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZoln0Jk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z7mZ4012307
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gjHO/2wlxid
	2ROITRyvNAPQgb1722AaZb0fDiD9lgLM=; b=c2HodEDb3+MQcuo3F9HqQOiBL5D
	QZd1URV+qk4g+ukBxTPvwPhrHqEIzrBIyZ8cu6NgJ4J2PQvTOSRiqN7+FgyUxkl9
	DkQ49C6Rwg5eMPO4vTWA7ugkUajgS+hLhFcsP2H/jDuNecNidDkzZ4yBIbWFr7/i
	nGVdVzaeG535IIO9jOPsfKb4a146xgRspamPAytCqtjXwcIFzQkfh+6rZ8uaPzHK
	moMNKXsQBZF4fXp5yfcF76rEB9LbxV9T0REX8ZeX40+gAMQPMT5L4wokgumOxsFK
	Skj1kzWemO1i/S/6yWWuWojgkltgZBSVTVsoMNn3fOy67wIIv59S3S5MFew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmaecx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:32:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso13681571cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787131938; x=1787736738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjHO/2wlxid2ROITRyvNAPQgb1722AaZb0fDiD9lgLM=;
        b=MZoln0JkY6s8b0pBwf+aELr7vNlOFshVeli8FWqod8ukWnoQlFmBjTKjJE3+I0nbHJ
         cOGT5w3hpxMu7n6dnErh8FkYdz5rShAyUYO0iJihn4AS3sp0/xPKaeqXmvKASs/1eHxM
         wqlfMgEGQXEVxk1SZKtJTfnvatuIdyBchrUFaP6hVkEjZGZRNWQHrBOg3ZiNdQDzcy/o
         rX12bbBb5T9yfw6PaHY7fbCFJO6NNT8jEJLZymxZP8IdqGUtf8uJySUuUHDkwcuz6ZDz
         b/Lo0q7HowAH1lX+Qs886RmjXMH3h0B3WxILh5WFd8oqE8z/fyfjZLG0tVnE6/+d5LWI
         XlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131938; x=1787736738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjHO/2wlxid2ROITRyvNAPQgb1722AaZb0fDiD9lgLM=;
        b=gm9SvCIW6BeikPGtHbv/GwLCU7Ugw/Uvy/ouCc94S75Ds3KWMXUS9JT6k3FFOmwNup
         87hBZV5V5ykctnGKIffQ+hyZQAbeHfgM+KiaP4n+0pHO+u3NGA5bPQlXK/4lkERflEjs
         yBjaNlMbQtn0cI4dfHpMmfCvznoUDSNJF5tg6i2cXsFr2lGxhsjBkRh+UrynFHcSEt0/
         J3V8ikKcMQ93Lqjtx8H5nYLhLEq1NQeUW5yXFURRJUvlvWLcrS7GlllH+y038/A9Oo8f
         cEb45zFm6agbnKAFoJOqSeThiO2HQQs4SDSLKQE6mfqPWc3YuESVY/0YLtFmwfocJ3og
         2jpg==
X-Forwarded-Encrypted: i=1; AHgh+RoFXcdru2hK9bg1Ab2RIBZqzpj//6KBbMnGej6aAyE/Ot1SxTHMTk97v0AAeViEYf20UEK7RUxGVeVx@vger.kernel.org
X-Gm-Message-State: AOJu0YwbnchUKF7J4CF5kxVkxtsG48ewmEfCSI9Gv2AnDGRIsaAj4eOG
	AsBU107o8b200bVvkRwl8rbnMcBIAwY5yzS/hd5iO7ueu0dl6LFgB1VC4N91pljH00xt35/H/bd
	dkeps0e8HDUU9eWdVt2m9MnvjnV5e7f/TnTDXKhn4rz2cl1AnRbktd6/QAX93V9XC
X-Gm-Gg: AR+sD11q0nv0lDE8UsAlXLzxOopLwTep933lON8gJR/P/ANNXJX+iYg3tATw7gErO9U
	ysWoCwD2/QFbYzxzzPoKfjlqi9n0Qn8G3zK7xK9QQQm5w4k04Z2Gqdy4sqdjXS14D1fsXvJ7Zcq
	ZHxulxkjLAwkxxOI4sa4yMeNz5bX1MRK1MMxbzR4D26VOHQVguCwxDNAo6Lp2yX3VoxNn1+i+HB
	1Ig/G960SWxNoKtF9yXp6ygb8I2Pp0Rg6xIovO2w9BBOD0Oys1WUznOBehJ7/kxXTayAssplLQm
	bF13RkYQpX5Mh50QtgLY/cfzBtUvYXeLyHZHLj/6pKSJjuvjMWOq5YDe2hZbHTowo8AnfBorQIb
	KcbPZoSAfyrGR7I4o6POOzPj7
X-Received: by 2002:a05:622a:2d6:b0:52d:5e88:4246 with SMTP id d75a77b69052e-52dd57academr27869161cf.16.1787131937805;
        Wed, 19 Aug 2026 02:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:52d:5e88:4246 with SMTP id d75a77b69052e-52dd57academr27868671cf.16.1787131937330;
        Wed, 19 Aug 2026 02:32:17 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm4402835f8f.19.2026.08.19.02.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:32:16 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: interconnect: Add Qualcomm CAMNOC ICC binding
Date: Wed, 19 Aug 2026 12:32:09 +0300
Message-Id: <20260819093211.1436275-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OEAWRTCTYqG0MTp5bVVhvysmnam9U0W7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX1qlApCPCE97T
 nshTm8jIZUeIn3pahiv/5Qd8/a1fcYzNvv/OvJyz1L+EwIBINYqxNrd4mdSB0T8fX2QS4VVNoy8
 0prL1jPN2tM2Xzk0WXFb6qlRl/H6op8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MiBTYWx0ZWRfX90e/MkQzYDe8
 m3tMQALOCN7KxgupiYggesZ2uj1NFB6nbYTgYqdCC7aknsVLsxijiLxxLdVC85ecxN6gV446mek
 lMuXqEO47gaehA5lqQg1NTr8hjhvQvrZDrL1OznmSDYvWEtUbtRchitnMiUYl11uBLJVMzCZAtH
 hqmRYXfSXUIBMZqHNASkZOTk38PX7b7SXIPY54ojUWifwoe7Ywx6fNVzYupnfz7D+saBEdRXmTN
 1KF5pLN+Qd+C2jFXFbj6W24geshITDm8cIQtRXpO6aXBdZbXO9zSxKDCLv20RIIhPLBLtQgLRWR
 L9ecKZp462fLTUM7MeCD0GHcs/uYpfNLTzoNe7q4lBRU2WgWqwtKxW4vJSONz37vF9OfPPV4wcv
 H8gx5k/AsZ6MYI5VkouJqezBG/WBL7TgLC5yKFZcksU3RqMgtMWnYY8qHkGx1gya+TodeltcyK0
 WwKLi68K+Y5CM0ejtpg==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a857822 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Tj7GrrDxcBg27RxCkVIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: OEAWRTCTYqG0MTp5bVVhvysmnam9U0W7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190072

Add binding for the Qualcomm CAMNOC interconnect provider. CAMNOC is
the internal AXI interconnect within the camera subsystem. Multiple
sub-devices share CAM_CC_CAMNOC_AXI_CLK; the ICC provider aggregates
their bandwidth votes and scales the clock accordingly, avoiding the
last-writer-wins race from direct clk_set_rate() calls.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,camnoc.yaml    | 124 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,camnoc.h    |  52 ++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml
 create mode 100644 include/dt-bindings/interconnect/qcom,camnoc.h

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml b/Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml
new file mode 100644
index 000000000000..b2659db2cf27
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,camnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera NOC (CAMNOC) Interconnect Provider
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  The Camera Network-on-Chip (CAMNOC) is the internal AXI interconnect
+  within the Qualcomm camera subsystem. It arbitrates AXI bandwidth
+  between camera sub-devices (IFE, JPEG, BPS, IPE, etc.) and the external
+  memory interconnect. Multiple consumers may independently request
+  bandwidth via icc_set_bw(); the CAMNOC ICC provider aggregates all active
+  votes and scales CAM_CC_CAMNOC_AXI_CLK accordingly, avoiding the
+  last-writer-wins race that arises when each consumer calls clk_set_rate()
+  directly on the shared clock.
+
+  Each camera sub-device driver that shares the CAMNOC AXI clock should
+  obtain an ICC path from its master port to SLAVE_CAMNOC_AXI and vote for
+  bandwidth using the port IDs defined in
+  include/dt-bindings/interconnect/qcom,camnoc.h.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-cam-virt
+
+  clocks:
+    items:
+      - description: CAMNOC AXI clock
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,camnoc.h>
+
+    /* CAMNOC ICC provider node */
+    cam_virt: interconnect-cam-virt {
+        compatible = "qcom,sm8250-cam-virt";
+        clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+        clock-names = "camnoc_axi";
+        #interconnect-cells = <1>;
+    };
+
+    /*
+     * Simple consumer example: IFE sub-device voting for CAMNOC bandwidth
+     * directly via icc_set_bw().
+     */
+    camera-ife@0 {
+        reg = <0x0 0x1000>;
+
+        interconnects = <&cam_virt MASTER_CAMNOC_IFE_0
+                         &cam_virt SLAVE_CAMNOC_AXI>;
+        interconnect-names = "camnoc";
+    };
+
+    /*
+     * OPP-based consumer example: JPEG encoder driving its CAMNOC bandwidth
+     * vote from the same OPP entry that selects its core clock rate and
+     * RPMh performance state. opp-peak-kBps is the minimum CAMNOC bandwidth
+     * required at each operating point; the actual value depends on the
+     * target resolution and quality settings.
+     *
+     * opp-hz refers to the JPEG dedicated core clock rate. All shared
+     * clocks (e.g. CAMNOC AXI) are managed by the ICC framework so that
+     * votes from multiple consumers are aggregated before the rate is
+     * applied to the hardware.
+     */
+    camera-jpeg@ac53000 {
+        reg = <0x0ac53000 0x1000>;
+
+        interconnects = <&cam_virt MASTER_CAMNOC_JPEG
+                         &cam_virt SLAVE_CAMNOC_AXI>;
+        interconnect-names = "camnoc";
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <100000000>;
+                opp-peak-kBps = <22246>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                opp-peak-kBps = <44492>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-peak-kBps = <88983>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <480000000>;
+                opp-peak-kBps = <106780>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/interconnect/qcom,camnoc.h b/include/dt-bindings/interconnect/qcom,camnoc.h
new file mode 100644
index 000000000000..9b6468f852ec
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,camnoc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_CAMNOC_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_CAMNOC_H
+
+/*
+ * CAMNOC master port IDs for SM8250 (Kona).
+ * Each ID identifies a camera sub-device that can vote for CAMNOC AXI
+ * bandwidth via icc_set_bw().  Only ports wired on this SoC are listed.
+ */
+
+/* Image Front End */
+#define MASTER_CAMNOC_IFE_0		0
+#define MASTER_CAMNOC_IFE_0_RDI		1
+#define MASTER_CAMNOC_IFE_1		2
+#define MASTER_CAMNOC_IFE_1_RDI		3
+#define MASTER_CAMNOC_IFE_LITE_0	4
+#define MASTER_CAMNOC_IFE_LITE_1	5
+#define MASTER_CAMNOC_IFE_LITE_2	6
+#define MASTER_CAMNOC_IFE_LITE_3	7
+#define MASTER_CAMNOC_IFE_LITE_4	8
+
+/* Bayer Processing Segment */
+#define MASTER_CAMNOC_BPS		9
+
+/* Image Processing Engine */
+#define MASTER_CAMNOC_IPE_0		10
+#define MASTER_CAMNOC_IPE_1		11
+
+/* JPEG encoder and DMA */
+#define MASTER_CAMNOC_JPEG		12
+#define MASTER_CAMNOC_JPEG_DMA		13
+
+/* Camera Data Mover */
+#define MASTER_CAMNOC_CDM		14
+
+/* Face Detection */
+#define MASTER_CAMNOC_FD		15
+
+/* Sensor Bayer Interface */
+#define MASTER_CAMNOC_SBI		16
+
+/* Image Control Processor */
+#define MASTER_CAMNOC_ICP		17
+
+/* CAMNOC AXI slave (single exit point to external interconnect) */
+#define SLAVE_CAMNOC_AXI		18
+
+#endif /* __DT_BINDINGS_INTERCONNECT_QCOM_CAMNOC_H */
-- 
2.34.1

