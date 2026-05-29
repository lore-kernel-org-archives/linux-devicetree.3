Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC9352030
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017039; cv=none; b=AZ/7iMWerh5gzJMo3+3WYev/vcrKSrc40la9+V+06ckZ0wocH3mBpddGcXcf28K1JnuTgMcKQsHARtUjBmFHjkAqrjPILi0DuFCKA/TxaNUH8H1qmTZ+qSNPOIoO7cJEnsvFpqXfjkhGj4BAwPu++Z9iX7uEY0jnaqSNQgbPwpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017039; c=relaxed/simple;
	bh=T0tWgEjR4o6C8nVwFL6x+ia02fTMEN/CzOEGgDTRQSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6IBZceLzhLFN8wx51hGMkN9P12zpmWX0ErcSDRwfLQnb9WuvhtIL5G+xqgUtANHu3B+vhBuqkSdJRozTJZia3J3s1Z+XUXNzO20FI36KQF/KLX9Cx7RuYUE4wp1k+i+FQVYA63PuRKFpospoouPvLT79ur6Ja47Rxa3xD3LVrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1o/TD1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hirY5vkq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1o/TD1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hirY5vkq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKl10h148869
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U6UwOPnfpmq+WbFznF9N2HH3/nrDcz7jQbOt8fV/tNM=; b=B1o/TD1YUUnMVZfx
	XFMg22bhCrYvI+lmNxkrgiWgZkoctpdi0ZIoXjVk1PZEbek7TdL7sQGSqwTaZT4/
	eKgkChLltLc8sLnO5pdhnBXBoj89hvGvjdjFXrFNHUjf0UQ3UrRUIpQQiwoDH4jJ
	92tl3BOiXVvuk8xs7eIZqP9xMJCkpe1KXBagXO2E5nYRzraxF9QNV4wKFL/j8hBo
	Ho7ZV5ULSpybgQ7CJXKZb8uVgmamiHZQ3k82VdbynExZqZQ5VJ/QVPUR0KO/9bov
	EbyVU+EbcIS/9f/ZO4l3VthlflBxi9Qp/TWive6gtpDOJIga21DcsZGbc7w2LsmK
	Zmyksg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1wrcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:10:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304e4636205so889620eec.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780017035; x=1780621835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6UwOPnfpmq+WbFznF9N2HH3/nrDcz7jQbOt8fV/tNM=;
        b=hirY5vkqDbYrEK0mx5DKFfV+mDE/Q6iG5qlNjfWjtigBWI4FVkU4p8zdVsuW0+cmDu
         H45KDS4C8bt+qg8R3ReKYawkD8otbkDW+sK1h9Xs0sqH6tu47AxllG30i00tDMm1fOBm
         ym6o9C9f9ex4bqbD1peDXiD4uBphGFfrtnzOAuLpAjLORUFe3Gn8c8JGmo40LGtGmtT8
         2RfgLEOGqc6/NTH/exlapxFxAoQaNDvTn9aY6TI067yKv8R2DbjFbBMZkZzbK3LE7N4h
         nenBPpmQWmtsvd3pwq73XpEqosqc2oLV36V1/ShA7XAQXSnLu6BR/sJ+VJv6NEjNp4pn
         QBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017035; x=1780621835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6UwOPnfpmq+WbFznF9N2HH3/nrDcz7jQbOt8fV/tNM=;
        b=JPOLU5BKH3uq3n+Czygm2j19QXEV6+TgH+WLKN0D+ye5Sb3Ncav3qMZFdVQZWDr4IP
         UszGNtFEq1Y8bU4192YCULriFhoDvNp1JSDMbdF+Ds+tU0+m7Jv17NgvR0ePBO+rDqi6
         2Q4AemtMtIIZyislssPMiFwCOmVXcJQCqu3Vs/sCIUx1CvXqvw8+q+Ao7k/WONG2GSyF
         uUhjfyZc1ai2tRFfQRlW/JF+8x9quu7haMVYOgUkc7P5wieS2+oEtaaPXgwSBiH5hEdf
         ZHMacee4zHioeQHNEkdL7m1ouyEiL2KxahtKIUbozyGvUM5OUbXk3ZzR+BG/zr8AmzbF
         XKNg==
