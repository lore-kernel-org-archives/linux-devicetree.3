Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BCC3B5F48
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161189; cv=none; b=E+cTCiP+v/oTgI78kIYZlV8dYF8pJkhYG6GITuSw4Pzv36+4TjI0J98U7Nbh8GPR6L3oRpQ34dSOlFpjJt641wsxkuxuP7Y/qOp5Fw4TSArnyVChLxlN4sRDJ+e4Gtt2Uhrec3PNmT34jOlwywC5iVtGyojTdUHVHLfkiJDnFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161189; c=relaxed/simple;
	bh=Iinqn3CFgHeyIBdcRbNUR2dz9SWr2cQBVBMh0hJXQuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opnJ6H8SVZEtsUikCyeQp9IayXT6+wjDmNkGNPHhQtXzPDN4H83WdsLDJw+8LTU4uQdhYqZX9+JGvvrVjFJ0pvV7N4tZrIBtZXEeI90OeqD0/96fl56jhVojZetkbYNCUAWezv3xSVULhM7dlI6Urn1boE3o8VMbnHMWW/F5lK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIq1OakH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTNoWNee; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIq1OakH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTNoWNee"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52VTS2680030
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOiupcclxla78tZiKkuSNISl5an4+Id+Wf1YJmJcvsM=; b=lIq1OakHPKH0hTPg
	uk4XqROltV9UoB8RUIiihIxyE3oppv8jno1LNbEYfMHOb8ZKN6a52Prw6x0sprgC
	ZLoYIqibo98G7nnniLjQcs5rD/3czGtdQzf+Li/gIqvXDSR9NKyMMw2h5aWaKogp
	8QNttkZV+S5pX7FFR/CSGFxOWQiMwegYAFAE68+JI+oilkndhinDNb/GneBSAGfz
	BrtCNPNDwmeYuRRnOkx8um7x5sdaQ0hv8XCQNOxA62bliWkfBXiyEEZiufN7zvTj
	VtPx4PdTojwqLIXC7i01ZkaNqUz6Q25xEECMm7uv+TCiL4HcrPizgR0P7TTDeKxp
	0CFq/g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwd791-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso4513437a12.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161184; x=1788765984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOiupcclxla78tZiKkuSNISl5an4+Id+Wf1YJmJcvsM=;
        b=CTNoWNeeYOG8OZHtdS/dW/HQBI6zbHHZFKwgUeAsJYpz3PhU7+9b3MlF9fBEH5Vpca
         od1Dv2Hh6c2USrhKLYBr20RQREULES/3PwGNrfO2jFw0nm83HzZVUlKE79DgS/mIXijT
         GTsCLKFs9gCks0eNPv5dPzwM2fSvgwnVbwKxfxUU9VbyaD7XkV92Y7A4lTLH0zJvmGXn
         udB0AMulP20Iq5Jh0Oupdn+UUaAZwcU1de2T6L6dXKFNlxzCGoYbwQVL2lEjV43efEIb
         r2cRsxCSG3rFmR+/ylJztewKXShHJQZh5EvvHDYCD4UUerTLHeGSSW7TcLvLxotnwHfi
         RhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161184; x=1788765984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOiupcclxla78tZiKkuSNISl5an4+Id+Wf1YJmJcvsM=;
        b=BpAGe5nSKL0YgbcGCF9x+bI9JFCJ2GuyQf3SgVLKVAzJAu3VkoUs85Wq5iQAz3TO+P
         ELMrTVteQh83hr8F3mX4w3Hr7Qblb7LYPoNRXPFEmh95U/JTnqxyzY1qrBwi4LYv3/SM
         7WJpqjrN4XglrSOUumyNZybIiMuy4XZtBDCS5E85unBmyHUacdo5NwXDF8AMLoC8zAo9
         sZaZxvfRDvTPHlSf1Pa8ibMcZmno0/m0GBDGvbnNgYhAwWcFjlVrdYZ2DWApziaTpB65
         dehgx19GGILwtgk/tVceFjKPK2XlhJzjSkkXLnb76Fis4tYBXajIj/sz5CbFffLdunh8
         nhXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgB5chdOdo7y7bbMwVkZxFmdWcOPnkG7UwFiyLzEsux5WD49U3baYM3yVv75KXVFWhtMT6UBmN+fmz@vger.kernel.org
