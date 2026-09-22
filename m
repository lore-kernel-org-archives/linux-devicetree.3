Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCB3B7B7F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102705; cv=none; b=IgG6rB/s7DsqodmkXH0gkEuCptgBzP4d6QPdpEJGHp73CL0O0wATnhhLGJcbzLvib5AVP/SumZrdeIDRuvqTJ1EHEA704rO51GEqwdvhJmu4in23sMGCGNrIk/uasJgXpG3I+oeNYsSPNQmNOp2VyZ6xoRnTz8aRfnSpCVg+r6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102705; c=relaxed/simple;
	bh=xhxIA7Wnqk3AsQNrfoSlf+f+2hDRBWo7ifCUUnxI5LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lll6RTGVhRvRTb2AyEUnQfoHaQGrnF/R3AjaD4/6X/IfvU2YVPhZ+MzjMkq6k1LqjtVHAmBtxEQRPCOA6TAWmPtXF1U+nWB167rT9+iMzv3rtQ3DUVL5d6cVLJKVcBGKZL49AeVNPC9JJ1Rl7caUhedhFd3neCZeJ9XDlGNyvfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcUTCa7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpMbZQfR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcUTCa7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpMbZQfR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Cm8368041
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+yDeC3B2RiB
	ycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=; b=GcUTCa7WMBRAxkM02u7jMbe4Gm5
	IpD/y8+Oooxl1hXB3OvclsuIxpkS+ZuCr2dR3eTWIfCS1nBlcXxjtxig/Y3QeknA
	qeOHU1zHot0Q1Iq6Q8lkSa6VjVAhDu48jeMQRjDHTzxZCP650MMS3j6SXJYpgwAK
	N7MgghTXLHbhHDioBHo5XFn6uBbPuzFCekL5oekdzzfTFTE2yTDvkztAoq/fpwB0
	qqycz0BLCXj3x9ZnffoH/Gp0d/ne+kG5q85rEnvlGNZpIVc31+ZAKNJ/eHs42vH6
	xz0EMa2aIbMj2C7fwJf0cqQftcuHgZTuBQuQf5hLlf2xNZptkP25DYXN4Rg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnta8ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:44:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c96449cbb2so112545e0c.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102699; x=1790707499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=bpMbZQfRm4Q2zrH9YFZ3XApmB2i2BrYuL0DgpfjDIIjAkpp5WCwAaEE5+i76AwlOHi
         YZKFyqdrR5W33h9gvnPSD1AuitWQ30rL15aNrddG85BrJcHNAG0fVyYJO05pExBofEfm
         UarZOs2pnS48GqlS/jE6RvTClTlPSGXD9k3nyuE7bKNvU0XInPtB2YBJEOSuVQMkC1Om
         Qq1JXLOFKCxlaxnH3r67XW1WzqbqN8Yo35TieCuZr92+Hw+1+t0kvI6993Vlxhas9XGK
         VQ8zwjtCL0OcGOdDxdV/zZMFGVuXRjyBw1/QTRSLZPclusInkL6CpRbCaTWo/4SdlBzo
         tBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102699; x=1790707499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=C5ZXYIt09TOsyOJ+g2xG87fMcQyQKPQIa/tXBCTKlsAa0SgXhBW2dGFR2f1x21pZlr
         nqFr+zK+HkCUH9NXA0gPUL5kgslB7zOriYnMyEa+50VhWo8bRAE01+ZSeq7a/C8SUp94
         LHASboKH2GY9Qel1lZpWyKKhG7Dg3+TenMC2R/Qzq2dkY/cOT/lSxSG2WRCGU4OpqRvF
         UldY4xz1c5UqfnUZtBi1PTDo+TqVb2ukAZnvuBH07wH/a8FlP52/T/uKGfIqFoR6begr
         lG3imr+CabLeydFAVEMaCe3wTCSUim6LyukhVtosLQ1sSKWbns9uq9S7obAGq0KWbh7I
         MQQw==
