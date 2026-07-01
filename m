Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AEE1F4631
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 05:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885366; cv=none; b=oJ+1sgC7B9p/4toO1pVf+Wcy7gghgdKyVy/bvpgWWVyHH6P1Tl2zbvgJ2svIwxK55hogRESUMo7jPLDDKNorgXdWXcaGrsUSU+x13nFuj+8VEC6LM5LANTU/sHqPth5voX9etyAMPt85WUIEyO4g8Etke/oMTg8abJaAPCd3HFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885366; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HliEMYkmMYVj0CWG78z/E4AVnn9sK8ZBtwga3FFpwFcrKSiwRymFoRrPc3H5VV6JKl4VqRArmvUuGrXyCJezMH3EHBuxE79Y2hkMvu8Um3uf28SmMNJ1LsnGMNvsvKfnuJLmjqCLLGSq0SmigVA/xodPJOCTd37nWdKgo+DtXIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8aDjuET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuHKKZWr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8aDjuET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuHKKZWr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lYfP137178
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 05:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=Y8aDjuETy9TX9pqF3g7vV7t1M6K
	M/pd7hk5Ez7/24lOylHcAwBSbrR8uOCYTx8sAHuWGT6kfKLKTqsPSnx+K8yh245h
	qkycdnzV5D+9UsBQaRGVuEKxRqeaRLaszn+1rs67SGrQutfMBZaxmxRVrod8kUFt
	T9i5nO4jfGJImK1Zz2GKGpuEvOln6jEAs7cHX0evTeL26WoPmXlCTVxcMO90o32F
	pYyTgRObV5w0G15fNZ+BoBSdegMsjkBcoLpddvnAdNWzN1mhXhkrR2pEzJkBy6ru
	FCLHWLY1by+QY/B3zAP0zE2+5JSpqfpy9KEd47E+rLCVx60WSyxUHPxwUzg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0au0gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:56:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9f0073e20so4009075ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885363; x=1783490163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=MuHKKZWr5rvpUDRgDg0/AcGisQgSoljLpCzNaF7AeAb5DkWHcL/20SJPh90hl+vqv6
         vbJrVxp2C3+/VxGBS7UF5cG3B/rx3OpzMzof8x7qI0cymTxkvrI7dLqCC2QiT4bPH5wE
         TK3KEeDJgdU17cIjwarRBdH9QpMsUj+z79c3egy1UT1BzraLen0tPojGKfKNLLmnA1eJ
         Vl2vR7ZwJP6fQzEs1VQmqY1UmBcw7txU67hTMN62blDoWAnQol13RX2fbEBVMLGlpoCk
         Cc/lzCbVsBscrNlZYjbPEji+NykMpmolbAKeNnqWXzlbZkQHDlsOW2POrmmjjn+D7ReZ
         chKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885363; x=1783490163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=d/FY9f+343oig31XiUj9LpMMCJC3kOCX6cVucrV5g28yzTpQ/5tncutybggigamZPq
         NYSzDbcQMATnt9i6a/HVdd8BV8lY+ibdO4x76O/BIA88obJ1oYc8uGssW2Fv59475eNy
         QnFOxJKKeEnCXH8N57qJ4LavbMSXh+uXXDyNyezY6QPIzg3CaWX6wLKa1VaFbkeUX3Wu
         D/z0LE9rzgT7FjktaIPSz1PcN6yFDp96mVu9YDFdlritxsiAz8EJTjalNeGelZQ0RyoE
         CES1B60mK4oxGODGsXgGAw4HACYTpJ2/YDngKQHsRMRJ77azZ7HJgWsf/7a1F67weUT3
         9Dsw==
X-Forwarded-Encrypted: i=1; AHgh+RqEyH3FyJb4JoP3Tr4zMokWxkB3Ezw8uDVmIO2qI5mw5K111PU4Wjt6ck50RTDsLQIaw+iU4VSF2NoA@vger.kernel.org
X-Gm-Message-State: AOJu0YyFdOg4rjkqmod4EXfzp6dPCQQets7MxbUR2dY9k9x5SkNRwtuW
	4OvAYtdOSZWAhVjxSk1CoF8pXK0WUG6NzzlV14vHgsxJE+dVHeukwgJUq/3qjYhDjAQSi6BMWsR
	pFxMry2RZatEnaP+/JfkbTwR1TOQvkWtsZ63pNgwV6pGimWUefm9NJKZ7s4eN33EO
X-Gm-Gg: AfdE7ckEI17t+KTgY8EBDmfCJsqJiiH0oHBGjgDvtG/2z8RgjiVwuy0S1Iip6ZLEKiB
	Ec/KkI4KFTFKVzP4agvi/bjfIDNHDt4AqkZ3YDbPh6b+IjMYAjO7pWhbsNAz8WHAPvG+n9H07h9
	AlC+8jvWMDtho2ojHnlULBNQTqIpCHNabfFXuZDSixqcP8lgtlPcoOQa/3/oWc378/nUBPi+1nV
	kdQhtDQnbS5pFZS7Me0l6nqHJS/ilbfgsQcKDXsw4b+SnNYTBKMRV9IN5EcIEZIpI8FmqVAz/iN
	pI9NwiEaC+0F/w+q3/7hD3g+W3pL5JBShL735kbw/l8+bjsd07G/1/C5L9gDeb/6N1ZPM48llrj
	9SV1XD531njAiTkSQdS35WE/fJ30IfVeguf8096nekz9J9NBfeKvjvLdYCcavlt+Erw==
X-Received: by 2002:a17:902:f652:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2ca7e65473fmr3899105ad.6.1782885363186;
        Tue, 30 Jun 2026 22:56:03 -0700 (PDT)
X-Received: by 2002:a17:902:f652:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2ca7e65473fmr3898875ad.6.1782885362709;
        Tue, 30 Jun 2026 22:56:02 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:02 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v15 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Tue, 30 Jun 2026 22:55:23 -0700
Message-Id: <20260701055529.445819-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44abf4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: jWm8HLt_WFFYPQGQHbxa-gAEIpSarJf0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX9OTrpF2sRNAi
 9Gtn1sZTKaq4G/kJHID7nCmNjFnuHIglUdDPCR78QGb/1tnYq0usqJLHo+0Nse2/geRWxD3glmI
 8zoemjW6qSCkyggdIIBVq2QtYPnYIxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX44RansOV0Dyd
 /Rnalt/EC63BHnp8ancrfQLYkIBeOYySTbCJbnVuM/lnfLf1sJ4VzYcF//yNbHgX2wX38fn74x8
 FPdj0WF8JbogOR0Z9a0WoZosPj/e+UUvDE0wGw75hiytT9OJbzEekuzIRYGQng5deVvbTuRN3Gr
 DIe8yhMwUD5CFINv5+wanMbgjW5c/GE52xt8lKY8aQEOIhL/wQ4VkvuH4m0GSa0Q7lDdPwFjkE+
 9k/48NnDmvRSCKlpSov3tBVLG/GGZx88g7xDyHihEBG90zGcydcfhmWLEmuQnor7bVpVcAjT1La
 56NNW4g2Z2go0AsP7pDIoY9k9EuqMerbgnK1pWLBUHP7PYdgYLNAB1EK6udrdGjvdT4+KVleKa+
 Bq8hwG9joOr1A3iSs40qUvIgOzK/yJcEnSl5Zj+v5g7vq+JO+hRXv4DjGCbG2pLwFgvzK+zPURz
 X63qo7XRyAiaPUVGr/g==
X-Proofpoint-GUID: jWm8HLt_WFFYPQGQHbxa-gAEIpSarJf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058

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