X-Gm-Message-State: AFuF++m0/8I2ABvURhjBuuoAJqglIB9KTJa8N+RSRcVRbc8wbXmq4vDZ
	3Mqn4Srp5m6J/Nl1fXCiAHYgAEMKKv4wQuXYW5QM6aekzlU6pWwTEWxavYd4XbJLPRaskxv/SG6
	mDOUHtkdMoGxXUREB7er9QFBXGZOtsK+HUv9E4lOrq//3ZE7Ordc7hi9JjtZm4tpk
X-Gm-Gg: AR+sD13jDJhtZ33uTmeiLXsvLE4fyQk2mRUCXLYA87PcV72iz/A4YhfN7pSZ9P1Kkxt
	C/GFDAu9nsM42bMmUilmsJoeQJIv5Ycr3h4BGhoRAySQXo1rH3mhqg9X9JX0DibyUZrB2eCVt1n
	a2Su+5U430ib5JuZQtdjqN3+qJwms5Nj0hlOCZxid0/QOQ80/hkX41eDgSCRtLAnIql35g3PNX7
	rlcUDxWEuvp0we28lEDSQus0evJ/Ij068ofPiZ7adkp174Yksrl9ybFQg5BQlYxhBVqkfcLVKWG
	PXmSwYEGuBGKtmvCHycHrLWzQ7dc+lxup8MHF36CLsesp2+XmrgUQWpeT1f2kszBRULibcK420a
	HO8SZ6g+diOlhsEDKVG9yIuCZmGqJvW0NEjY0
X-Received: by 2002:a05:6a21:6e88:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3d267b60e7emr42451773637.9.1788161184144;
        Mon, 31 Aug 2026 00:26:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e88:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3d267b60e7emr42451711637.9.1788161183669;
        Mon, 31 Aug 2026 00:26:23 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:23 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:56:02 +0530
Subject: [PATCH v2 2/5] dt-bindings: PCI: qcom,shikra-pcie: Document the
 Shikra PCIe Controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-shikra-upstream-v2-2-406661d75afa@oss.qualcomm.com>
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=8118;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=Iinqn3CFgHeyIBdcRbNUR2dz9SWr2cQBVBMh0hJXQuU=;
 b=BIZRWB9SV+cDNC20B4KDEAlZCNU5Avqum/H818pohP+gcdQ5vOaC+vg1CGBYUlmfvlmU8M3u/
 sj7UHjGjZzDCtIs87dBfa1OQVursNKPu759UztpyNybh45oRo+kUe2i
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: gBmg33tdGZExmo0oymFeNnbThZlZQRpz
X-Proofpoint-ORIG-GUID: gBmg33tdGZExmo0oymFeNnbThZlZQRpz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MiBTYWx0ZWRfX9eX7UqMM2Tm0
 iMvWyjli2yU2GvXsGknWKhRwzZj8FL2a33Hp5FqL1HIbxHxYremZ04lyff8VLr3SGsyRkTzdGk0
 enyiX3m+AZ74Yz2xl9pPwAsjKBaWxq0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MiBTYWx0ZWRfX92a45nmIsMyF
 XN5TArhqaClMSL46KOAAB/3L+8MjYCVZB2CxE0g6b6SACivpI4UzskAffFAB5NKiz99F78hUjAr
 IayPvQ22AYzCjV5K5o5sy1zPozV7sU74rnol25H4oSarYaG2sisaIldiNqyJClYHrRqjzOaebPN
 nwEbsFqVkuy1Tlu2EXwwX379DYNhDrLu8pitHRAOvU+OG2Av8Yu1hcxhq4B5Eiy00Hny5Zg8GrD
 9THtuUc4dE5gcPwUIDgWjKZCvqp5FrtwwK+iCK8/d0JnbMBXOLULMSnFhBoN2hWrgCSedON1Gzh
 pnwEolC5ffGP9Abpz+VZBDxgB3x+VaoxUuWzC3EOGtMFj1Wiko2xkz7cCytITnLatxXkRnUG+DU
 uoZSjRahwEGRx8cH5qlMvRz9GvKRBz9fiNappyeNOgNik1HrxwvCgBtH+UQOSQ7fKa+zd/CJ+Q0
 iSOP8WD2UKycQ6dTsTg==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a952ca1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=y3igNv8VU7KrM5vZpNgA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310062

