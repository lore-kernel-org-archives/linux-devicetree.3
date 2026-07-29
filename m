Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A8D4D9901
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338665; cv=none; b=PrUQy2I5VKisoh42jbteWOiiQlrlE1xu6PklEP9K+jZ0qIDH+24SuaOGAaDBdEtdyac+YaAKL+zoXc+CzXln9bZQQR6dnuB7H9gQEDfqbiuw4+T8mN65LZu2DRGYRlE98naYBZARuLmWzW6mjLyCIxwJ5NHAdJ/wUaxGJ/KLkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338665; c=relaxed/simple;
	bh=yAXNxAen1oEj8Ak52zVQcw0xOfUGlNJ9B0SjdiZPXRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMq1Wfmx2/M/T+d9/IZS2aeAO9vytXwf4rsTR0Gu0Pc32r/GlDKohs2ROoPeIvtYdRu/dIhyCZkzZlAEknrU6tjohWw5edEr5DaZwIkNBam+YTpaiqEcxmfdSRL/Pa2gUe8x5SWWBEXORA25soeVsHETOyIwYOUzdvLEG0KeZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQBG2E9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pk3Q0ZOj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQBG2E9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pk3Q0ZOj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF32cR2328239
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sfTA7SfIPlImD3JADF2254kesIZ/TDX1tnUxjiCGD98=; b=jQBG2E9UML3JsiVc
	yrPKYpizckeSFEhlsYgJISGVpMzIY0i/ZNHvYPZ3k/fEz3Gw11D2HMY8RrbuQJKZ
	AW0Yfm1L9tNcDS+7lAL36rF7XOJyGLfSZZfcQJrHb92tVsJbsKnYW/JaUu7064Xp
	th5ghIFMPzrfMQnAgeQsygCIPI3rNLE0CwBBMmI2j34CUJeG/eqoSIu2b7eytFl0
	YYP38+wiXIBEVrlKSwvYkgPeGTZ5+U7YaW9eWWNPiaXnAoOTuAr63r0z2rVpozs0
	gVz4H7m4noHw1bvKQvEtJMRD3ueISbOE9GCOQVuQ/74Q700YHi+b1y4IDmqkohNC
	v0SvNQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrch29n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:24:22 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-667d0d587e0so2915921d50.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338662; x=1785943462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfTA7SfIPlImD3JADF2254kesIZ/TDX1tnUxjiCGD98=;
        b=Pk3Q0ZOjW88/xyDcKUjXOol8HCSi5Fx42zvn38ot9xvbnxIfQFakCb3ntnC1vTufsb
         jkyVaQNw4z0MuNEs149d46N+DLlYAG6ed2OgC7H2UZXKxyeFCKw/bIO5LMIpfxxPunJd
         zJ9Yt7+9EsDKtlwdjkIkOJ9U97XDCj7kFe4+ISMhAGpvz8lmby1XkZ/6bS7KzevrOKVA
         71EFqAogr1i2qFvJDf/g64T+NhbIjS4hnCCoL0nzu4Sf4O+8Y0LaGSLyhd4GomdWSgtk
         46DXk5U4OgPqzTilzDkvyhKRnOajupDH+Jbs7AcXTWH+ahXxWaGdyzTyRuRuF3WKuXaJ
         LYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338662; x=1785943462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfTA7SfIPlImD3JADF2254kesIZ/TDX1tnUxjiCGD98=;
        b=KMgiaxaxHTWBsifFxxhSRMB5vnT6EphvdYook0xMwKYiDa2utlRgHRsH64IwBRUt5Q
         0XqccsyW9ZNeW2iXPplZQkJCeO7fYuWNoD970t0DscnBhI3Kid1VAmXgMii2O+ckRJ1w
         7KWUNbODBJlsG11ehDTHyiA/ZPR1nlKP8CeuNaNMuBcnoB29tCLb+Y9NdujCqGa+3/u3
         KOoiOULvWP9JcR/YnnRQlv0lZUSGl0FnW75V8F5D5rlblLgPbCqJq4C9JnZX9MxS2bz5
         xGEa0YuJ1vMjWkUWm1yaTmNbSvazWO2mY11tUecOwC07wlohuuh6trEjPV/MVIPKQ9ka
         yNLw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+iM3qe66UwMz3bazLmKomIZgEd+sKDWsd8dbpp41SHdgOaXHOVU06CT25MjRHCbtD855mG+qAsa8S@vger.kernel.org
X-Gm-Message-State: AOJu0YwEUDHTeVJFWTUqtXcaHcY52XcBLOgfeUyLlMVDG2ZYG1YpEqrP
	SOPpgd2ZHI++J0mvUNKK7ZwhrNVm+TMi0AXSrdbW2bGQoGwlBWtxNAmhhFbAqAieyTJRyZ4vSI/
	OJacsThJQ2DGVNy0J/fTtsrV1r9DhzFTlSdvJCiByQhk2tWIBWD9Kjz1O1KtMr1VM
