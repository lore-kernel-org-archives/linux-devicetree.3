Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442B39FCCD
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503481; cv=none; b=LlmKSwPXzaMPcT0DtNNK8s8BChUloHHn5dCwCwoglRGHrjIZ5alfVkICGr+x6JKpM1t0uRnagH1aNhx9NnVO2PQjPFes0HKfLFjhmYVyY8QNXkHTCe1TJ5HuSxsQIvvRYeTNBCp599pcBMpw26++41jqIeufkwxq1daJjtA4IQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503481; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDJMEvJR7k/rXh0elpiSEgnfedLi/uIIT3OstH38SX/GctMJHNaOKIWsLoz6UbGpA/DFHUffHAPx837jsXeWDhJYSmAHcyQ2IMjAnOGr1S3vXphditjoTqA4OBDje0Ns+ZI86yR3A9aUUXP6QdTauH+fdpnKTd45P4uxSoB/KhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkDjHxjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqXiQj4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkDjHxjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqXiQj4N"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8I72X1850699
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=MkDjHxjyTMIt61R2
	za9VUFS5uTkWlSCaQZu+C0BoD8BuLB7RXbpVT5qKEVpHIMBIYq7EXdDK8K6B35wk
	tCDnJ/OObrzgjiqb+wis9lQ3tNFLCXM0anXPyBe2bHTq6QVQGrCEqNPUogZp8euu
	5zJ+PVHlWUisX+XHjCTJxuRRg03Pt4AEXvitc++22ejCj84IZQ2yqcjpszpfEE1N
	C3fQWR8VGOs23NUndE4pFqZ4lO97sq10QxWXfZUYcqfa4M/Ix2R/wtunl9GJKupO
	sQJkC8xFm9BUILhq6TmQIZXzg1iI8+hXkpa1TJ3ipHtSpj6JXRFaYUBw1yZ4ioGJ
	p6B9jQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3bfvgwpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:44:38 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bd6f72e5aeso53590647b3.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503477; x=1779108277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=HqXiQj4NG+qTDYdqzV50NKnFI09Zo2G/Mng8ezwcAvH7p5/3IIENQoelR2P+4xypv1
         oA9OdMkTIe8oFpbD8Hly3jH88SKQ1rXVoam3PUL5eUOF5XHQkH9q52/wk4SGhByiVs+B
         E9dXEqyEjn4SbC8Xr7sYZ1P2QFhZUU4kW95zcER49dX9mT+doAOavzJq0hUeNkkhdgwC
         xm+qxXVtZPsxAjR9P3P4k/Vs1xPUsHSVjMaw9iZPodOHgdkLlr2H/izg30CcFZilvroX
         9rydW2BeA8HqJC02b6yeBG+pHrr1M4xq/A2O1coIZJjOXyn4i5HNcVugh0byH2A/G2J9
         tAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503477; x=1779108277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=P7BoTHNQkxOGFTeiSkqLlRAXtIxuT7sAX7d1HS4UrXrZJZ8U9YuZu0SL7HOwuPfj6J
         liZRhojx0Czy2tCU1HmnUNbtL21EF+7KGt/MkH0yGyX4VyWjEw8vxBI3Sde8Y6FYH264
         U8qNFefJcfgMriMy/B0vngVRe2MjAGWSizmQfXQcJht1+CfTqKY40gfRNqe4a/UXXxA/
         xmZPOOX/AnnmJ22Kujqey965FP4yYESPLOQNEYwylqufeapk8SGniLWZ7eSgP3n5i3pM
         iupfpbORcbEtMtMnQHaMeyQClwNXADr+xPnuSAljh+XAGM5Z3KRaQNhjf/xhNL1UfDkw
         4tOw==
X-Forwarded-Encrypted: i=1; AFNElJ8Apd7otsVBYm/lhV463eeiuWIPOFjBeAm5DpKF298sBsyxEdvozBqcgQDNrgHXpyapkbrSyokFgBYQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxUfbwAwntMnjtQ5Tk+nyV8JPGtiY/nl17MZd94E4HgkVn2D2Qk
	7Ur8T6xH/NQ5jrMcN7+lKN/MjLH9xCEVi1Ahf76wWeKf4TbUr3189Uh7vzCxS1mfI2h175hTmgb
	PAcG6lzT7HrfyCmedmWQYK0B85pQFEtWWG9JkJ0OppVerhC/jtXQcbfYUhdHf5jP5
