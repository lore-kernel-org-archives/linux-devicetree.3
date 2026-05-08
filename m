Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E224819CD03
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778202153; cv=none; b=sLyHHXPFDnwfLkY5bLwYf890gcbDuhUWOWkikJJdWLFpE5t6QvCyclwfaHsWw1iUmY/nNXdZy/Sq/rK1BUa1uHk8owGlpMOVvpzbvKXAd+Eesfz3USTLD2KJSZKEDc92ccbDfoo6WedpF3REY3wWNhjD38PQf+tJesm+L23AIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778202153; c=relaxed/simple;
	bh=iFwIHq7PnPhS1l/+UKbWINN7tuQP1Ai/kBITF6YukuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyrECLExBpBtBHotPHNXF+vrpA0hfUKZuBTR6fbbTyPyxRc43Dn9nshfXaqLOkqw7ZthRSWgz9ptyXAaic/ViSp5HjipNGZ7XAdgOYZ6zQya3cy7r/lC5BmXNaDWoPIlUxNM6zgl+BIzh6uX9jKB9K0FKd3FzE0qrqJND+WBdS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dld8PACq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvzKoQjh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dld8PACq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvzKoQjh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647LZNEA4069384
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 01:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cluxkf2uiEfOGcDx00rV2g86ug1I8ZPNyJpvaWCjQIo=; b=Dld8PACqVv+fP+KE
	LHUsaxAWPwMh6SE0dqeYMMDTU9FuBoKCKvjed+E7szn6OIdeypI+JH5+xrx2relK
	jemWbBxSXFUXdstMKh6aXqqNTUAq3Ov9/SaMys1whAD6fsa6phVfEaPuxICcBv9g
	9Hw+F4u04Pr6vTmxVKtx71VcKELgwymvdYfaykbpKnODlj05uLQSJcCkDxjdGF6l
	tLySgb9munCGIiWPpLVwDB76IvY6Dq6KcTcmJ6V05ZUUVWreTKoQqIn5AI1Me+E4
	eeP7a7GVFr8Me9LYdx7HB7+gxKPLXo7n6fK3qYBhDNUqHTH/ReKAsV2AxTpleljX
	mNYIOA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp0gjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:02:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef62078ee7so1893036eec.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 18:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778202150; x=1778806950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cluxkf2uiEfOGcDx00rV2g86ug1I8ZPNyJpvaWCjQIo=;
        b=ZvzKoQjhHyJiJukh3UUVF4IPgGEQ3hqkji4Um4Bm0DVgbOjLCNr+CMKJsaP4fPm8J6
         o822xlYKURdOhSqpJa6XJeznsqp0uAeYbnc/O6gJxcTU2WECEZF8GaOrZC0AIhayfr++
         AeCL7oVPMfU6nzEsOGoIbug7C9q2IGlklAgNdrcJA37PHv5d+JDjMdkv0Sqblkd9zwsy
         cex/12pY8Ej8etaEDf8VPH7VaTr2UD0zG+etgBUnoDNVVomSDcNa0dtJuEcdYPYJZVCB
         pJL4Pd4Htbq/Y8r12MXEbgeuOQPZhy0to4OOo3dVlRC97y2wtzlFLimhIcDR8Txs5zTa
         bbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778202150; x=1778806950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cluxkf2uiEfOGcDx00rV2g86ug1I8ZPNyJpvaWCjQIo=;
        b=d1lw/IupQaWGCBiM0Gjq1i7cYNEuz+zTnB2CmmjinePDlQD+gxXAc8NKDLW1vvji64
         owIEac6uVQ6WQ2U2kPghdM7EzXHDeKkw7VjAReVYaNBhFQu/EJzcPVvU4L/R1uFcJu8o
         Gqyc5y+yQXKmqEURNHqSgQLtDHKUDBclP2hUtzIIi9CfOWlHlBubM23MM85sVkYXBvqr
         HW5gMJFpSHqhU17BTIldfjauLuW1wlK+jOnu1zUuMCAHkIanas3RFNcWxXLO/cyOn77L
         D2LJcPXm6Lyqvag5BCGMpjSxmiorCRkuoq1r7gPmhBy3/1GFVw9gY+uf9g/wD2qAGSdW
         lL8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/SSH9VN3GyApGliDjgHohTVbyA5Ky+Gz9sDh6ZzRdQ7Z8rhcsRQC8Y4b4BEGPENGzs1WeSsCVlI3H0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd5UvLrOTv+r+rWNXwf0+cTL9AQmZHYzXBe1zNPzI1KlQBl/g5
	0zPXWyDW2Fn6rewMxD5h7GzG5s5L+3GXY3eWm0L0GntlqhyGJUsDqKzRtl9AFMW+bomQgwVCHyf
	MkKfje01+Ws1DCJnzMyAu35I+7pLLWw1lpkqQ4bfT1uUFMQbRT/yvmhARV9qxh+Yz