X-Forwarded-Encrypted: i=1; AFNElJ+DwDfv9EFnocwpiVjYeazv0n1PI2cFbU4bsg4WzFGB1XnTnyHb5+loHyeEfCmw7PFr94BmceN93YMg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfw0EPOca2VDAJ5Q/mLbJzLUrQ8Ue2XGlNFdMHyowPlS3NKYmX
	zwmjK0v/iyA7fBdKkzuWSVd4Td86UM5aEHSw+BcETUQdteVdP/i1URlqRlT7cRbUa09dXYK3KLy
	7nWlAGbYLfDyNJPtaNTJj0jbGf76HafeCfbIDWall3zG5lfRQ2a8hnjDiIhTTKB2XNFAyJDMB
X-Gm-Gg: Acq92OFqrbkpeE+esCyVabIrRLBOYePITj41z1YXIh1cWDFUPW53AhnaAcIqDsEYa34
	GTyWwsH6BrP5INLHgcaW/5P2+o9EXBZSKs5T5YUVU7CQs2o0Zi98d1WE1ybjhW9KxQla7d+h8yr
	DvB+Kh5h7GKRdRURXlHRJUxPF8zy5t7GM9OslHkYdplxJNr2CC3ToUtgK2hgWA7z4YaxrdpsY0R
	6H1bK25PVq9JlrCVVjaKtM9KCHf0wQvDtkaJ0LiQUa8U143SE/Y/WMsbzVd9C0apvPUg4NdCUA6
	dX7aAy5aEctJjYux3GmVn+FHXJlltG8MV/CTbqaoT+4Agj8jIAMvpIj3ofcO8nE9TNL/YHS44eX
	ja+beugisyn8ObQqu492epKHAu3Fv2ddhCHho1xm+8leXZD1w8SScS9FjdiRrVoazOeRQJw==
X-Received: by 2002:a05:7301:fa0d:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-304eb133faamr440551eec.8.1780017035216;
        Thu, 28 May 2026 18:10:35 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0d:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-304eb133faamr440526eec.8.1780017034513;
        Thu, 28 May 2026 18:10:34 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5a114dsm173785eec.24.2026.05.28.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:10:34 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 29 May 2026 01:10:08 +0000
Subject: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
In-Reply-To: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780017033; l=7308;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=T0tWgEjR4o6C8nVwFL6x+ia02fTMEN/CzOEGgDTRQSg=;
 b=MSL6anP9TQ5j8LCPP3jobk6toKzVCjWc01xrEuT/IoVqGVXHslR3/6bTLV5dUQM9sLwvAGFq8
 RVsfCQKBeHUCjzavxmnwZC0fyn/I7Lp8Ho5xfoZ64vK2cP017ZldKzC
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a18e78c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=y3igNv8VU7KrM5vZpNgA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: oMAZl9N9IMd5JDlv2Zu9BHgAvCEnB4IY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwOCBTYWx0ZWRfX09GNGF+ls35B
 A+ZFyZra5AsUbuBDx0RSkGBV3PBfI9wKsAyJcvgivPzP7IfrrTM6xSqt4INITzzkRrXGK690NLT
 fQS0h6AaE13YMpI4LwV4H4ZJgNJun5184AiYZUgwLQDMwRohNj/uhOELZ024E7ag1l1eBzGWDLC
 TLsHMpRknmc8NRnNOuX4U3E1qsyvEEk+OxXJQSNYXQS/Ueqr8NRicQK6ZD50MtGM0S2N4B7aX+2
 EirPXkhkadsxGkiPdWgopkxtg4VVoFThwxOw4w7a4vtZKrdkybfdw+HXzQp9a72flGrO826Xti4
 Ef2q6zkOKSmfradU2Ta+zIMKUlQ+7wvJAGnjSNb5TU3z0Lm52sjiCTHOurrx173b3yMN2cktKxw
 WS/iAVIbHVhqblN5USQSMztGavZKzKSyIJydaNvpIGn83VkY1bRKAScDhrmHftwDMvd9Mlf0nOW
 kBfOox5cfP57uDRihWg==
