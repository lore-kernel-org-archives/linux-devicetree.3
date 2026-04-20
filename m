Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4134D4E4
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702595; cv=none; b=iY3fiEkAee1Pofq7Jm48bxNZs7FCZoi5rCsf+3bkb4ABTT6gCoqVBkkl7Od34FRt5cjpYrEj58bhJV2KiMHzLLnh5fGmAdawCCkWan+Erx9VL4OWJjxc14B8omdSM1DEhf2tUYQnLRyWhYxOHh0kezMkxXrkefyEihIEPilqPCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702595; c=relaxed/simple;
	bh=8++tdoM0bWTeLdr+13f1de1STU//f0CmIo3qeR+11TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lf6T61gslosHSM+rMRlHfX15MtMz3kUxCY0HvDCuXB6Mc2eqAnGmput0riMc15+Osiwmuq60Hxr3J6gnYDz/VdKQ8c2Jq1G6T70Ny1dtQ5Gllty94q7hW1pR08Comw4dUUM6GOKG8nq+GpHkLM+BSWggI9tmct+Ypu/pRGGcbQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGwZpZQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ByIF8L+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGwZpZQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ByIF8L+F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCxJi53455879
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=; b=NGwZpZQUD0lILMai
	HZHCb9ZB2WT/xlJ3skwW+zG/svWFPK6ZYst4BGXPmM9kVV2IbTuX3IX4COQXIltR
	6G0SbRqPmU8PaHU6Ucc9hTKnk74kKlfqA2TFWA8LTmKNYNNy+LtqlvvBU5Ismpt8
	FqOSpzaNPdqMr31WFqWijmrUoVUTLu4tqtdcmyybhwgaha56whNMn071yE7f4cVN
	Dn50dEDqnmU7yBfjQZ0cibhtlbHao8cjrAwwzKv15+4LISWLzlEltQ8wFO/J9bEC
	jvEkL4S0uAtvND1Z38OR7g1jhUd27Y0dSwie4AQwy25j3T/5PjKDnwlT/U+e4wj2
	S0fd8A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjt683-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:29:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so3709013b3a.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702589; x=1777307389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=;
        b=ByIF8L+FI7mzHZpHl1MshJwPoPz4J6ojxLcIg4D7KPoQD6KBhSaqTZBEeXBr7NZvhm
         MgxElxhZiC03jh0gT0JcngdMHZ+A34JZXvyeuMpj9amAa/eK/VWWljbtEuf8WhmBRhfX
         a0lsBxDaH8mowUHEh+8sVs0xrSXTkv70PbHJEj2o6PGSGbR89vrfeOQu5IgpPg/8jUSo
         os0UH1BF0riJXVyoJQwuzoM2KRukF83zoj9vT9ZGNe8cO6ZDGlY31tt+ULZxR3wfyhzy
         c0OgnMo03OoxqH5WPHAN3UeQnIbBz0luxgYQNH5mbZjgMQHCDhkCLakzCBHQoYwBVnCr
         xo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702589; x=1777307389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=;
        b=f4nkLfFCZMfbMstJURKC3Jo9hcaP+CXId1mBG3mvo83N5EtOmpc2779hZf1DJurhnE
         Zwhk9qWAQjb6NvRlbmTDw9hoYqaGHxf7oksc5aGFWbuhV9iu5BL445irAnl0rcwHBADa
         d4VyMU49B6KZyTzCoqWoYtEK6o9ySiFJ254EH+8CkP7AGsjUkHya7ljyFybIiZqh5vhP
         L6Q4P2E2RblysJ6+n80NdEnT5SqtXcKo704sH7frMxQWaLB+5PHYbfZSknYYivmtepdK
         N9hppLysD/5zHd3oUT4Z0jzolJmMw+1wRMuoV6qIsFxnI4tgtaGWqm5QqlogZy7Kgt1S
         /Tig==
X-Forwarded-Encrypted: i=1; AFNElJ8kBY66Yx9VvlrzEGJYEeaMQTMbX0rZoO1fdwskn5Y8P/bZDbDFp0S9IOgKT6rgJJdHJxJ6nl6fIRl8@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJV3JkQu2rDHeHjLinTrgdPEamK5bYWfE9Y6uiAmCanqDCr/c
	686L3/efNRl7jU9TfJxZIeS5Uy7Q8aCSH03hezbZahAZ4wqoPO2LUJIz1/liktf2MAk+LCbkUdp
	Na8YF7ejkjnyxK8Cz5QkGjAWlIXBOkfW3bn8sDthGei0KjPystbRyaj7sEgeSgodU
