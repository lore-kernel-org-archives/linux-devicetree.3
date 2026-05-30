Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E843CBE69
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165726; cv=none; b=tGb+ADfLGt8HGoox/9uKZHWckiziUuqzRl69GtTMFCTtT9TuA3d/2K+tz/9PSAeqmZOj5AMlfIlgvQtXtyS489jfIhQfkY143z7oXm/HNKBRNjwEc1hbhXLwbVVKrx6wgBTYAo6/pORqs9erdyemAI/QwRdIumPZnLyazuRlnDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165726; c=relaxed/simple;
	bh=vtH/fYxHW/XKO4yiyG3ZciHyofKNFTseYo3IhGupIUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDx98niJ+qQPtJioiQVZ2kClY2cNPp84c4TNXr+W+ZA+op7S6dItpHe8mpe+Oh6OACjAaMJcRibSJ7Tmnm5p1dqXa24l6anbe1LJAC7ec6KbqFr2/OTz54/H55GagpQkOrHDye84dfeoQ4SMrsey4AbvvOwiyEqc3s93q6p3e5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etnj3zXr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdYuPS66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etnj3zXr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdYuPS66"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOSMl3071465
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR30QZHv+lLBWravcP8qPIk+O9IcqL2hfuXUPlb5+5Y=; b=etnj3zXr3n4WlQU/
	UUIXDTOPb4JHXAtDV0Ocj7ekDGPLJlW/60mhQbXmBRIPlKcAew8mnWyaapXhqWWu
	GeUFToOaYXnyZmxqAyzpSJOyjM2PJnDwp884ITb47SpRLIhhq3FlSy6cSwFWlU4m
	tmP+tykjbbHq2JzCWLk65M00uUcJYTzoQRjXULfpHxYLXxrPbnqsbcRH0Yj95R/7
	1pvWRreIoNHrla9yFjtvhNvNYz36StDkqvVCcym5WkwWi6e+Rulc1JDgtyM3+YFS
	o/Yn/xuon/6Fm0yBWUESqriakh/qhU4RrD3wxHE39w1mmduA44M10rzsClmyGtND
	blWCCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pj9q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so9052195ad.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165723; x=1780770523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR30QZHv+lLBWravcP8qPIk+O9IcqL2hfuXUPlb5+5Y=;
        b=WdYuPS66Dic53USaNNwDkdRuvQr1zN6IxBE1etWRPsvCnuPVUgXdOvcOvr92c12XuK
         HqSNq49wRZ5w8n2aDsJGsS8DuWSHGVGcTvxiUpYkbOmEGIrv64bkC3OpunXb7uwlrkVZ
         PlHhuggrQ6I4DcJXXQDrF/K/6lmQ+p5FQWKPIDhigbRumBi9+fXSZOz3mLC6aFGLaYav
         /758lp+V1Aof54UR2W70gUFiVf4ecmFz7TXn81PBwBUMBGfc/m0JTj57DM14uQ63Wrux
         unxZMSt4v5st3xWjSLHhWS3FF1vL/ObZJhNps6wLwvmDllCOlOH/qswgIGvG1K5Ltcbd
         uU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165723; x=1780770523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AR30QZHv+lLBWravcP8qPIk+O9IcqL2hfuXUPlb5+5Y=;
        b=QWKAuq6KEu1+tSt9Iok+vamF1nxBRt9mqC1Lc7vdUwFVL7p6V//6FtHKaquHA1Xomn
         0xwJhIFgrnFe26iOKjAwXdJ2AyGUg/siK2ZQzjOHOgvRAkuoL8erMI4P0XgA7L6ZFp3/
         NwJ4cNCYwG5jZKyExqhDDwurJLUOfNQb7wpBAG4FMPZk+wqbSo/BprGmRuaJYt5OpveD
         30HO1+EDbVnfYwVHR8y6SV7VOeSNoSkxEJarDikS02INu+yOp4F6Np/cl6RpUtFesQyV
         A/MTZMFhAUdaHLL+x0/yGnAmANzkLDFWEDimc1M+5WGpTMgm1Gyz/98YE7G7RIABayMF
         v4ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8NhHZdI/+udQaiF3G6BthjiWlWOLCIYaZ+gAA+NuROJyPe18Y3hWE0YnjC4s2jl/1BNsxCzorP97NL@vger.kernel.org