X-Gm-Gg: AR+sD11kB2ir/Rtt3+z1OwD+hX+sVcHnj4Yk7a14p2oe/DaIJDcm+CwvweG4y0h8vns
	O+Cc3CVJNbkMW+LwRp0k1MhRulAIFzUpkD69TBUJYyIlgqEJJV/Tj2Xq2CwsJ1dMs3OnwjijqAH
	lue3xWXUtd+IFt/i4N9UNPKW8qiR/IIUlQsWU0F6R+85BuedU4Teibi9Bgg8QZGTm4T3GmVPWIh
	XB5BXtKng8f+bO9ph6anfdCLLsDD332ilsHhb7JV/s4/lMmq6NkWuEIHEAilltZIcvFD66oLy8w
	BPKQWkbE4zmOuTL/bg7eK3nN7vcfiojA5VVmXhKLDa1Nevt9MO1bEFLloQ1r+lWQkWx/352o57I
	r+9HZf/IbErL1LwVCSWozBe6DCRE/XphGKaJROvlErZzh0JF5Cou4Tgsbaq+HAkOerZvigA==
X-Received: by 2002:a05:690e:69e:b0:667:af58:8d6d with SMTP id 956f58d0204a3-669054c7fe7mr2732895d50.12.1785338661794;
        Wed, 29 Jul 2026 08:24:21 -0700 (PDT)
X-Received: by 2002:a05:690e:69e:b0:667:af58:8d6d with SMTP id 956f58d0204a3-669054c7fe7mr2732868d50.12.1785338661144;
        Wed, 29 Jul 2026 08:24:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669125fbbecsm2050937d50.12.2026.07.29.08.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:24:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 20:54:04 +0530
Subject: [PATCH v6 1/2] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-shikra-usb-v6-dt-v6-1-72ffb4796a08@oss.qualcomm.com>
References: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
In-Reply-To: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785338652; l=7446;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=yAXNxAen1oEj8Ak52zVQcw0xOfUGlNJ9B0SjdiZPXRI=;
 b=WpTHqtrj4oA7J4+tSlQ+Z1LoMZnhaIkzliu+Swp6Ia9IWfSDURJbgLLZMHBW0Qcfs3Z7mNjSw
 408BEy5Amq3AmEFFxebBkIcE9hKDlA13/FZx3Aos9dkPPNJhCdd1BzE
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: FXa9hxDfUEwRHA0t0wvqDYblK2epJp3B
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a1b26 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wA36ycbUlljGYm-j3gwA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: FXa9hxDfUEwRHA0t0wvqDYblK2epJp3B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX8ESsefF6Qq7X
 tNunimCaqqa0bbvA+57IHcLdys2Ogz2SDQw4vthEmAsLtXIyq3sOGNqpBlpT7Gz2UNZ3L7SLZfq
 CLFTPgvbCSvlMQRIgNGWuH6yJBDUgYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX0epGgVf43izN
 z9+6VrUKYTJHBr5SHytClCp6hF+8XOXZiQbXDy6UC9td4i7WPdp7CqaAYmnJDdYfuu71OKvYupY
 389mdCdhuWC1wVagPUY7JI9oRX4bGpWi0hWC+ZZAGKkTSvUJGp7ZFteW8IY5bmALDD01rjCsgRV
 JxpNI2Am47gALfnVM5sMesFTTj9tQj8ZHPK1OeIKTKGwVahJiTLJhdoKBbdWZRe3ZCdF7jiSSDd
 pJaZnvY8Be75HP/0V1uJG5DmTdDA19uHDoSHgO/t7HZdiD4nsmLprdhGdK82cbSaoqPDqSckLdQ
 7e8QczhS/qo/Yy8oGYKVGvziZRh0kjpH+W4oPbfyXUwgvZTehox7Gm3HZM6NncF4lCIVyvVxYc7
 QRuWpon8xX7uE7FKVtuCd0gO4LUEe5cQmxxy9/v/yNHlQLUL/evF0SaTxKBtw7SVhbv0RlY0vek
 XwSOXyn1l42rOqAJnFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124

Add support for both USB controllers and their respective phys on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..b5cc159e5dcd 100644
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
 		system_noc: interconnect@1880000 {
 			compatible = "qcom,shikra-sys-noc";
 			reg = <0x0 0x01880000 0x0 0x6a080>;
@@ -488,6 +568,11 @@ qfprom: efuse@1b44000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			qusb2_hstx_trim_2: hstx-trim@25a {
+				reg = <0x25a 0x1>;
+				bits = <4 4>;
+			};
+
 			qusb2_hstx_trim_1: hstx-trim@25b {
 				reg = <0x25b 0x1>;
 				bits = <1 4>;
@@ -640,6 +725,154 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
+			interconnects = <&system_noc MASTER_USB2_0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB2 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
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
+			interconnects = <&system_noc MASTER_USB3 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB3 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
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