X-Gm-Gg: AeBDiet8EbQDqRzHM6E12ZylnNNswpjQAzI3kngdhH42dN3IJKD4EqTaYAjlCgDM4mx
	Zp0d4JZaIKvMvbZPyMn/TkYrD8R9vwKEEV0acpZkstdLAa8rRqnU3ehhois7KaQYi0PrW4h6G+x
	NkZ3JgdUZ+mRlVFyN86Ja3uVy9XEgVYUuL3nl9mGiPIehVJCFe9MOZtDH+GsXyAjq5q4kcg8Q/O
	5TdWQMeaipBT5PH+KeAQYMhhs0DZiYva2gkHwykfaftdtkiS/dx9vJ2hr7eVrMOHU3WeVtqZXzM
	3h0B7pEAI3chTSqhUK3tefHUxnFHYNVg+Ee3/Sd1dnUgMgmNF65wJa5Xy0JEKRTSLL1pDQjseYu
	k17rjy+b/hI9DbjBNvHmcrY1gp+N9lKJJwlps3QeT89hAtgqWMhODP29GO+YKT1U=
X-Received: by 2002:a05:6a00:2308:b0:82d:162c:581f with SMTP id d2e1a72fcca58-82f8c97c71emr14267598b3a.48.1776702588710;
        Mon, 20 Apr 2026 09:29:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:82d:162c:581f with SMTP id d2e1a72fcca58-82f8c97c71emr14267547b3a.48.1776702588152;
        Mon, 20 Apr 2026 09:29:48 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:47 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:54 +0530
Subject: [PATCH 01/13] dt-bindings: soc: Introduce device bindings for
 CESTA Resource Manager
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: kk57DApMB5kSvwpCX_PMf8q9JO2nmFyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX+vpJ5NbVPh/8
 ZkdXuD8dNH+O4Lt1lliYCXmmkE5xuIXm8NXi9BJO+I9zkC/6nSXDa9gs1R2O9NuiDRIaZ1bSLt0
 kqbWsKeSKE+qcaz8ZOxjp/zJpL7xN0RP1WiKw+7dVhVit6DlLxgeJlEDzZOApEvY9QSMqGXc692
 0Foxi7k0zGksh8o60Cm5xu1SpEvMubuuX90HlaAoS8RDID+Yb6J4Fwk2EFhtScQZheSndqVLtEU
 6Km5cZMcFUYsE7tkV1uYEBarYMDAhcgTAFlR3IbbpuN9KUvof+yCkSs+wDvlwYe5ja4zUmE2nl2
 r38wSO6LvmCma3Vet0XP+YYVu0n1+F1k7sF1Jk3rs7uBDl9RBZ0VLa8KCt7MuM/4R6ZcFdW+9OS
 yydJOamZVr5imF7VBlw0ZH7LkZhcN2v+WEvd3xTFmsy48oDs6yU13N4xokHRRwRUmDUobXomXWP
 ha7rtuwyo8/t2t5WRRg==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e6547d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=E7ZTn-C8EJTiI1aftXIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kk57DApMB5kSvwpCX_PMf8q9JO2nmFyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
CESTA (Client State Aggregation) Resource Manager which is responsible
for client side management and aggregation of local resources.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,crm.yaml     | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a1485db8b7476b0cb0b4e8a41adc8fb4092b731f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,crm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. (QTI) CESTA Resource Manager (CRM)
+
+maintainers:
+  - Maulik Shah <maulik.shah@oss.qualcomm.com>
+
+description:
+  Support for communication with the hardened-CRM blocks. A set of SW
+  client Direct Resource Voters (DRVs) in CRM provides interface to vote
+  desired power state of resources local to a subsystem.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8750-disp-crm
+
+  label:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    oneOf:
+      - description: Specifies the name of the CRM.
+        items:
+          - enum:
+              - disp_crm
+
+  reg:
+    minItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 6
+    description:
+      One interrupt for each DRV. The interrupt trips when a message complete/response is
+      received from the accelerators for the desired power state. Number of interrupts must
+      match number of DRV blocks.
+
+  qcom,sw-drv-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 6
+    items:
+      minimum: 0
+      maximum: 5
+    description:
+      List of SW DRV IDs used within kernel. May contain holes as some DRVs can
+      be allocated to DSPs / can be spare.
+
+required:
+  - compatible
+  - label
+  - reg
+  - interrupts
+  - qcom,sw-drv-ids
+
+additionalProperties: false
+
+examples:
+  # Example of Display CRM device with SW DRVs
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    disp_crm: crm@af21000 {
+      compatible = "qcom,sm8750-disp-crm";
+      label = "disp_crm";
+      reg = <0x0af21000 0x6000>,
+            <0x0af29f00 0x100>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
+      qcom,sw-drv-ids = <0 1 2 3 4 5>;
+    };
+...

-- 
2.34.1