X-Proofpoint-GUID: oMAZl9N9IMd5JDlv2Zu9BHgAvCEnB4IY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290008

Add a dedicated schema for the PCIe controllers found on the Hawi
platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
new file mode 100644
index 000000000000..7e47b8472af7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,hawi-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+description:
+  Qualcomm Hawi SoC (and compatible) PCIe root complex controller is based on
+  the Synopsys DesignWare PCIe IP.
+
+properties:
+  compatible:
+    const: qcom,hawi-pcie
+
+  reg:
+    minItems: 5
+    items:
+      - description: Qualcomm specific registers
+      - description: DesignWare PCIe registers
+      - description: External local bus interface registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: MHI registers
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: parf
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: config
+      - const: mhi
+
+  clocks:
+    minItems: 6
+    items:
+      - description: PCIe Auxiliary clock
+      - description: PCIe Configuration clock
+      - description: PCIe Master AXI clock
+      - description: PCIe Slave AXI clock
+      - description: PCIe Slave Q2A AXI clock
+      - description: PCIe Aggre NoC AXI clock
+      - description: PCIe Config NoC AXI clock
+
+  clock-names:
+    minItems: 6
+    items:
+      - const: aux
+      - const: cfg
+      - const: bus_master
+      - const: bus_slave
+      - const: slave_q2a
+      - const: noc_aggr
+      - const: cnoc_sf_axi
+
+  interrupts:
+    minItems: 8
+    maxItems: 9
+
+  interrupt-names:
+    minItems: 8
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: global
+
+  resets:
+    minItems: 1
+    items:
+      - description: PCIe core reset
+      - description: PCIe link down reset
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: pci
+      - const: link_down
+
+required:
+  - power-domains
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1c00000 {
+            compatible = "qcom,hawi-pcie";
+            reg = <0 0x01c00000 0 0x3000>,
+                  <0 0x40000000 0 0xf1d>,
+                  <0 0x40000f20 0 0xa8>,
+                  <0 0x40001000 0 0x1000>,
+                  <0 0x40100000 0 0x100000>;
+            reg-names = "parf", "dbi", "elbi", "atu", "config";
+            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
+
+            bus-range = <0x00 0xff>;
+            device_type = "pci";
+            linux,pci-domain = <0>;
+            num-lanes = <2>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
+                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
+                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
+            clock-names = "aux",
+                          "cfg",
+                          "bus_master",
+                          "bus_slave",
+                          "slave_q2a",
+                          "noc_aggr",
+                          "cnoc_sf_axi";
+
+            dma-coherent;
+
+            interrupts = <GIC_ESPI 205 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 206 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 207 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 208 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 209 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 210 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 211 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 212 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 204 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi0", "msi1", "msi2", "msi3",
+                              "msi4", "msi5", "msi6", "msi7", "global";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                            <0 0 0 2 &intc 0 0 GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                            <0 0 0 3 &intc 0 0 GIC_ESPI 215 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                            <0 0 0 4 &intc 0 0 GIC_ESPI 216 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+            interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "pcie-mem", "cpu-pcie";
+
+            iommu-map = <0x0 &apps_smmu 0x1000 0x1>,
+                        <0x100 &apps_smmu 0x1001 0x1>;
+
+            pinctrl-0 = <&pcie0_default_state>;
+            pinctrl-names = "default";
+
+            power-domains = <&gcc GCC_PCIE_0_PHY_GDSC>;
+
+            resets = <&gcc GCC_PCIE_0_BCR>,
+                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+            reset-names = "pci", "link_down";
+
+            msi-map = <0x0 &gic_its 0x1000 0x1>,
+                      <0x100 &gic_its 0x1001 0x1>;
+            msi-map-mask = <0xff00>;
+
+            pcie@0 {
+                device_type = "pci";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                bus-range = <0x01 0xff>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                phys = <&pcie0_phy>;
+                wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+                reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+            };
+        };
+    };

-- 
2.34.1