X-Gm-Message-State: AOJu0YyodPSMIEoCuB0vREx9ogHawvU5Z53NNrIXgg7bcS6yRRBG/Efo
	k84STlbbjj56Xm3JPhq/TNFdUQtO3GLjdspenT56M+meNOBEIaROj5mCYSwkT+JG5Kb/kwVo9ZA
	hjckP+WQHNwsA1k+0Bk7VX4tgZqsuy8rB60H6zs9Pv4Ecv2ti3Zd8N996Ann8q7Xi
X-Gm-Gg: Acq92OGNMnNsBOs7teTVIJUkd88//pf+xYgPLgoF+OLmPF6bocpIdqghl4Md7LnHz9P
	mZlbV3l8nJ+x0OlrA4G+pZXPaZTRiYVhCyRnp7SVUnMgP52XEyKdSLuo+setzK/ROfD7hyAWAW1
	YHWf5jr10UpTXpL/d+UaMXLimkLKhoBOvJA4ePv7a1Ajc/oYcYGfBGoi8o4aSz0VJv+QlKm1Lf8
	r3+8nZ8Yoe0wdL8WF/i7KID84JfU8TSJFFO+TJ92ILigQ2ZuEct4DzRyPkxz+47UWiWT9g9QUmi
	th0INWJMnAn/E2aHsfGyGePuSgVmOWFldQv2DZFTzTKQUtIWOMFsXm5GAlcvvFhBLq+ZGeIEuMD
	1jyovBSb9LkNFvWrAp/f+fLzq7AhKuYgEJfS5gI6hAbFkPMv4C60Xxi6uxtrtOp0P8Q==
X-Received: by 2002:a17:903:1ac8:b0:2bf:276a:e0c1 with SMTP id d9443c01a7336-2bf3685d845mr57629885ad.31.1780165722918;
        Sat, 30 May 2026 11:28:42 -0700 (PDT)
X-Received: by 2002:a17:903:1ac8:b0:2bf:276a:e0c1 with SMTP id d9443c01a7336-2bf3685d845mr57629535ad.31.1780165722356;
        Sat, 30 May 2026 11:28:42 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:42 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:58:23 +0530
Subject: [PATCH v2 1/4] spi: dt-bindings: describe SA8255p
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-enable-spi-on-sa8255p-v2-1-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=2539;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=vtH/fYxHW/XKO4yiyG3ZciHyofKNFTseYo3IhGupIUo=;
 b=e/GTEleHAJLjyzyZimMlSqidF8KX4InFfYKU75ozr78XEEj8bdFBWfpMnA/dHeJfmkGLvktv2
 9avRqfDEg4PBzFO6nQL3OXODZVQTxeRDFt5HOfVQeClK2ERAaFtD8+S
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: wu28FcCH8dtteyXj52JW8oW1qb8Pr-_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX17A6IfHb3WbY
 P3ux3Q8x0dl2wOY0aEYVgjNZLUsMrxnc1eR4j/b5mduc/tc9/fq0QOf0j7AwFFH5Psloq1+CBtj
 e2HKRWBvMsnsADVHqOrM6vuI3Ew4CPhw8qEA4whgYB5DR82tdcGWJWHxLMLfiVQehxYseKhOaWG
 dQ68rvnohWEQiATzKKOapPEQ+rlrTzoShRk3lp3S8aD1oKr4TEIYofjlRqJgJAplnuCShk2bMyM
 gfsLQDPuWMTAopDCDHUd01sEeC9EaoGp+vieFLbEK5Pkuv2jehQ3y7eoQ2DQjjY50+JWNY8hOYJ
 5KIwyR+w8jXvLcth2EmdkcxGwKUZIgL7YvCROtgH9ZdN2AwhRGcvvrMoVXqN4sMLSYWMCTqJMMq
 yLRuNHIFqJonfE1nZ1ZX6ZCBrp5CD30u2c9d2SqUA9XlSIDmISTXOWokLoXlvunGtPJGM13gILr
 aNMf0ga+LVziCwhfmSQ==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1b2c5c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b8-5IbU7OP05I74H5fIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wu28FcCH8dtteyXj52JW8oW1qb8Pr-_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199

Add DT bindings for the QUP GENI SPI controller on sa8255p platform.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
new file mode 100644
index 000000000000..8c6825b8ddb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/qcom,sa8255p-geni-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GENI based Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-spi
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    spi@888000 {
+        compatible = "qcom,sa8255p-geni-spi";
+        reg = <0x888000 0x4000>;
+        interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+               <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };

-- 
2.34.1

