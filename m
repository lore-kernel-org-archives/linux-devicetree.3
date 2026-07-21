Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E94F46AECF
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627643; cv=none; b=sQPmcX591lX7IRrTTo/IDD14yyf6iEcbIjRFJKn3nKc7ckKVNOzMuGVzoW9jJv8KfDFjQzufx+acb+imYLu7B/F1crjH4coo0wZ5qsie08QzlzuCVK0SdNcpZ9oaeDmGNFsTTQMaYo/f4j1clZ+UY+GC9AdYULMV6bOQ0FofaKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627643; c=relaxed/simple;
	bh=/fNttdj/mRaZU5Hi2i1TX0qKbxNI02fle2pe3GbIOCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9hlIlmRF6OuqQQS9N0KL1Ixy4LVN4vAC59la5inx1XImrlEEMFajVvqyqpx+pUEU9Dhw3gmWrpXrVx+fz5vMYYucq1zqXFab10hRo/N4VQWJZjahv6zNydQC7+1ufmIbcvi7EuRqBbeWei75h0PfreicjjQdcdB9z9WF1ymLQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+PBaKzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Es92wCKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+PBaKzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Es92wCKH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L9XEGl1389899
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BjUo2vwktHWXNtRoUZt87ZyDLmcFIEa2d1oiSfq6aA=; b=O+PBaKzlMIui3a7n
	d6lsOAV6O9W+PBAOTQ4dlrWaMZEz2f8r0J10ZQGaAy0+Ad1B4SkGeglIghBblkbI
	U0RSimhi7rK9yuJv/FnWy+gGYvjUjWEDqzcBF5jc4FC0BDofMREAGI8c44207Zcd
	1lCaXGGcouFLWjX+j0OsFWR0UtutNIRtrwLuWl1Lz7OczqJ7pQcJz4NpsJo2KwLS
	OB/tegUMkN6O28Xa0Dl/5+NyhZFJxn7cMWxTlgBLGlcO28TuJJXqtXk0kXiy0JIR
	eGMNvoiWFvbGYnsqWwGlkbZ9S67AhZz3vD7fdy5uRg3ingWHRx1OG65s88UJDUTa
	75U+2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68602ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:53:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbb61893fso234265865ad.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627639; x=1785232439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BjUo2vwktHWXNtRoUZt87ZyDLmcFIEa2d1oiSfq6aA=;
        b=Es92wCKHzYb/7HJ6NaJ4xzxbEvUBunGERtQGkaZoWjSyFqnjll/vhzzg5eFMW/1T01
         E6w/wVhW3F27ydqD/WiKwbawUhrZdvsFOhopzgEj81qGzm6QzPchB4+RAtwetUQfLv4n
         E72t914HJ22u6UPOLrSYMqtGzghZ/8pkCqtCMJNz+Ga3GWvh9qml3a/iLBSZCpXfYAGP
         ldqYCbrL+FjV2U1i4tgiVYexiLzcJpwY+NHRnN5EQFgxEZZwRR54fkEqD9O2Lc56+WXk
         hlMiBViwWK9mEuo6uVmupk/Gmd8ULH0k4ctASlleTexg4VwBHeb3p6f3jG8BIcBvhG6Z
         1ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627639; x=1785232439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BjUo2vwktHWXNtRoUZt87ZyDLmcFIEa2d1oiSfq6aA=;
        b=mddij0Kp6tUELu1llkZZVF+cKEwwTduF8pd/CNXdkLzhDMrQp5ZSHIVxPxYVCwTR87
         OqtOJISb5gBGUL9fv8oG4AfzJYmum57tbiN0oI4RXEGPKUfam00kpYltygveyfh/uBp1
         gqmvhPXfwHRbb2/ujEKLWWQJZN5QZaViSTLTbHRKtjM5Fjjtqx+GDkDHOmxbpeu/wxRT
         fVIJkYG7aD/M+pNWetBbYCS7l+8wVCNh7cadmbSZAGKTCw+3FqaVCbZKQ5AJNjJM7Cdm
         orZ9Nc4muzm8+feoD8V+ZUVlSu4mco7Idz50XHhJeVHd6N8fAuyjIjFh/y28QlHIfjCM
         wCEg==
X-Forwarded-Encrypted: i=1; AHgh+Rpz1+thO8Cr952uwFAa+PVAIzO7XYasRdLf396MOXNAACj9bEJ7Ft4dCTGpNrd7+FG3GxP1Z/uPmkL+@vger.kernel.org
X-Gm-Message-State: AOJu0YzDEvt0e2gwp7UXoq5lOB08Ed7xiLOrpbwo+nzX9HQwkwDUix+u
	D7N32uSk1/deVjP9uBWayeXL93dvMUcHXaBBGnSB0sYmT1g/FoYvjLKsvdNsouNWwretsk+YQ4D
	QXKP93FGNMGOPMGchBvhiHW6LZarC+2AfmkKjZIboOG3gW3+9/oo0CQPWKH+75PUK
