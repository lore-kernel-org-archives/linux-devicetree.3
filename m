Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0952360745
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419965; cv=none; b=Ayrwu48HSnuONSWGnS2KuA3uy1/JbXo8iVctv4sac+BU1UCPh4I63wpgR4NyInC/Xrb9dKES9EL9Wi7V16BECmMKdpGgIOJllVQVHfEqaPwL7jQvTAPur1OSq1MEWdf70lIGZOtuMbDmezErd7eugLOd0tyVv8bwvu8lis3kkdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419965; c=relaxed/simple;
	bh=ISmYNvUoaB96MgkLalgc04Cap0JuQBWjqWuLI2ENf+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzaKXrfBGO8/qkQYWNfWrmdZx6YTwLvo69qjV5X44QVjF8Mo6OpfMFJabM6PlpDvPxNDS5fg+ZrfAS0aqMy+XOvdVsINLTmWDl3jbyme04q24kY4LmPIIGyA+QNI6mY5spiRWuIeLfFK0xAhI/aNVIxuYIfz0Bc6rEhPl/0qDLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiG4sWlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8pkl5ES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EiG4sWlS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8pkl5ES"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFe5Yi2801287
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcF4bTF2Bkbvr18UUoB77o3pNngPmQjwF7EVwOZWLAQ=; b=EiG4sWlSjqQi94Cf
	LC3x3UW9pxYgRnJL3EbnRBICNA8zTHDmCWxWjPRhX6GRj5fsCMVt8ZbVwjgMURV7
	FMABSJ028E3JJHzk5PSmlWApevrK3mPQCYc5ftX6LzKfLvOi5Ea1bOdDlV9ju64d
	k7qMMZ6xyFKLKWsmUwgeKtXmfRVft8rJX6ZXsyvxPCacULwDegXjwsTe6Db2DQ87
	wfWpMUDDi05HQZsD91sy33bHCBiBtAGqrWmtVWMiwYCRjua9TAjxSjNGnqp5OsZU
	aEe0mBGsSvW4KkBDXkk4APnzxx3jfTtr1g6OT9lyWPwqITHBJYgk1YKvk5JLROke
	oEOFzw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmm756-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 20:39:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137fc6f8e9fso607954c88.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782419955; x=1783024755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcF4bTF2Bkbvr18UUoB77o3pNngPmQjwF7EVwOZWLAQ=;
        b=H8pkl5ESpZUDyTTBMBMN4CIPTYz/7GbF5q4FY2TTKuOFREfSfLH6rAKSMuO8VODg50
         HjtH+DVyV82nXtkWpEEXLhWtDiupvvnhmpxlFSRYxfmq/cAe5N3NGRayGAFwMeIWRJ1v
         KMoDcQv6IRBRzJQBWeI6VNJLW96mdXVWLMNO1uAub6/GFFfAf5JHJrY/RYTTCu4rYHfT
         3D5EsBxf86zXNkROC90SSYMmy8Z90fzJw3e10CdaC0ZWGSN/GGP9VdDM/zz18ShQlEU/
         1bWEKEn2oHOSlcICYID5tQu+AhVq/sU7TD8ln3hGjHKjr3lYzfklJ9savyiKWU7Ms2xB
         VJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419955; x=1783024755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcF4bTF2Bkbvr18UUoB77o3pNngPmQjwF7EVwOZWLAQ=;
        b=B1VP++i4Xewj37NX1CjqegNsaw0vcggia1v8+rQcmsJfhrOBPgPIDHhb0YX3CS83W1
         7m5sOPeNcVCA4F1/k62Id+7TYNjDVPOPNw4h73KXilCy+QMpehnoA2buS45aC/UD4FNm
         Jq8yDWreHjtUz9ggwM71zNqOjbYsT9bZaEcaw3eSeCaE12RDBjbpaRIw+NS+I/qEy8Kd
         9QfjfPU1mS8u2VmaMA3THsU0INDB9kGu4nklyM057YtoPP9RItuEH2150ut2PXvIdBSd
         g4G4SYqmurs1E6pYZ2eYQfKbnyPt88zqsjMsIPcTpiWXUMzAWetqBXRZ9tmF8s+pqyah
         4ssQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zqI8jgWU0Fpz45MXbNAYVasvrqxziDX4zzqLMT8ej7NRkEeXhQOh4o/2ao9/nFLN9gy3InVPB1Grc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/9552Qdxl0kUtr6Kt9L6Os0/XNLwib66ApH88h8I4UmkV99Do
	CNnfxc1CsbRiP40Fw/77x7rqKzcHkzA6bs1Hi9ZiIsd/SYTQYC+ahc7gcpO0rvxQiAX9LTUboUD
	Y/Sjb6FWRYcKEE/r8v4KN42HptMhylRomTUqyjlsRg9xTBj0U3gt6kx982SGaWIZM
X-Gm-Gg: AfdE7cmAn5Sr75Br8iAnP5Va8gYXEitnzSDHajqwGqR/qXD1cBJfHJZRvVDW+8BQNL9
	b+DSSn4uGAaRfnO+Lnh1fntClzA3/uDeAMxic81vKli+bEaEQJnQwEU0G7neBx0YnOfWq9VLmo/
	jN968erEIzowe34+HhUdXDzMzgEdr9fmHfHGbihvhkySn+Yr3ajrVkVo3rrkMeefkwNgeIwSQ+P
	5AZpnHl8bZxMu8TBgntISb6Buxp5rsL8CFwk8krtCMn22x0sRYQHz49I41u3FH8DPJmNAcSPSPt
	RObZJlOl62GnJfPu1Mi1fHhV1dLGD9lslDR72hDs/vsFTFJ+6UK+S6+yCCQTRFSf6NM1om+CbAs
	Rh53+yVJBYeuC/DnMUjrnHJWHjMTxa+YWZq6ph04ET0/+KAFs
