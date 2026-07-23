Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E4743551E
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802848; cv=none; b=JNyCQx23zLNJly6BZ0iQLLNNIsrEKc8krlnm5Eh0xLBmCB8xQOrlQzrmmuHBQQar34jU3gz8hM5LVLRYw14oQ2NW+a5cRz4Sj7CaoelOkJrrCDmliXvdiPHkSvNZTbJauNxf2Crzh9tpDolLG2bjrTIQaguT3GQwOpWaPnjfmxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802848; c=relaxed/simple;
	bh=zDNjHLbz4fAir6ZoumvHrLn/9svCp5ruHffo5hKQ9sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mw7tNpghnqPHP8ImK8TzaSLpxP68EaeCA/7mEljo7erEYHC7VwLmD1nSjkeQfDd8+Xi3GIOKt1TV0PbXMac7ORSreft9+NFD4KHwtRaIGshLsQOTxuEFN0L9AZkKBaF810aOreMB42uEBWifh3t/stGIm22sbdSHTQ95WiM6IZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2Tm9H/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJ/Ow+CS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2Tm9H/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJ/Ow+CS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qVjP467134
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8qmROaaIltH1Kc+hD4cQbC4K7YQMrAQpU22BKyka0A=; b=Q2Tm9H/fBsw/2efB
	Je8zR20sJI+FTnJhGGSgYOZFJehDb/RV9NCR6b9U142xz2z0rHZDtxvn9tVdUCOZ
	9rmUjgk3Ooid+iYEBsQCAs1EStzX7aVwEI41UUGfsUJ60mOIG8D7fm3kyknEwShE
	9Tf6NxOYTICh4zxWxY4//0tPzeXwtjLNlVefMqdAcDhduq5eatNSWAZmGBBBQAYs
	tN4CswasZ9K723hOmjnWBLhNuxlPEhCE2gn/iFK4rJS3UO+HJvxim8aLe7ZxnQvs
	jgRlCCbzCZHrDGfdY7V72xHlHtdBRY4B9hMfTSSx3HIMZHNJGaJhh6o88VatJR/N
	HcM5QA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xukgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:34:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cae455cf6dso9294125ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802845; x=1785407645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8qmROaaIltH1Kc+hD4cQbC4K7YQMrAQpU22BKyka0A=;
        b=aJ/Ow+CSDs6UwGqa0Pf5jb78A5TNeQoHFPf7ZnE8LcQ4dMB8VrhgHzX9iRHntIGrZJ
         r+ZFjmTL3lGjLwTjuzkSscuCP7xfEIKQUJz2To1hKyM9Vv8hg9a1oIHuOt/JJH6vd+Gd
         tlH8bqWS2S0quoLpbDw0LivWaInKajcaCzNcp0yzpdYe/U2Fm/FpAH+BOhTRp9lvSvsi
         0PgHGG47KU1T6E/Y06MYb2Tn6EDcDqv8zk5ETeo19zIdYv7fxraPXPEM4R2mjD/8PCHW
         FRbxYM1MBwIj89HGE6E0UtTiyPyWguw74EtoCG14CIt9ec18qDo9n9oPG+36ULF23nNR
         5EOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802845; x=1785407645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8qmROaaIltH1Kc+hD4cQbC4K7YQMrAQpU22BKyka0A=;
        b=bngArG7lc1beU+tFPUOWwLLw/h8aLE/x0F6EVeqv9jtfTY00jaEvRaxMzCVDKo2IQC
         W9y9AvM8hujb176nQlBLhaZs+1EWCpyWOreAHVC5A5Ap5bg6lychlhfPLkK6W6sG5700
         EShGExeuFtTkUQP5wjKnKk9V2c/5cgJ7AVhzAkXC0Iqn0u7SAU0J+89HlCr5QQfToD/u
         kiKfGeGqGmq9PReBWcHcSQIIu51A2ZUEGzCJDtOQUiT0bGhylwCYnIQaciFhUd0EP+1o
         VYzPZvnmUx+wbjN2IE8y+6yGQTyFqqzkb4PWhC1Jonup0RVwetN+fq8wzA4R1RKdpn3S
         0+vQ==
