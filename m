Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92FC3CCFC3
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555870; cv=none; b=k5XgqQu0KItW2m3UcL4R17GQFEjo9hkDETXkCkUa0xLo4lb0xDT2K1QuDI40fhDIsSzwxbUhpsUj3TdBZ4hxnSJP05HjO6TqzAFqM8MEYtq2dFpViwaL4x1M6neMvP8bwUHMqLSTFD6EnmTyllnydNf4uMSYykEOvyoE2+DCkvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555870; c=relaxed/simple;
	bh=mz7sc1Sr+mYDYtbtQQ39lk6ZrrViCbd7vqHVpdklskg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXIArebPhFWUfN9OrcGf+2fsVIlElV+/LYc1s8+o2e3RifykxigQDOtdS3CLH5wk315ob1dk9n5DJcuDGDrCkXmSQOrCsRmGuJlLx6X8DhAQNDVb3ZmezRZSAcM19iSY8+u4IbjpJvKyoqJ6UxrWANaSbklXsAbI4fFP6BVyrco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElLMUu7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJPY0DHw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElLMUu7E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJPY0DHw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6545QAEh995280
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASBcVGm8MKAYNVHkEl0QaEXtk2qpd/tJX2lsIZT5/FA=; b=ElLMUu7EGDqc0Y0k
	caSnvHiclcm6Dq2SX4pBSLgO6baDCctWgDOFI2VE96jfFDZc7f4lPc/6kO9rQhoM
	4NaTjmDxGUUrIeokPJ12vLChuyQqJra2WyqLY7zoNmoE7eiB080wMsHCEpUFOHR7
	IMOH4vA2LVKIvcy8/h7ncD1Cux0Pxq5hIwDYP9VTLZP4coml8lXg4udWrs+E4SSE
	W8DAa6DaqMagCkqi5uCPbtz0VsoP82g9MSDLoGsx5W41CsCycR5PTSWrRwPsoRhs
	UOomdZg3R0CYwIogHRP8LHQc2X+MBKE21vfAWT78RV0AeQwA9LAR4jlc8NDjNGDb
	vzW5xA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374r8jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:51:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842208d5b0eso304691b3a.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555868; x=1781160668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASBcVGm8MKAYNVHkEl0QaEXtk2qpd/tJX2lsIZT5/FA=;
        b=VJPY0DHwUBEraZbAhPq0lj0a551xPEUQbDsghTEyQNebfVa9u+Gr7R4RwOPz4Vct+/
         vzxdJWGTalu2eii0u/USHlOHGYaTYfN7kbppLu+CnlEmH4l7Efr018Ma3U/XxthGkeYf
         fzR0WtPeYID0J+14NurPooHV47mUirT7mbEJZm3uuGEOmHkRC8qub2anK9fAygSU87eD
         Cq8idu+tTd1uN2ySKA4pkuvojPmF7Q4oFo74fOar//8XMa1LIqH64Wke4yYAhYb+8Qgt
         QjN91d+lcrpPtG/UZqxBmChMmEyaNjuxZikx0e8ugCXOHUBFpDgI5LGoGLvmU/QftMK2
         wOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555868; x=1781160668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ASBcVGm8MKAYNVHkEl0QaEXtk2qpd/tJX2lsIZT5/FA=;
        b=BspS5+Pbe7gj6ULkIH7B3XeVSmddhA/htGTUbwdrFhUSSdbdMoL03mpVZDf40VGkcd
         heMJ7jU/G8rBfiDyCTKtQnhXxCXMMYbtfCJ+Pgm81rWHwIrwyHwJZQ0s7xF0t5YfLBk9
         cjsElhVuU0FWJSfHb1OUKuU/b1wK/a31CyegeHTgfGSpiaBtUpyhn6qkB+7mOFqN1Ma7
         +QgmkBisRpNGeX9gKzn5lPg5r+Rfv/f19/0wl+Zwo2Mste0lEZi7358mUCBpQDANTQlA
         BVNDk1wn+wNhlBXAnDDXH7Um1V5bsECYx0x/gYOjpsrsSCu/ngJQZNmBy4LNYbtaEhT0
         SU1w==