X-Forwarded-Encrypted: i=1; AKwUvBxHJv9/+wszWepvZ7UfvX1eRD+QBIL8jjzfJPqVWBxp2hakDxhDfZyFXP++TmTTFqApap+Tj2NEfRYf@vger.kernel.org
X-Gm-Message-State: AFuF++mA4WMfg0nmF2TirmXZgOEFL6OIHuV210ThN0F0zrwU2cvu2UNH
	FktT7lRuZEqda1Z3zgF6MWk09/jZyP1ZFfx67tYsh7tqeIhf6RL2dlomWm2O1mEmxwaopb0dwZa
	vK/LtpDCyxID/lShhezB0K96cfB3GTfyKp5kqUQNRG9q8dpiotHfKlW+ibKzrVL1L
X-Gm-Gg: AYBFou2PW+YpFCbewxD1c5ho3S6sOx3/BInCVxerm4dK4GY0DvcMsTQWQ8d8sJNcnat
	9tAVm9MNNCEvji8mXOO3nicp547R8yN/wMHIJ50s1DwS131YCcxLt7P0cMK0U55se2E4fDWn2Ll
	z3LX+eeEgrkWlV+Z5Dx4nLZQQfDx1DeNBN/qvk/bwL6u0eMZfqzWhLcaDTuNtac0pMJOOaHsiXf
	Z0w9PwU1EXMJwGZN27zvJVcjTvgaJbKr0c/jqMLJ0vZ45+3zbIr/CCgEI1pSR0h3iutyFpf9JL+
	fUKkVx0L3u8uP17cNKsjXSt1rJKpton1K7+cWO8AVO3jCKYga+JpY3ms+wicEtnwksBFex/zWOX
	6Tmqvl17Hcc8P0IyTxwje8kBfYdjZ2fhQ+57I/yZ1ZCOlsd6yki84uib/8sPouD/C
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id 71dfb90a1353d-5c9f1655c76mr762269e0c.15.1790102698804;
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id 71dfb90a1353d-5c9f1655c76mr762241e0c.15.1790102698356;
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
Date: Tue, 22 Sep 2026 19:44:22 +0100
Message-ID: <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y907oMo58TgfE_cMtBGu_HEzDmlw2J8H
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2ccab cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=yiKMOllxs-7wBVDooBUA:9 a=hhpmQAJR8DioWGSBphRh:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfXw7OSC93HBpol
 cx+RIBAwS5nCp9aOP4uBv6c+vrhn5yZ+Hi1qc2/c6CVb1eUBQ97Hc4yzoy7qQ8YmdeFQqrUSokH
 Cn4qrnURl0D4NwTbJJjejFtjpGZHLGFPv5BtBP30dJ+lSEFensqO9TjczzzrLw97n2BLa+fNIu6
 vGVUyuziLwYFmiVT1YV/BXtN4CMYPcrohFuIMueYr6RHbBL5shzwMlxI4uIgw4pPzdK4Z9F6gav
 d8i9ivFFk+1W8bX51NFjMfqraSAZNwQoP9o2ESoxSoMXeHYwyz3lF3gOuFN5U86KHlWOQ6EncEP
 tNK90hccwBZz6O0UKDa/UQhRFtEJgVoeS147uHPlIVuCm5Zv9Df/9yX1L6a7Q1BxJQETSh5bOnU
 ciJvmVXVP6ExVR35sOk1KHwGtYS2hiPcH5qz6jtAjiWWxmw6OOsjH3sByZ5m2HbT86cpebkMzpv
 IeKT/uRVEy24f5sAYlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX+/KCUrjgbiuH
 uC4xzABsU6cg1fQmmFgESjtN1YsetqpuVj2xzyxHlezVhzY+kf2/a6SMwTuxGVETbgTcH6/ZcjG
 38ix45NT1Z/8gsurzOfC2xYsWJIva0Y=
X-Proofpoint-GUID: y907oMo58TgfE_cMtBGu_HEzDmlw2J8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 50 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 16 ++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
new file mode 100644
index 000000000000..c047c0174a93
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller on Glymur
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description: |
+  Qualcomm LPASS core and audio clock control module provides the clocks,
+  and reset on Glymur.
+
+  See also:
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-lpassaudiocc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpass_audiocc: clock-controller@32a9000 {
+        compatible = "qcom,glymur-lpassaudiocc";
+        reg = <0x032a9000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

