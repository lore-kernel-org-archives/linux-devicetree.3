Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0963C3AA505
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122143; cv=none; b=iNDUe5ZVTIOVIuS2vx72jrxzKPVoz7LII6nakNl4RcXf8UIT3WQe/P5PQEGgqRAQA6jHXpiHBq+bgWdcLn8TIhCaq9sz2YkbJjN3MxIUKSxLDGHQGSzhmskoEL/SWIaUEjb2nEYqOHQf2dos9QRn/cyI10dRu7wDqjkr2n8bm7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122143; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E2veqnb45mIOt4XTm0vxkicWsZzz2k3nICElqn4aA5x0kBU/fonvcQMcuRuoToDPLwyqezd0QmezGi1E2SvtNdAINOWdyk70DCqP1jqfRCNjQoo6Hyk0HuzhnACJfEkzuxaDuLPW5Y2j8O3W7b05vL27IaNOzBMf4fuS7347l1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOsiPHKx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqWJDmaU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOsiPHKx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqWJDmaU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QhNK1551210
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=QOsiPHKxJU0AYO7HKMMYnthq4Ii
	kSXio3+LB27asj+rCsUYQqgIlPeCiY9HxV/48vVc/sJrRp+7flLGLsT6uaPcc0X7
	WMlCOfE5rsSTIWwPi+Ao2IgnCVlmq62Tr2Xnn9RD9YL7D3voogd/dojX5Orh3geM
	aAMJl0o98MwWXFM8P4EdQXvVojzVzgq1VNR2lBqxxaYimxAP5G5vp1O/OTazfskT
	XuM0buLVNxv3qLoswleMJOkypyNoYxp6PMeBDcEWMz/yfiGqhIUjymRcn/YEsIir
	ihif0/Da4b5j6ruH+wcGGhznU5wthOvfgcdTa5EvrPXITwiRQLQTADUYKqQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9hees7k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:28:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c5b48baf75so5172281eec.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122132; x=1775726932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=HqWJDmaUNr1/iDCuHLNF++ScWdv4Oge8xMAgKR+rvaF1uVHnwFgeQAJ3I0PELWn20T
         9aG1sruwjO/s3AVSBtx928kvJpsLw5ykLzDFNS53Xwktgjh8eth9L4Qh0nTnpZDJL2DH
         es1UAZOSccsMQipW81exopKQy9DOy5nrpDsKqCNKquDJFFa9vTxRnnEnStcZi3N+3FtV
         JqTCmDbAVvuPXa53IUiTI1vS26GIG5ZlAJvRAdY2jKiBOaPIz+3EvnLJX8SVT0lbcdPJ
         1S7THaVVT7ZB8tTOI+61UV7j4tzltSAQ+Zk9WCDDR6TSbG7XN8zAQaCfMLxCiOvsSFQf
         dOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122132; x=1775726932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=YMBX/geh3hV4OQ/6U49XeQGY/xUT1bb3JXBFmKkOzuH8AO0dxD1JcrsjZLw3SA26Zd
         HKpUD6pFiY87gf+JDFRsKn7aJBVgs7I8/j41FmLvtVjvMVbYG1ZVdso2aLd/2YNFxYnq
         U0IGjEUvTezqRM4a/zpO9IizYWX3ZEbClh5bx/14yhgHYIuf6r+LDPXOSu6kh0YSBrF5
         hFL9tq/ywwJUb3uDqsG/miLzQloMQLl9OdmxScwb3kylSfFenyO+LZKUCqiFdi7Zt71o
         CWHduNqr+klY/xiA2PLr+aWvymxNoCwHgY5bZgy9+QcroEvqGo2FP6Wdzz0LhT5z7C8g
         zTzA==
X-Forwarded-Encrypted: i=1; AJvYcCX5lZBhaHb0E/1XGILePPno22yRHCH3agxdGUu1JI5+X5tQpd8Y8/SPut5ObNIglx/Z2uUWA8bxeGIG@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSbcNfpOjCXQYTjtTRYHPQ3C/cTd1i5S4JnBQhBPQOdHpDzXj
	Qb73nroNvyLe2ZS4N8QpHu/ZtWjsNSCxO6m7Fv4jrSMCF+ommj3Nq9WwRguj02TnTMsW9UnYY5I
	5Kx4POxVH8Z0cmc586MRqYEv+Whf33B2aCDN95rFhmg8+YEmqYHPY/ojNyi/uICli
X-Gm-Gg: ATEYQzxg1e5dQg+mNKllSaqV4Po/r2BAPgqhv6EaB5r4SA1oOFRuSiAcRKfgwFBQSay
	77krTmJSMaxVMjC76LrLUCT2nf6GRii7AzTEPNWBBlpg6CivoDqaARwgHvyveaunApI6zOsT6Jw
	YtoUU5OCOv/B/k4M6R0rpruYwDUYgdx7LGPSlaLatWiDyvEJISAWPLOTbVjvEve4Wz8yPkszuqe
	zml21cSh9nyaDE5ump3rKG/L2UKoxR1vqhcGAB2dgYn/qKCkV6t8MkAoET8ejBIK2B33E54AQ6C
	mn2eC2LbP8gleaDhVKe10nUYiWVmiF2MgkMd1vxx8bAEMuNYbABEsdpOrT8rrImVdSrrOZzFb1n
	SSVyyW0hp94NUtx1W/EKG61owLV4QGD7Q2EHhKGavrz5xpxhSiEM+BF16AyxAl7b6qy9GdCqAPO
	Ao
X-Received: by 2002:a05:7301:6787:b0:2c5:fb3f:70e1 with SMTP id 5a478bee46e88-2ca9037b03fmr1380018eec.24.1775122131679;
        Thu, 02 Apr 2026 02:28:51 -0700 (PDT)
X-Received: by 2002:a05:7301:6787:b0:2c5:fb3f:70e1 with SMTP id 5a478bee46e88-2ca9037b03fmr1379996eec.24.1775122131091;
        Thu, 02 Apr 2026 02:28:51 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:28:50 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v13 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu,  2 Apr 2026 02:28:32 -0700
Message-Id: <20260402092838.341295-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BN4v1MgWZXpGG0bkNyfCbJk5RXvBRifn
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce36d4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: BN4v1MgWZXpGG0bkNyfCbJk5RXvBRifn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfX60hcxMedTpVH
 +cDdzI+JeQQ3H6JgSOZ6Uq6RMSqINUbubzAPp4AHl2ncQ/gK8BPvGefKS/DP4Nxfu3oxT4GcOF/
 yfY6a9sttZ6sqxsg9WbLY+KReyPzqj/dw7jZy+1rPKrhu3Pi0SyVFDbSZOnlQ2xH5DjYzjIs0Z2
 0trZmRJHJZhW+v8B+rdySC8UVKztUn/kg04bTunsGTEndIp+f1vyvbPJ/UBTPcp8XAvPV/+8tZr
 y5LO4KORl3q9+iQKHJViV1Kms+y1POUmA0WXjuX2CdU/WNZBqMrjmmIlPaKwWdg2lsRATblO2S1
 0PZrZDoc/xD6vzK3GAtjRAU71tFmZvGBIq0Hu7c+AquWBhUabu7f8+G2tRxtq0226qZWCmBZFhy
 kLFtzT43ccnGkCl67tXEeSH8x1RMF8ttR8mBbYum0puB7cq+bP5llS+kq/znnqKOqxf6JmU2cth
 ueRvUfIEWeT1iBPpgQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020084

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+    };
+...
-- 
2.34.1