X-Gm-Gg: Acq92OHCCe++UuChDjjaaQzl4bwzCeO/phu0yo//KELwNvopiUZy7asJ+i6oG4RAqNn
	My2nBfMLC30iLdkb9Hhs2TzlyhBroz3op+fV5pLNsuUDcCthOBoLiwfhXaVP2MgGOATWszU+p+d
	v676x6R1vBjy/xftszsx2ozuWBH5pcPrxps1gfAnOQfULda+hYnxORb4Q7ZN/mbsdYKab3wiLO6
	+x4QdZbeJfL8GoSz8F48HdqHYzyh9sRubYi+8zADyHQgaUvWkscQc7mVUsQ25+Sx1KU6RRkDHCU
	mAiNHQOUaobXaoNRs7+Gg6OY91tn0Auwzf2THbEoQ7ke9tkwYMBQHPBMvEcmmE/3rSuzy4wLK+y
	ciKASgpTHkDryVID5Rqa2pv135mvCpkkb1kB3pjcMruItLH5rnttJ195+TCc=
X-Received: by 2002:a05:7300:e78d:b0:2d0:239a:23c9 with SMTP id 5a478bee46e88-2f54a7840c2mr4740015eec.16.1778202150312;
        Thu, 07 May 2026 18:02:30 -0700 (PDT)
X-Received: by 2002:a05:7300:e78d:b0:2d0:239a:23c9 with SMTP id 5a478bee46e88-2f54a7840c2mr4739986eec.16.1778202149405;
        Thu, 07 May 2026 18:02:29 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm149809eec.24.2026.05.07.18.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 18:02:28 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:02:14 +0000
Subject: [PATCH 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-pcie-v1-1-0c910906f7e5@oss.qualcomm.com>
References: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778202147; l=6962;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=iFwIHq7PnPhS1l/+UKbWINN7tuQP1Ai/kBITF6YukuA=;
 b=yUXMpaVvjIge5apBthE7ZOvm59w/9GnABJ9NbMQ+g15rusIJtakRlooKfuOI5euclxj666CQB
 HzbNp3zVaaCCtvJRqDaCDIV+KIGi8oTB8ahNDoPBGdwTKPdv8NNmhsP
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAwNyBTYWx0ZWRfX8qj2YYDYJVrK
 eeF/tEUEsRzpPQiUDtzZhlVPAoVozeD1y3vMiE/vEAMWRw4ZDnCRspLjpql70BwV9zPZJRVjnih
 Pku5bv9wB/9dKCSnEFUy5pqDBc2QGlm5Ho1XHEzzM45ilZrT3IlJxHjDLRGQVYBaQlUd3r88NY8
 pb/51xSpz/w5fWyOyqvP8h7EnptMyUM73h/BtgWdO7jH75iaApm+9VLxnnrM699MRgSAgyaYGnO
 lQAxBnZRCU9d/I0SwHCPqRad6elvnBWR3EbQuQrIFPs0j6cSiULFHZd7NZHoTPVqbAXbU1GX2YT
 GYsoDUZ1mP9jGr46Y1SKODskhVwi+qrIfNSUWZD+FXkSDqYK4yngXpCIPhM8lSmQSSoyTPoAs8U
 zAmUpR+N5FjTP/KQQby7A3dtD3rCDUIhuHd41fRAS5fAuKjKxa/ae3FQ0CLIE7qjGATBHeFps+7
 HtWs9NsMjFwU7kKBnzA==
X-Proofpoint-ORIG-GUID: ZLp1v3UiHDRRIJ3XaymrtSYgfRXZnX5v
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fd3627 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bI9jczpiwHmIHscsW4wA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: ZLp1v3UiHDRRIJ3XaymrtSYgfRXZnX5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080007

Add a dedicated schema for the PCIe controllers found on the Hawi
platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 188 +++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
new file mode 100644
index 000000000000..154bc88e5969
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -0,0 +1,188 @@
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
+    maxItems: 6
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: parf # Qualcomm specific registers
+      - const: dbi # DesignWare PCIe registers
+      - const: elbi # External local bus interface registers
+      - const: atu # ATU address space
+      - const: config # PCIe configuration space
+      - const: mhi # MHI registers
+
+  clocks:
+    maxItems: 7
+
+  clock-names:
+    minItems: 6
+    items:
+      - const: aux # Auxiliary clock
+      - const: cfg # Configuration clock
+      - const: bus_master # Master AXI clock
+      - const: bus_slave # Slave AXI clock
+      - const: slave_q2a # Slave Q2A clock
+      - const: noc_aggr # Aggre NoC PCIe AXI clock
+      - const: cnoc_sf_axi # Config NoC PCIe0 AXI clock
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
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: pci # PCIe core reset
+      - const: link_down # PCIe link down reset
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

