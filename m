Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888BF3043CF
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224455; cv=none; b=cp3kGeNz4j8bl4lfkhKH81cBIIhsV5S72+gysDUy2YJ5rcW0+eonmnVPgQZZiEflfFSe3HHwEzK5yMAJX6a313sO8QznYYt/tBkglDtCjquHvnsTtuYnCsv0IAa4IxeYZEnKWIJtDcnrZtaV/hMWzMxj39Pazx6rXpSxxQycL8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224455; c=relaxed/simple;
	bh=mKl121Yawc/mikpjjFTjhqC+NwYrSlXT7RHzgVfnch4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksfPvgEeLPUeq5JnNW8zDqUIw1MKw4nTG1cdcFlBjSQ21EpySEkIkKF24BSjEy/zJ9yn7ADQAIGZN39MJPtSwyRkkwqUgIT2ckUacLECGBbdmPe4gEs/YRVdR9urDUbYwKROTc/SWSYmQ4QNAJtiG2vpUGs85+2XGL9u7fII2Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I72fU8L5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UurrfEAt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I72fU8L5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UurrfEAt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdTFA197994
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jn2eu6VSSJ+sept9MLYmyPmVOtT3T3uFVTDTwkUh2ak=; b=I72fU8L54hqZwfTu
	eLCrv9FCBDQN4uHe6GYimgyZnusuTVBgxsNWFm9vSwtnxgGVAD3O4ERnzr0+hdpX
	yUDS6VRD2GywNB5AB7Hv8tHyvU0cUTCPZ/7bngeRUwnB0V9Jxo2efx7byfJgcEFW
	NZSMpd4MqDl84ufmjFo45igziKJENGwRfn/t6PBgLy68viXJZDsRh36cU4YgbaMr
	a4/TXH8Qc0HAzEgcVbA+POt6wD67svvCDfBKj5rh2XR4tg24NeeTu5KBppnfsnKz
	DjPR1EAIWZ1ztI4Axt5BAnaXouq3/JUcrBbD/2CfbDOkzaV0XHsi36vWBMPEhMf4
	zHltrQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ch5tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3208242a91.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789224452; x=1789829252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jn2eu6VSSJ+sept9MLYmyPmVOtT3T3uFVTDTwkUh2ak=;
        b=UurrfEAtv0XLPQHTPDO6nMWRPMrxCWGPmJ410Py4DJLXEWRNr2lR90JgvcBXzue3P3
         btCTg8rgHNgszCDqi2FGICJ6GjXd09w36Oj6qm8JyRcwsDiBoYJeLdOFuFcFHzPhPhAP
         okJgOTt02vkEk4hej0m4oBROWNoHjD6WfGx7/OMBio9bk5M5reXuaDSNfgAcKSXCqBiL
         UfWfYgKFCyTIJqh8T3CoQ2bFzaPPVoeiItDv9kVsFSXy7Su8E9bIGexTVXhhtZvyVlCL
         cZMr/LU0jIWXqEIFKQb1XylfuWMOPb1QHab82qvY7KU7ngtdUyUGn1h+XTh1K3dpLIGe
         2vwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224452; x=1789829252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn2eu6VSSJ+sept9MLYmyPmVOtT3T3uFVTDTwkUh2ak=;
        b=LxxQF0KFEyZYbHP3hgTJ9HK+4IAZb7PBdXQQ3T1vGFThZh2YvU4Cd/OotIwSyQnaZp
         2JA+oW+ND1Bfrcj1ISQbQBWlJjrH/6RqbCX9zd29EUsggQJBjGX9Rrj91qZn34c5SmPi
         7Mx4iB82A0aAYbjgkcFxBdPXIpSxzmV/4vSJfMKmeGmQuGac+z0ko4S9b2JmGyt/03gV
         EW/2PiC6iiOHMw9Rylol7nCu7wy8H8NsFfn0qn3p2cPC6N4ytXNyyC+EmKBetsw+H1t9
         UBHQyp7N6j+S20ItFlBtGdLNsI+joh5e82OK2ow3MFIEMr4dejgMcCasYe0JuQiWThtg
         44Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzDUTn5PJFuFGiKOFee7N2ozqeDYpTkYomRTVAoxLraXkUuZJdxybhHPBcqsvYZK75jCmOTWA5G/DY2@vger.kernel.org
