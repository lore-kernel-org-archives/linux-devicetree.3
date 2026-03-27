Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9653AA500
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606110; cv=none; b=hDX58UboC+GbAtFeuQqoHMsHjpHh1CTJkT7Xhtwey2K7zu8gxNrPqQ0mlncdWP4eaFw+VC3Vgt8paDSvBjEg58PcCnoL+mL+huM4ZyvtUHvUHyTltNKts6jD9PrarAF8vKXb09eX4Rl3d5XYjHLNFZQXPr+wD8Vvhlb4alTkTIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606110; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drOaxXufm+MSx3nQcPOTpyz8McrcOJsof5Nk8YlhBHEZ67hrp732h0cZ0HQMwgVNKYklIlbsb36licN90SxqLCoHHzhM0iW4xkgZKFyHgBSAQpgSiqXHa3nMwF1PNiGgnMhbLvODr/yhLoKjk/PQjgUXJFNulmzHQbZGDEdTzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c55QlWZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZL6nmuwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c55QlWZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZL6nmuwT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3XT1860238
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=c55QlWZTIqH3kt0b
	BzT4MbUejVF5XT9ecsnKzSZOP+eUw79msQgPUYNjA8+bFexRV18N/ijY4pH50LLw
	CCjhajW5SYBJU//8y0DcSwqRsQ8j9AEM4ePRAkpLSMCnqEU4sP9k0Ud77E4AasBW
	shzoMTU6CHDGeXGn4GbOmrTsTjNeuPl/6cUx7SksfWrkG3Yc/FjdoTEZ6sAXwCla
	i8nr0GUIYFvmpKcKHJqbwsKGwfp7iSUG6lcmYQRLHuissM9kowGbIU/5SltnqTsg
	Ke0fZg+v6y/ZdKcrWzh6Y9N3p0RiAB51zvjpfw5kFQLAtnBlxwSLczj2PlfW2g4Z
	Jj9zUg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2hru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aebfa0af7dso53440125ad.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606108; x=1775210908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=ZL6nmuwT52ofx+3Jc8kS52AOcLIAdy8efUxQ/GYnCEq1fM18pjP9ZpljOY3EDW5AIR
         jiPpAN1wQWGrdf18YRerl1B8V9OXcfX/2ezUN04ynkiuDKcbP5hiKfxgO10nywgcFQEi
         HxNxOIdy0jbl5QNuSUraLD/9Dqn7WUJ2dBxZTa92eF10q10fvXJNK+D8piB7D2cP6BYk
         t9suRedfQHBt3XGIb5z1UqV8uJHWBgQlHF32p++bC64ryk4j56h8QHVj+wdTJPvmvs4S
         cIrcxxF1dlCD54i3ADECJI7pLCXFxp96SBg/DgzB1iSdC216YudXZsGuHHaHwyURGUU/
         WGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606108; x=1775210908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=mEwNYCZDsR047uResxUN2dl55oSf9imYONmgrOKF8VQpl9IBi27l/JC6iHNGuReNKi
         g4FhVeMBkGPvnRAxuVJwN/3foxC0b79cU1b5hLd3zgNUGLvpvdVNuEqWp+4CZ2mePuA2
         UNW/h8Ixzgf8JugOMXRaSzcK0+UZufLk6Tm37PYaveCQNdF28Za1966Q5awuUrAABWQ0
         guaZodA2Ig7BISGaoX9tsgD9qH0NsazqComK/h/xamGEvsrq7suApXmv4zUTg9w+jl+8
         1miBuDcdGdrzxQv7dDQBvbFe83n3di7n9v9w6uTwsFzaURCq9gkchlOpsO3EXyFghhDz
         WTKw==