Add a dedicated schema for the PCIe controller found on the Shikra
platform.

Shikra controller supports upto PCIe Gen3 but the PHY is
only capable of Gen2, hence the max link speed  is limited
to Gen2 to avoid link-up failures.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 218 +++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
new file mode 100644
index 000000000000..73b8ec722f2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
@@ -0,0 +1,218 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,shikra-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm Shikra SoC PCIe Root Complex is based on
+  the Synopsys DesignWare PCIe IP.
+
+properties:
+  compatible:
+    const: qcom,shikra-pcie
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
+      - description: PCIe SF TBU clock
+      - description: PCIe Aggre NoC AXI clock
+      - description: PCIe QMIP AHB clock
+
+  clock-names:
+    items:
+      - const: aux
+      - const: cfg
+      - const: bus_master
+      - const: bus_slave
+      - const: slave_q2a
+      - const: ddrss_sf_tbu
+      - const: noc_aggr
+      - const: qmip_pcie_ahb
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
+
+  reset-names:
+    items:
+      - const: pci
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
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interconnect/qcom,shikra.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@45e8000 {
+            device_type = "pci";
+            compatible = "qcom,shikra-pcie";
+            reg = <0x0 0x045e8000 0x0 0x3000>,
+                  <0x0 0x60000000 0x0 0xf1d>,
+                  <0x0 0x60000f20 0x0 0xa8>,
+                  <0x0 0x60001000 0x0 0x1000>,
+                  <0x0 0x60100000 0x0 0x100000>,
+                  <0x0 0x045eb000 0x0 0x1000>;
+            reg-names = "parf",
+                        "dbi",
+                        "elbi",
+                        "atu",
+                        "config",
+                        "mhi";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+                     <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>,
+                     <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x0000000>;
+            bus-range = <0x00 0xff>;
+
+            linux,pci-domain = <0>;
+            num-lanes = <1>;
+
+            interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "msi0",
+                              "msi1",
+                              "msi2",
+                              "msi3",
+                              "msi4",
+                              "msi5",
+                              "msi6",
+                              "msi7",
+                              "global";
+
+            interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            #interrupt-cells = <1>;
+
+            clocks = <&gcc GCC_PCIE_AUX_CLK>,
+                     <&gcc GCC_PCIE_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+                     <&gcc GCC_PCIE_SLV_AXI_CLK>,
+                     <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+                     <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
+                     <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>,
+                     <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>;
+            clock-names = "aux",
+                          "cfg",
+                          "bus_master",
+                          "bus_slave",
+                          "slave_q2a",
+                          "ddrss_sf_tbu",
+                          "noc_aggr",
+                          "qmip_pcie_ahb";
+
+            assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            interconnects = <&system_noc MASTER_PCIE2_0 RPM_ALWAYS_TAG
+                            &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+                            <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+                            &config_noc SLAVE_PCIE2_0 RPM_ACTIVE_TAG>;
+
+            interconnect-names = "pcie-mem",
+                                 "cpu-pcie";
+
+            iommu-map = <0x0 &apps_smmu 0x800 0x0 0x1>,
+                        <0x100 &apps_smmu 0x801 0x0 0x1>;
+
+            resets = <&gcc GCC_PCIE_BCR>;
+            reset-names = "pci";
+
+            power-domains = <&gcc GCC_PCIE_GDSC>;
+
+            max-link-speed = <2>;
+
+            operating-points-v2 = <&pcie_opp_table>;
+
+            pcie_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    /* GEN 1 x1 */
+                    opp-2500000 {
+                            opp-hz = /bits/ 64 <2500000>;
+                            required-opps = <&rpmpd_opp_low_svs>;
+                            opp-peak-kBps = <250000 1>;
+                            opp-level = <1>;
+                    };
+
+                    /* GEN 2 x1 */
+                    opp-5000000 {
+                            opp-hz = /bits/ 64 <5000000>;
+                            required-opps = <&rpmpd_opp_low_svs>;
+                            opp-peak-kBps = <500000 1>;
+                            opp-level = <2>;
+                    };
+            };
+        };
+    };

-- 
2.43.0