X-Gm-Gg: Acq92OFxu/QpmISwhHjP0oxl+T5pvxA/pO6X2nvSWl9e99qa9qc+wNiGOVvhjEmLIws
	7ijve9PdBUfYxt7E4tNFrCCQUPrg5wkV9jrP5hK8AVDg3eIui0g6dHFUeP4owE2XmJp+KbkIpAm
	d99SVCBjK2pfxzxZlWJtCCEGTbo0Elxgcy/jFbqx9ACBWo0FjFJ4ePzbEd1WmiKPCPc/hU9dYb4
	I/lb3CH8gzOmvm64zqT7hYRsRHRMX7jLky0MeD6sZy1rWH8vSAJB7X9PxVNPGFhxWPmd14CRaL3
	HAml6cL1FYbhp+rjwtQyOjduXLTAlIddrmc7GiaZW/wHizyLb22Yq68B5rqAvwyE+lxy/Ym0nYi
	CyHHuTZFomv4onGN5eI9daL3oeSv0ESRf1brgN7ceYqhn5umPCFb+dhI3fWfSTxi1xKTFs7kJfP
	LsaVlI9dfYPo49dWaMaPwVVxisgMLlmJjOiA==
X-Received: by 2002:a05:690c:6989:b0:7bd:a6ea:c508 with SMTP id 00721157ae682-7c104dab240mr82943317b3.24.1778503477423;
        Mon, 11 May 2026 05:44:37 -0700 (PDT)
X-Received: by 2002:a05:690c:6989:b0:7bd:a6ea:c508 with SMTP id 00721157ae682-7c104dab240mr82942977b3.24.1778503476919;
        Mon, 11 May 2026 05:44:36 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:36 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:19 +0530
Subject: [PATCH v9 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-1-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=FCKxXhfphZfzNrqt3+fgaJMTaJIkPxTyUKk1I2quUplNtgZlNkRiJFkRS+Erh/joPXZuPFGRi
 nA+DuAdTtQXA7FrOkEGSNkCK2JaHd45xLiw55hQB25jfFuhnaHt3Qq8
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=Fa4HAp+6 c=1 sm=1 tr=0 ts=6a01cf36 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: STxvl63P6f19ZpFGqOGtwv2dY6_kWSVT
X-Proofpoint-ORIG-GUID: STxvl63P6f19ZpFGqOGtwv2dY6_kWSVT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX59j2z+jgKbOd
 KyarLmvEKbMO72Ekd6OWzumQ8Qtl2LVntauvFOqolwTWLvpCgX3FBCUQTgyBG30TUqO3CFs+mIv
 XrDvoXtxGk05osH12SrN+E3Qv1RZk70SQA/JTf/KVaksP1MDA6EU7TjACMCFlr8bb4N9datc7G7
 I22KgVIhijCYqTqg1cTA4LHD1uq2XcqADxMbPAeQFBJQawVuNcS1WZeqOgGAeKO6xR3VG/X88wy
 VZbHwnP00Ir6wkABmp+S47DbAfzoycL7CXs1SYwsdRTxwPY2qnxCSkIBzzOT7TxDhH7bYHm9dAj
 Mws6LKOJwP3ytZ/OmWWXktLCqbNzCBTv3Vst9nKTcph1a+bcGIRB+HzyuvWMI5KkMbqeXAcKIWR
 F8DRkulVEFV2QueKpl88Ox3c2H284rdcqyjzHU/DRlzUpNMjLn4hxInBny6mShDUGghxO0ehAKv
 P6QkkgAvlPSJCTE3uRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add description for the EC firmware running on Hamoa/Purwa and Glymur
reference devices.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
new file mode 100644
index 000000000000..ac5a08f8f76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hamoa Embedded Controller
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description:
+  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
+  EC running on different MCU chips. The EC handles things like fan control,
+  temperature sensors, access to EC internal state changes.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-crd-ec
+              - qcom,hamoa-iot-evk-ec
+          - const: qcom,hamoa-crd-ec
+      - enum:
+          - qcom,hamoa-crd-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "qcom,hamoa-crd-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...

-- 
2.34.1