X-Forwarded-Encrypted: i=1; AJvYcCV0AdDwiIs3bOOAec0uS9Q+wxuFwBoH/BUbwH9XDOq+8rrMi5LgrRORPjfFgxaakfu3CeEPrxz/hGl3@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbCxFfx9rg969SQ9oH6EsjKWAneaz4GZXh/6nGfk3aR++C/u2
	l9FgT42OnMLKeG1hBnHfbAEwQc5gBMr1Ig3bDllu3KMm5GP90DnJvpeJwg4wHT2fi6JE9C0wM4S
	phzlhKvmgIzS/YAfV5nspyeq8N2Aflpuu4N9849UnZzqPEm91qS6LRkTZMA7dAPLt
X-Gm-Gg: ATEYQzyJ1ivtYwSUxmk7qgBVUi8CFXmxHi1QpRwrhxhGkZsiz1NGRTUJeNxgQKehxJh
	R1kzqQ/2hTXj4UbK5KK0JL7yVEjykIuCqJOEhCn2PtRHKh306m4Zb3OinkCYEd/CloqqwAdpvV2
	GrNRDtv9F/aMdjXU1xJ5JO7bUx8DozH5rNojMT8XCsXUh9ZYj2aNkid6pqkdtcnJR7mGMC1asry
	VyOPj9Fy23cD81ai4BuEXp195rNqPnjlMydaWGdpiJ6NfNNSSZo+k3crhyGdspdr+zMDDQyMXCV
	aS2hVqOyUjrlUK/vGL/sc9dZ1o8+nD0uHBAw0NMZqoqJP89hRBpXQgQHJxYzKidBsdfEmVvDEzP
	6Cjt6N/lHYn3gOH7i3TCHXlwvcKGWy5RXtE8dh9yQbeyFOzk+pyNd01yymQfxmEZog03Vkz4cMO
	IqjnT5l/2srn93M0PEv2Z6/TpRU7TBMN7B8Q==
X-Received: by 2002:a17:903:4407:b0:2b0:5e10:9dbd with SMTP id d9443c01a7336-2b0cdbeb419mr21200165ad.3.1774606108341;
        Fri, 27 Mar 2026 03:08:28 -0700 (PDT)
X-Received: by 2002:a17:903:4407:b0:2b0:5e10:9dbd with SMTP id d9443c01a7336-2b0cdbeb419mr21199805ad.3.1774606107878;
        Fri, 27 Mar 2026 03:08:27 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:27 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:14 +0530
Subject: [PATCH v7 1/5] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-1-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=ibsuvcDp7Sci9hgY/3jUzw1fXjDiY0ZejF27wXljaMswnfyugfwJ3uNG0dIWxoB8AvBUswIOD
 tEx7k/gH9++D2t9Xkg/+d1HwaTmOXDWXfd8TjfEHcfAacxuUgEvO+ZX
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6571d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: nTXyZ7_3pXGmH6H9bTk-VLEK21j8Rmyh
X-Proofpoint-GUID: nTXyZ7_3pXGmH6H9bTk-VLEK21j8Rmyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfXzwKIABXzybxS
 RZ8DxlfbupE2xLrrua+heAwK4T9nE5RlvFiPUlM8FvFcOeZGQ5KpHywAISHnz2rd5pLzoddBjB1
 ernpUTrbckyo/CypD2Mlj1aBXa4WV6kJp8G1Dl1zYCmfe8u8zi/aVeShiy6XB3PovhcYH2gqojq
 ZTW2+00SCPtwIw2SgxkvrmOWq4Wefrt7+MUCgvvqCLCdy2wdvV2X+WptizOCNpzPad2CDIXYEhN
 6nyiTUJJFoolJiNdrJbZ5BksHTn5PFFUVWdydQGkjwy1RViOl4KZIZmRZ9ge0J/U5Lw9gPcpeOe
 VXLkb0HeBzzG+NoytlT8CXKnXUFZkre3taDm11EJfzKMHs++5JmOt7j097Uf6K1Jla13/TiuyiW
 To6v9vxZz/6fUyyQmgsclM+DQPSEn/gkaeE9Km3CW8U2fQ1U+Q3Tn9+9KjG3SlNqGJb5PIL/LL7
 5ueS6VQ7GaFsvj3mb4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

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

