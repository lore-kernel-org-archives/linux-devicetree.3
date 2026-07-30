Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1530C158
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398867; cv=none; b=gp3hxKgN2l9as5JwHWTTLjbOFqC3NSC6Kofcn5NA2658gqwp3FAsUBiP+tajidV+CVwrSH/2MN5gBWk8c0ZiJP5+6rxBeVm5PSqe/evJC4C3SSfx7VtSrfE8hDR3jZnmlPFLPvCqFFc7ST91Aa/cx94vTx8joMcYdGXV8iLnhKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398867; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lumbozuhFH6znuSKRdOeHSSOY9dkhoVLqXObWoWC5zFSY4L7blWeUJ48GWf8eH7QbB9lQGbG0AW3OmEB1IiIOdiGOK1NwbvzgW0o4T5fH9y5ufqcYgT1DWYHvyivudq+g+rGKD3H7jkDHiYCor+UfsHq7HVzn0X96F/1qJPz+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bb7aBCKL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIpV8Ijp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bb7aBCKL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIpV8Ijp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7xohx395610
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=Bb7aBCKLNQAAemXPgs1WjsrJ2eF
	TrLboo3xX+rVmqFXQFfT74Z/lS81Plv3XvNWJSKKsF8iVueb/NC8dzgR5j2U/2hI
	B3ZLR+nX8Kb+lJhje4N601vqOU7pfyx5lqvyEaxDgNh1njAcoRDwadIxQJMUYIKv
	RH35tAIDRrCtigMlykmOS5POIKdpgKBtHMgRbMce8GwQsZVz1tFtza9CejMer6zX
	BUtnkmc3BgZt6r30BozfaDBZPFYPEUDL9cmFmwZSnXaZeJyqe5U0ma3iXZzcmQl0
	smJ/HeGJxXl0UZfA5lg127BLBq+/kTNuBWWOEd1QIsugCJTWdaCxf5a5smg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2qbg16s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:07:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so759063a91.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398861; x=1786003661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=bIpV8Ijp47+qub+7cEflu3SYHF3ep3bZBCUTNNGikXAfgXdB5mkOyHJxrF9RTb+LAs
         T9e9P3trW3d2GNcTHrmfMtafA2V+djp/JIdEt1tiz6naht/KTv2Euc3YN8U9vD0AM5xC
         DiWH3W0FojiJfkwV6dexjUi/60Mh0Ir/nWp1rj6oyOKL5AvNagmI1y/v7t4iC48ZnFT5
         nOtnKAsZqi/9iUFFzrkdin95z4elHwLjCtaI7ZuOVL+Vc8weerw4Ul80cclDnBNK7ecS
         OG9WvwktQn19o+iyPjNXK4lO9JpCfxeOcRVaUHN5htb/IVtBSt8kT6nFbsxjmWV6xHV9
         wW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398861; x=1786003661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=SUoXODTV8rj47h5XZuOIqJu97JTXH9EXghiaKcjfAM0J3MzkUItaQcW7hp0v41XuER
         XpK/Ry3szdBZ4J4HC1v8xK+LhNT/gajZbyBRCkSFl01WQKzGAUjlU2eQuL5nS2ndW0I4
         dej5miPZioSL3s2aPleDqTzyKvaGmyFFoaAbtJ8t9pYUMCLXcMXC7QVkQoajvAU9F8a2
         DaowH7h/e5UZATRB5+4308IChdzmcM90tlCCY5ZbBBl2xxsBVy3xBQglUpJOqNcMUiKG
         69jg4Z/eTlaW0f5MvwQX7J63nZt7u7RzrDzB78EYyUvOR++OhQD+s12wrxWrVs24ygnt
         oy3w==
X-Forwarded-Encrypted: i=1; AHgh+RqEVniRTrHzViqRR61gfeqm8XX76xNHZiRC0yF0H/q2iX9HpMfHNfic7QpSqN9+/Yf3lLHMRRTUpYpo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywem5MxL9J0FrpUlcKx3ImKWoUtEBTTjN4lkFY6OpaLbkG3xlz+
	xGMhlbVuEQlULsc4OPCj+w7rsI9bhmLwwRYp0YzU4lpM1Nr6gsG2RW4WjWDJ8HYTxSG59ARWj7V
	IhWpS5/HPLENMUdAL0MlV+Ddus9LK5yNOVL4VNtd6KRoPr6xeVx55rg9NdDVN0brV
X-Gm-Gg: AR+sD12gmU0AkhjUVwDEjr6WuKPyKVRmn8+nEzVt3wmWmYmgLASIe+C+uyD/kWs5SsL
	rf107iiBE1uTY5qrlwIx8C+5ENZS0mN8xuFmVWnFPGuL24oVR3jg62gnkeEvrf1duIyuoGcK7p2
	48CrOQBoNGO0ZWbH25aTJkbaZeU8yGxyI5OcEQZAqaMg/m3aL13a23JGc1MbZK2umRIFx0BVBBF
	fcVh4tmDbYRzpJjw180rIR4fhIIzsm+T0DxLGE04zAQ6VqTaX9yYA9n+KTgpb7g1x2G2c9MugMy
	iCdf67zk2rRyjSWidgKZrJAmOGgTz6l8n6PvYqnR8YK6AMHN13yHgErRc3EO4NY31yjAK8516G3
	UYluNHD4LUTW6dH6Pn+VRWiv5rP9Vihb5Ar7tPO1x39fmJ71z+rZ5/UY=
X-Received: by 2002:a17:90b:5745:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f9c08163bmr1501446a91.41.1785398860926;
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5745:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f9c08163bmr1501395a91.41.1785398860393;
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu, 30 Jul 2026 01:06:58 -0700
Message-Id: <20260730080704.2903540-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Uu3pXz7wzjW7JcoU_-pMWa2vlOdh8IU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX7UPT0NANqTiL
 90I5+U62f7T1laJRE0tPEOOG+P/Zhd8EB183Vm0jhMIyWMAfp1r5igl0EmfxeaYGJllcUWtlGPP
 lAEKCN8wIL+nrNS4rSQTipZcMNg5wgjWcDG277RT9+0j5fqcJHu440Sv/BKDas1YA8aj8xj9jsG
 u5zNkt4xkd9JijKWNguPFVGOUb+aZLEk9R/sYsCI836G2wXvjV3GrTmwxMtMw7szZbDelAlnaOR
 YBPWrJxsxYYwMmKpgBFYiqXer8TOOQeoGgdZQ8TX/XhcB7G4WyLQZ5C4AX8jSnkZ/rWZthc3Hz5
 K3IG/rS4tXO5Du5djWn3i02mpDHC2l8lXym27s+VzI4HIYr2QdD2qvZfB3sLOgN1gwCSbLGitQq
 pE2LazYHBwff7zboM3xPiAv3lrO0MwXSSFNJDjU9jgpANtHXdF3FOibp+G9kbS9B29sOhHYVOY1
 biJYQu0fZHFDVGLRnHg==
X-Proofpoint-ORIG-GUID: Uu3pXz7wzjW7JcoU_-pMWa2vlOdh8IU_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX/4HCwCtFFHbS
 FC+yjvXZTQ9Bz/WA0srt8NPl4wsycqZdi/hRsH6ByJCp9DYvFG69WvMWUUHFZ5HmwGMAwL53U9C
 N4dxF+u4tMHWpYJ3dOosfDqlcIHeQmM=
X-Authority-Analysis: v=2.4 cv=SoigLvO0 c=1 sm=1 tr=0 ts=6a6b064d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300056

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