X-Forwarded-Encrypted: i=1; AHgh+Roz+hil5G0K4+51Yk8tFjl0TcT2870AbT+IqiKjaLnEgvVHbZDfxUdPG9vULVuACXsPtkGozBgvMSSe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz09+7tTXi/v01ET4EFZgh2j222X4ZRQFLe1Z38l4R4Nuiwy1bq
	QwSWxiZPl5FKFkWHvcWRCn0bIhoG8d5TeKGZ3H/Rh9kHdVi2oWLeIaXWwffgOCH7avtvEK1b+pA
	uO7khD5ppaCL0OthnPfs9b4F84aNpihxZYhuzI4OZqIUpL100bXU/GgWaT3RjgRnQ
X-Gm-Gg: AR+sD13ffQcoL7Pal4O2bN9QrqPiotUj14fuywB4Gujzn8vCtfd0E4z+yfyBY613azO
	WdlvzeGm19ymzJi0Ivb0IoAd8/sYttZx2223mDqk0hX1QE0hOKQjnw55SMpJpAsEhqyscavsmpA
	0IRhq+p8T8iIX2P+IxijZmqOpN6gGzC7gewTom2mSJVAH9BSvwQxv8ujD0wfjF6mgU22WtrnojF
	1XNsiYPEKxsqOxrVPMRR472Nar3p7j9WpqzaT0sdIGQFaU4LmAIcGAwCz0SMLh6wZA4ipySrXe5
	hjUr1roFWHa56b0qOIUhsPfu6wi7Y0i/XAq4xwiOS88vqsTNIC0rGK68UxsundOQ8VsX8ertR4G
	3pfY1rjt1omehsQT/JWFFBkKt6bXar9WLDVfB++RS6Byy+ZYeORRKdIBUxPS/X/VCG+TcAQ==
X-Received: by 2002:a17:902:db0e:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2cfa748cdebmr30279235ad.28.1784802845309;
        Thu, 23 Jul 2026 03:34:05 -0700 (PDT)
X-Received: by 2002:a17:902:db0e:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2cfa748cdebmr30278525ad.28.1784802844272;
        Thu, 23 Jul 2026 03:34:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6203sm32416155ad.44.2026.07.23.03.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:34:03 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:03:51 +0530
Subject: [PATCH v5 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-usb-shikra-dt-v4-v5-1-5b69d9eb0888@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802836; l=7385;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=zDNjHLbz4fAir6ZoumvHrLn/9svCp5ruHffo5hKQ9sA=;
 b=UJXh8il8VR0OaImvabXp2FdizVtCp3LTgDAQ6lmaW7MoKzIKXKKwnEQuZlfivnwxXvaec5Bkf
 ZIB4//EFZXUBIyJh1FgJhPhBI9zESsjUDnnKvRfSsfdtmhEaBPuY/rV
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: vsEtXuZ9cFTvOZspk6QCVp8c3sbkhhHh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfXzN+iJuGG/E5J
 EkdTu1EDNN1LqN7ExwHrglrKN4rsXWPNx8dihSLC72Cze9JOTfKF0J7wMrviLjG3ZKFOcwaHa3S
 2tTbmEBnxv6lq4Srirwk4y/NHDdlrRI=
X-Proofpoint-GUID: vsEtXuZ9cFTvOZspk6QCVp8c3sbkhhHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX6T1Ed+COEJ3H
 Ib/amTspfdGn2ysGjrU6Z6rBqDPFAvuxdMj5sk2aHKPsq0sXoMcu+VGt6gJTnqZ1vTJzpCn6aBD
 0WVsJthch1yAgQdySO3r8Z756zfVWw+WYGp8c8S7ReSx7m+moZuN6LkwyRzRGDZ7PwWF6nizIln
 8YL2qI/W2sDdznZ4mYRj+woxCXg2R6tOUCC0yLV51cZliBMysxEvvbpDB+RqDobZIgDvUtEznay
 yHDtAl96Tku/0y74KTfdd4aKx3D9yrB4FSOSHmyjdqhb9wXgRHqqMjdr0U0crr/wWYvhZs6F5Ha
 TCYQQwwa/TLTzqD70Pff+sgmhaGNF557OQJFKWWtg1E+r8YtD4rfy1Rlk4gBlBFWvynDIjLGBju
 uhy/H9MYfZzu34KzjT/ZfdyHoD3L7FT9kgPkd3vDO1cSrFrNqInI5SdGlSLRl2+e5zIID8Czm0k
 +WXo670jBY6dDHSb8Hg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61ee1e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wA36ycbUlljGYm-j3gwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230103

Add support for both USB controllers and their respective phys on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
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