X-Gm-Message-State: AFuF++lffgVUordc5pPFKC2EHLJq6j69EISb/KZSWx2tUYtfLX3NtWOA
	h9nGEcxbiq0e5gqAgIIyA06O6JO7yAD5AIocmXkOXNlFP0nwJCB8qRasTT0V2Jh7YINsQttpHg4
	moktjyGDJfKmZGq68gs3WXc5tzqyW/TMgG6I0weAtorQ6wCxED9nF9EgvTgZM33qRvNQa4pEK
X-Gm-Gg: AYBFou3eGekp8MnRKdrWQbq1KZpqDsVLYvN6b0IpKND/v2IN4bwuQkXsZLCxxHWfI34
	4fIvYAD8pd9oBi42xVVpsdiz+EoPpwT83OKBIWqINmUy+UW7t+NCxEjc+8H/A63l2XIM8eHPvDc
	eG6XACiXH8piJILQPmq8HX5ruMm9zRXb1fML1WQOIR538MC3U6x7u0SH1aQflVq6mD6rVT/L+HO
	qaCiAm9MxG4cCncSjkYyQapy3A8iO//XYWYj4EjABhuqdXxO4HD40SySxpbcWQaK6wXGvzZVPSD
	EuolarMsnDmUr5NfgrXb11NhzW5xk2oOYgBYbGMWB5oKrh24CLrcmKO3VIE5vlLHRQzcbT7tbkX
	V36c5pY2Ebk5QNAs=
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr19440919a91.23.1789224451787;
        Sat, 12 Sep 2026 07:47:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr19440889a91.23.1789224451316;
        Sat, 12 Sep 2026 07:47:31 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm14344833eec.26.2026.09.12.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:47:30 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 20:17:02 +0530
Subject: [PATCH v9 2/3] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-usb-shikra-v7-v9-2-c7b507a0ec27@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
In-Reply-To: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789224435; l=7692;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gGlOGXiAW+MTmFm/4DBrV7MX3wm4tyHd4TVI8Hor2y8=;
 b=mlw5lkCFZ1EgpiUbhPKtS9oKY8k5SiEbeITreCu6HW5W9HAyLT2EwJfS0HC5fOZe9hwOwDsYz
 4iTovBPZAnJA3ds2UFz5WlCBHXrrK5sYaJNP+mmH3hfu5P2a5kafQP8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX24rp0svM8A0Y
 psYhKJsLIteFFdX2WiJiM8+Focl+7bdFoMwHWdIwFOgEcNsPqtOyp+WD4D+Rrx1UBzhTQcVkLt0
 jYm9uQ5RWaDYbDWFE16/UZ02iCy4eLTAiGmrcG2UzSR4TvB5k7+Sg3NXjPEhjf68UEq9izA3eLk
 a6/w94nwLnJgrbK/AdLi/Xi1YybTe67NZapU6lZCY1PpGWoBd1F/Ir5AKFNN0nqxrWC6+fkieQf
 Phbrw9J1VsaeI2HvS7IXT1tz4bBVQQwlaYwIpOTs3c7mnIwkyOZS0tW+gTYcC1PHhqA60vsHCDJ
 mwjSbHsTTmrIVFTXN0YmmzadxkUuHtmNbT7xhw2pDZ+onpE7UNIWy5N97K3YGN0o42dvAXIaKUw
 uLBzynXvtglZKcxuaWb37xFZpqY8kE70kQmURF5YVq4EMQAofYDxSDnDzimRgTwdEYs2seBOmyF
 Z59XSWTGsdOXxeXpJbQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa56604 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wA36ycbUlljGYm-j3gwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfXxKpa0/iKxtAs
 runuwbVv4x4L+yGFTAyNL2eNqem+iKBFMj3uZBR5Yqsxw+Y6qHfxsSDDgU3E9PinzW3sfBfPyB6
 0XqgJdWAp8ukcMj+ra/hfgBxsUdMU0E=
X-Proofpoint-GUID: EIqqVFBv--yQwtJ5aQ4Rgid4w98qraca
X-Proofpoint-ORIG-GUID: EIqqVFBv--yQwtJ5aQ4Rgid4w98qraca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120213

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add support for both USB controllers and their respective phys on Shikra.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 921ae2a5a3eb..1395c182a2b1 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -1019,6 +1020,85 @@ gcc: clock-controller@1400000 {
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
@@ -1100,6 +1180,11 @@ qfprom: efuse@1b44000 {
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
@@ -1977,6 +2062,154 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
+						  <&gcc GCC_USB20_MASTER_CLK>;
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
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000400", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,

-- 
2.34.1