X-Forwarded-Encrypted: i=1; AFNElJ/PXLzNrF0cin77cFfw7yFRYNyhlbPi3M76kufKtm3ZNULj67fq2pP8Y9JCqhZg0BVtUHiaHO3TR4b1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhjissv8jAessJ0tY7DSpePGVwdotd/hDuHj5iqDrWY6Wso8jf
	uIRizsTguaBJIcvT/qQocwjf2fmO8J+EZMqLqqDCLBPkMD9WHx5vYuqcEdCDv1WLMaUmz2vUckA
	nJ7okyYsLJdvvj1ng0nFbAnF+sVtcH5BShqFoo2gFNGcVqQPBkvuONyDU5n+dPwxj
X-Gm-Gg: Acq92OEXkBNYmc9ozL6vvwOyCclI7wIGCcUGAthst3oRRI9yg/9QZMY7xwe0xlq9NEq
	IkVfLLzJVaEwuNGEGpi4ZluJ7pYlQWR1MXDm6ZK/OZ2xGkrqpYaeBxxs/3r3oOPRyXmuvgiy9eG
	nrQyhwQdIzIuGAbvcKGXUoaOP+xOK+sHnZB+SxfoJYaKKb6x4oEu2LyeXqD6TynU2TyUjNmasSY
	1bqpoTy78dIPd1hLwfpnK/ZgdcMjp/kOZd0FKwxdgMz+KywSXD0Ub9v8qKaUnzyuTxtO/Hh79u3
	VI9Ea0XNEdXAb8lAQKsZdM0AM2FXzHk/z7GZ2Qbf/JQ6aY184yDceweUE6QohogEM7rMu5OTemo
	90g1w1pBK3prKOJTy1AD/+z4n5WYyyAgCp8UUh/WMYzvPk+kAnAHKBxJnh0tpEGOPIA==
X-Received: by 2002:a05:6a00:2e05:b0:842:4982:82a with SMTP id d2e1a72fcca58-84284f8a3d6mr7192449b3a.45.1780555867642;
        Wed, 03 Jun 2026 23:51:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e05:b0:842:4982:82a with SMTP id d2e1a72fcca58-84284f8a3d6mr7192423b3a.45.1780555867080;
        Wed, 03 Jun 2026 23:51:07 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:06 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 12:20:35 +0530
Subject: [PATCH v3 1/4] spi: dt-bindings: describe SA8255p
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-enable-spi-on-sa8255p-v3-1-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=2630;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=mz7sc1Sr+mYDYtbtQQ39lk6ZrrViCbd7vqHVpdklskg=;
 b=dusx7NPhon6EDMAMjmIOoMUcME1sDXk6im6cz4qrnm3W6BmnzLuCezH9MxyO3VH7YUQShg6tA
 pHkG01IJd69DcM5ztXD1yLVwZoIZZ/RMYIfHMuaMUGHwzQ+CIcHnG3F
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfX8aHlvw8GNJFd
 jlWeT5RgubTob0EVHIX/hSZD1fO+dUVu9HKor/6Ci2vE2VQXUDU7PQK0IcX/nctrQRSq3YpCxnY
 bFQi2BkFXa5J2hKIXQ8toM1jJO2DBtEYjtSLlrc8i2fU+Y5xclyv6/X4K9VZcWT+APgosElb434
 MTFy6BnpfbZQC1QPtP0uznEMhSIywmpbXMaBIIl/dR6XvWJAq1hrXdcBGYDNjWdOyDJqTylqjbH
 brnBG9rRtMy3uQtDFccPs61HKLrkCJF35b5m0nmw5VM+EGhAy7rFoszuecspQ/7KX2DvTPxFnKZ
 7VobqEFnoa30HUq4oWnJi0hpDTQiNVCkvAxnlaUVzyiouEKiMlMM4hyg7guwfyRTyonNZrAdrFm
 P1qC7nhqaWczgsM3J3UUEUWenGFEopLkLGHTUUqZ8dNtnsrD6FB5Jr2Wtt6iweDlXEUC6xkYOtA
 wQty8Kn9aa6jpfS4ODQ==
X-Proofpoint-GUID: WbX4Bh14PtqLeKyyHJOQyeRbebx-0aw6
X-Proofpoint-ORIG-GUID: WbX4Bh14PtqLeKyyHJOQyeRbebx-0aw6
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a21205c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b8-5IbU7OP05I74H5fIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040064

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
v2->v3:
- Added missed dma-names in example node.
---
 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
new file mode 100644
index 000000000000..d9347d780ca4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -0,0 +1,64 @@
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
+        dma-names = "tx", "rx";
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };

-- 
2.34.1

