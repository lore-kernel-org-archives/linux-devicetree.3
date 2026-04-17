Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC43783D3
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411306; cv=none; b=l7/tKiBZFpqHef8AeoKj5XQlgEUFa+bf9OSmAspqKnGhpy9k5qObjP7GcbIlQBvCJo3nNUUB3Hwy0HzPAB2V0EWvKJG5y/w3MQsira9ddU3g9vzgSCDA435L2pt7SvRSaztSVJkvhCfwNZZIV53VmMAsK5UsBfDH5dW5yDG6WF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411306; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q3P15f5jzVQeSn2RsVqk70/RrIg/Bwzukux9RZWzg/U/HyI+h5XdT9APE3LarNrY4E3zEIMicAJ57TgnX+BJzgRqMqjghbnuusmilr94EFdYVsNUvRzSWaUVar/aVMGnXSUrQg2VoUlDoYPIn5/YpdPANaYteoqVQ81pwEbiV5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQA4SZub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/46h2os; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQA4SZub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/46h2os"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0g7t8869726
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=dQA4SZubLDaiuBxKUYiIq4Ybr6w
	9vB2BsgGzSRGwKmTIa9iWQcM5nZAKHTxfTx2e9YuMUbKkoC3IBGhnFBpy8SLrJnB
	QzbaEETN2tXw3BA4daapEWSQT7jXsxCn1/xI9emN1K8yRXpMil4Ib6+ibHd6leQ6
	EWS8pmarloLtU50t9Vy1sL3S4mgZOjkyPmYGPAe3v53WDWCTNlgw+qjc5sjWNZEx
	wUnjMcO+lfHDKU91JWbb4XAMgaA4ZCHngjFmeXq9d+Slkyt9DE0X17yLdoPhZhnB
	wC5LEhbergpdWw+A2We0mB0GYiZP6EBrEkXirp4Jwvx3BhVz63LouU/A/ZA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvruc85c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:35:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so518824eec.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 00:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411241; x=1777016041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=D/46h2osfECa7f8VCcsnBkxoGZGbu0j5xGf0GhvsjUmNRhAh5UMBHuzhkp8S5rtNGf
         m3D1p/jdMpUKCk21t/TLQeCs77ScJBPFLMYrCISudXNJuRoqz/r62wueO2QaJVnPMnxj
         7+fyVusTFLBjvoplek38ZlJCJm5QSuuLbpwzd67PKoox6iW7efCBvMRfB4QllW1zMkZW
         PnA4mSxz7/JPCSndDxJgyYqlgAA3BNZbu/lQa+j6gvaZ3riFInEwrzFBYoopXcRNTuQ+
         TrSZI2XB34Z1s3FGQpV2tljgtTw1qelMeW787nAUDrfcrDGRMIErZNRu9BX3L7nkRa28
         N6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411241; x=1777016041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=B49qBABQ5d739a0JjZO+W9p34eZIj63SQBmnvL5JLN/iBmsQJqmXtnRIjhy2yP9WRp
         9Zj2RezLEKC9tcAd4ibw4OXPkvY+2F2XCoHG4L0WcL6xSinMtSNewW/wvZ5c9ENS/lPk
         P1v9E5lumSKeryzCplrGbqCGsJ8pX9E+Mg5wCssylgvnnjQDgNVJ9beMAETweHG1kCku
         9ldd8i6CjmXFQO2yWEIM7UYVrptnuYxYXezlatSeJwuGkEB7oruqKkPlb99+qnV8dbG0
         Y1CpJZXmeOx/RxZdq5230kKnjZyPP4/shQ0STS/FrQ1nSZGAMssXvy+oau9AFfOwjet4
         jgbw==
X-Forwarded-Encrypted: i=1; AFNElJ/X22adILH6Nd6VR1S+++6jY/hIlVLjCwoN+UtC6QkssUZKMAXYk1yVB7/Tj+VCX8PtShFL51QEKHH6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0VQiTZlTvEbx7bkF7In8SO+4GuqptvelTJnyOA/mFhHWDvPTG
	L+6Z68BedTZ9rtjAcAJ04l5Y4InDaDKZKcHNXQ+ucbnJCM2Pg6+itkOcFGbV23YFV5a0aMhMcUp
	ID3kfExYNeSfvs4nTaoyAg3OSTf9sl43x/EUanzkoRqp+L0J+1kjA6EENeClsyMVtfdhR/E6M
X-Gm-Gg: AeBDietr+qPzlaMmhv/8+UlirUyhA+5NnFHLnPONrbDNl1DerPP+LSg0iGWEogJeQ4y
	QS7V4vBmJCAccjjsSK4fEybikBAXiAKx8X+6oxKRCJf6fcCXqsZfmDloPkpt94U4qip7oI4JAan
	IXZm0dOriq0Vwu6h/LSxxT4NHfnVW4DtOklvUOZLt/ZsrCkwm7cG5go2Aji+SbXQTnVx0uUoNgB
	9KXG1hMjEAFsekBByLvqdzz8wZoLHG8UlKjcjSGNSDEQRws+3tMLmh8n+4lka43j53/oJQGQZ0+
	WWdWAtP0y4pd/7x6lTyzPTQSW0a60yQqSCUtewpJeMz9/wUqnQwfqYcnubgv1vReeR3WuxDF+14
	KmK4MLl0R1/tMbX6GLkR98LQMhEiD9e1aVi/du+eZZmdGeY8Y8bp1wkolkrFXvmYCz+dWuo7TCx
	I8lqTNb97Uun4=
X-Received: by 2002:a05:7300:6d23:b0:2ca:9b08:e7d2 with SMTP id 5a478bee46e88-2e478a34148mr814621eec.22.1776411240593;
        Fri, 17 Apr 2026 00:34:00 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:2ca:9b08:e7d2 with SMTP id 5a478bee46e88-2e478a34148mr814613eec.22.1776411239982;
        Fri, 17 Apr 2026 00:33:59 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:33:59 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v14 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Fri, 17 Apr 2026 00:33:30 -0700
Message-Id: <20260417073336.2712426-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NCBTYWx0ZWRfX9+kYbbqETSY9
 2bDJxzj7hTl0j1oTr1449S13qz2+iDFFsALKRdeBwSGr9oZYZcGPutDWxIjlMR5ri94YFwFfsVs
 omPX69f6uZAjsTPFqXsVXnpr7XP4m2p+eZQDdjQImp7KyLRkI5uXHXa9qgtIqakQfBAmuAS7mTK
 UkA2PmBkwGcV+KQfkH0jnCuCUXLn2aJQe3z6qyjoooPlVtk0ZV01UY3ypTKvdXwWNMjJmsS1AiJ
 hzZS4WlCbCqDbiiKa9537eqDAaCuTkeCNoZTAhXYQUlNJ1pes8UL3SBLn3lYrULug9O55BDKPba
 hu+X40KifDVsEBHr4TJ1zBbR79DUjR2CFF51s9S5adWKiWTNZ25v2VJdPSt1Pz+o3wsBWf9M1qw
 Yf6iS0OpnWHYu+V86KvFB7wfviduyny9yn6E587D9RXH7regUs6x5VXHODYgIa4lm4/NIP0PiED
 Pww/9jNKWtTkelgXamg==
X-Proofpoint-GUID: szqwAnqdc-BxpTaFafJ61y0je4Qzi5WT
X-Proofpoint-ORIG-GUID: szqwAnqdc-BxpTaFafJ61y0je4Qzi5WT
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e1e2a6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170074

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