X-Received: by 2002:a05:7022:788:b0:136:c443:80e5 with SMTP id a92af1059eb24-139db9f6888mr3647285c88.6.1782419955380;
        Thu, 25 Jun 2026 13:39:15 -0700 (PDT)
X-Received: by 2002:a05:7022:788:b0:136:c443:80e5 with SMTP id a92af1059eb24-139db9f6888mr3647263c88.6.1782419954850;
        Thu, 25 Jun 2026 13:39:14 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8ddcd34sm10858623c88.0.2026.06.25.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:39:14 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 20:38:58 +0000
Subject: [PATCH v4 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-hawi-pcie-v4-1-1a578603cd86@oss.qualcomm.com>
References: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
In-Reply-To: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782419953; l=7084;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=ISmYNvUoaB96MgkLalgc04Cap0JuQBWjqWuLI2ENf+g=;
 b=wCvh6TtumtqBeuKAE5MATG7RmIOCnKyhOhHmXQ0Auz1HUPHeNJfPeYdze96a0Cq78BSfE4gky
 COEJugXVgB3DL6/ms4p73ADdViJITTKETM7p2CQ3Vre/sp5X8TJN0U1
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3d91f4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ICk-tmyBBRKrNCK0fOMA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfX8I/fE+WJZSQb
 jRZwBaWJ1jbOTGtj/vnk1XvufveK4v7jqyqJgAcW0WLn5SeRugRdq6ctPq5CxI+pqd9IQGFDt8C
 tCY/hyN9J1OfamGLUZpcmQ1VrRHmlci7BvlTvB+Ph+u/S6hodM82dDEaUkgBhxvaejtxTh79gHo
 0SzJcudqGEusuDmK/JYpZ5VXUNmmH7knLVz2m8XX4q3QjwXwNzCxpgtaWJ2rFZVX20WvpFdhtBf
 qonnGkqyT2u8vYno0H5w3p/IIlQI319iM10I/7YZr3hymXnIhdX9n6vWSaBjPGO10JPnNPpwrRE
 MZ0U+wOqYsRway8k3Tlu4ibboy3+Ds+u6SXFN6ymVnuHvGmJ/9boaZfIEPzXqv8HP4K0bznr/Iq
 LXHOGDagKONefmFti96+M1A2smZkJPG5CWspSN1VT1QuW9lVHsAGtPKyDKPMjBLumVyd8sccP9A
 UH1+rPr+sH30/S4xmjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3OCBTYWx0ZWRfXzRQsKeCuLdSi
 lidJYr2CiIuHKWjhPD1N94N5tUNyR8cuFK//rKyTUho4Fsf4tNk1q38gZHFTYKYwNn1YSJQt8DL
 9pIMLSgPcl3umiVMoh4lsUlANLuBRIQ=
X-Proofpoint-GUID: N6U6hsQv7aLl4U1yl0S_5qgqNAhtqhpS
X-Proofpoint-ORIG-GUID: N6U6hsQv7aLl4U1yl0S_5qgqNAhtqhpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250178

Add a dedicated schema for the PCIe controllers found on the Hawi
platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 196 +++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
new file mode 100644
index 000000000000..2c999ca6b205
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -0,0 +1,196 @@
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
+    items:
+      - description: Qualcomm specific registers
+      - description: DesignWare PCIe registers
+      - description: External local bus interface registers
+      - description: ATU address space
+      - description: PCIe configuration space
+      - description: MHI registers
+
+  reg-names:
+    items:
+      - const: parf
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: config
+      - const: mhi
+
+  clocks:
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
+    minItems: 9
+    maxItems: 9
+
+  interrupt-names:
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
+    items:
+      - description: PCIe core reset
+      - description: PCIe link down reset
+
+  reset-names:
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
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
+                  <0 0x40100000 0 0x100000>,
+                  <0 0x01c03000 0 0x1000>;
+            reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
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
+            clocks = <&gcc_pcie_0_aux_clk>,
+                     <&gcc_pcie_0_cfg_ahb_clk>,
+                     <&gcc_pcie_0_mstr_axi_clk>,
+                     <&gcc_pcie_0_slv_axi_clk>,
+                     <&gcc_pcie_0_slv_q2a_axi_clk>,
+                     <&gcc_aggre_noc_pcie_axi_clk>,
+                     <&gcc_cnoc_pcie_sf_axi_clk>;
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
+            interconnects = <&pcie_anoc_master_pcie_0 QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                            <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
+                             &cnoc_main_slave_pcie_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "pcie-mem", "cpu-pcie";
+
+            iommu-map = <0x0 &apps_smmu 0x1000 0x1>,
+                        <0x100 &apps_smmu 0x1001 0x1>;
+
+            pinctrl-0 = <&pcie0_default_state>;
+            pinctrl-names = "default";
+
+            power-domains = <&gcc_pcie_0_phy_gdsc>;
+
+            resets = <&gcc_pcie_0_bcr>,
+                     <&gcc_pcie_0_link_down_bcr>;
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