X-Gm-Gg: AR+sD12to/A8fbGNgNuEw3GA6RCB/3Xbe37QWZKAtoVDuvhH5dNfwbomPSM6/GL37Qs
	VCLHoPP3FLNozeYYY2E9puVYREdaIgNQpC7I6+/rao7hlq7XXOW3nzZB90D9xVYnB2UzteaxBXO
	rezlZ4fcqtmnAe4VtipcnPMBwuZokASrR/gPseMPXb3a/JevAcOp1WxY2PsJOTtGYzbCGZvMyfr
	Gt/srno1Dt8Txw4i1FScAPA6nVdtfPkyizpQUMSPEJN39u7qMeMnIh/lCLqJ+8XxYpKOagnabPF
	3/vesZZHTwr3eqgvpf7XlKrGJNrND88MuKtdL/ua3LOXODPYqVuakX7dQZxPfq8ds9dJlMWoaHX
	6xzCJSiauLfZJ/HKa5AB7NDc9YkGrFMSOpuBtsuWeT/DfuB1XstRYd/BTso1WFjQuqm5ZyQ==
X-Received: by 2002:a17:902:ef0f:b0:2cf:84bc:6e08 with SMTP id d9443c01a7336-2cf84bc6ebamr15641485ad.33.1784627638866;
        Tue, 21 Jul 2026 02:53:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef0f:b0:2cf:84bc:6e08 with SMTP id d9443c01a7336-2cf84bc6ebamr15641235ad.33.1784627638431;
        Tue, 21 Jul 2026 02:53:58 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:53:58 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:45 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb-shikra-dt-v4-v4-1-2e7a092d7f27@oss.qualcomm.com>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=6859;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=/fNttdj/mRaZU5Hi2i1TX0qKbxNI02fle2pe3GbIOCs=;
 b=OB8wM6mlVUoAn3/0tqQZ8eeuHXhr/SflmKvInV2RWA5F0CYT4OJ9S+mNqfihhRSb5f9R2UlZr
 Ls3gnyG04tqD8zgiyYLUgmXRcPUptsVjmQyt7pBIY9KgdI0kteH89Ys
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXx9MoxNCjip7W
 T2HGxKFNI7si+XmkHYZ+SdHDVUBvt65QCA19I0NwZRekd9mYz7E1zJyhiYU6aPPAN/gi9LZHsNM
 tvnXuqK84MKgNKD513k9YV0OzBRcsuI=
X-Proofpoint-ORIG-GUID: 6aqfmikkc_2DJbanYrzOqGo4H6n8EzZU
X-Proofpoint-GUID: 6aqfmikkc_2DJbanYrzOqGo4H6n8EzZU
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f41b7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ta4lsJVmLrVUBxl1HI8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX4oEVODeeL4b5
 R+HxLDDsFZuC3a/9alKeGq35ERqIPYSBC2+vstEFsUZuGngke+MPnxNrgDLBn2nJWypx/+yPcTX
 gd4bd11lNwRcpBrfuZCHk4D6EgDjCJHC3EEtNdfoRrDMYtG6bcJR9BHNOFNKfiZnCPUQrXUQs9X
 Kxj+BsNsyYleaU1d0FMjAfNNHxUI+9QPKBkrP4kJLZaC/q42mClbrhkRYqqLaDikGkpgSeiZr0H
 XkjE/WS3XGQzkgal02P8KMzaqh8TS87FighSrA8GtARZUZkoQoEchkeuonbmmNLL3rff0oTz7RS
 4waV7UxqYxO/X5QOe8XsSSwG4KZPWX0fDJyHGoWFPWPiLwWDD+de2v5j85pIxrJT9Ee6kIz7PL6
 YaXS0zJYXuPlh/U+Y84yF8WY/gGwLAHaf0O6O7BtOGeeZ8Y3eFhc8lclWTH0dNmDcVz89mXS5Cq
 nuJqJX3dqIuA+GwjbFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210104

Add support for both USB controllers and their respective phys on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 221 +++++++++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..7f5d584fc17b 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 
 / {
@@ -442,6 +443,85 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		usb_1_hsphy: phy@1613000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01613000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy: phy@1617000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01617000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_2>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_qmpphy: phy@1615000 {
+			compatible = "qcom,shikra-qmp-usb3-dp-phy";
+			reg = <0x0 0x01615000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
+				 <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
+			reset-names = "phy_phy",
+				      "dp_phy",
+				      "phy";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			orientation-switch;
+
+			qcom,tcsr-reg = <&tcsr_regs 0xb244 0xb248>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+
 		system_noc: interconnect@1880000 {
 			compatible = "qcom,shikra-sys-noc";
 			reg = <0x0 0x01880000 0x0 0x6a080>;
@@ -493,6 +573,11 @@ qusb2_hstx_trim_1: hstx-trim@25b {
 				bits = <1 4>;
 			};
 
+			qusb2_hstx_trim_2: hstx-trim@25a {
+				reg = <0x25a 0x1>;
+				bits = <4 4>;
+			};
+
 			gpu_speed_bin: gpu-speed-bin@2006 {
 				reg = <0x2006 0x2>;
 				bits = <5 8>;
@@ -640,6 +725,142 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		usb_2: usb@4c00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04c00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 59 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 58 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu 0x140 0x0>;
+
+			maximum-speed = "high-speed";
+
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+
+			power-domains = <&gcc GCC_USB20_GDSC>;
+
+			qcom,select-utmi-as-pipe-clk;
+			resets = <&gcc GCC_USB20_BCR>;
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+
+			usb-role-switch;
+			wakeup-source;
+
+			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
+		};
+
+		usb_1: usb@4e00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04e00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 91 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 90 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu 0x120 0x0>;
+
+			phys = <&usb_1_hsphy>, <&usb_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+			snps,usb3_lpm_capable;
+			snps,parkmode-disable-ss-quirk;
+
+			usb-role-switch;
+
+			wakeup-source;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

