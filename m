Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021237EFE7
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219369; cv=none; b=gIfWFgDgEAJdPDCC5k4ZIo3IoIVF5t+M1kQv0raoqG2lPJkrbTPnUTB680xW65YXiAkTdXqhP50r+P+0D010cugS2ji2rgXFqsD9SMa0AzrSfyXx/ovKXoNRtDnjfmr7YZkjtto/6nTWoixXfJCRtY21Mn1bd0Idcc4+Q4TqaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219369; c=relaxed/simple;
	bh=DhEm+1JWepm2P+dN4sZDmJseyaBg9adswfAEmTRMLUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmPGbxpdCKLFnGgIZWGuzkt+jjTkw/m154xNwhuNwjNYGy6QFK9/hg9nJ+aOcWIwOXphmUI8oFZP7Tu/2/xZLOHUVYmLIEwhOT8IoNiCFQlCN4A+5TGO3SxiYMWaZuJ4DORs5vdf07B+V1eA1Z7Jn7PlIDNeaREzAJNK4JnuIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axnEBJOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jwn9DfTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axnEBJOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jwn9DfTt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSqha3002323
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2imiRgpQB7OQgK4Ohs1pH8krBYFWXTY9Zu8UGNU2E9w=; b=axnEBJOvtOkRL+Q3
	rrpY9lm1lBkJomex19tLRF1+dX4kVdcC09g/jSkKSLoiyKBFrXycorFCEuxkxwLE
	dyqAnXV26xuw6DaFcgfSRL3JpcMoLIr6lDOdWmQynni+UOyxQQKrtbfmTlaA80EN
	f25Dk1pr8iSNQjO8KW5mlR+p8BAiP9i+hNPf1h4TKSggzbUewpZhu0oGyMQW8uGb
	ulJUCtOBA5epidVK9VbB3Q+OSnm4LD+YIGIGtBAwJb/HzhEoEM5fyMkJUlzJjJ5a
	KFAZo5iwhd01NcYLdGHqNfKMa8r0SUIEgyi/pzMd3XoCEIeJSTDr67Bx+tQJklWd
	tHwn6w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9gcce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbb61893fso148533355ad.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219366; x=1784824166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2imiRgpQB7OQgK4Ohs1pH8krBYFWXTY9Zu8UGNU2E9w=;
        b=Jwn9DfTtoBNDoJIRk8mNqcNywPtm5QTvdRAYt98YxB69IEo0ibH/+fmVvWajYYSU5R
         9qRZ6eDjfrYHOOCinaD6e8wIcsnCa0kAX6S9MPGeXmkxPsosSf90PdQ84CE5ABzlUK/B
         UihzchabeMrVqy7EHrOV4yQsImaIp6M+lxEelAGHOTRbrOvfl8eGW0qU1gGAnO+i8bdr
         ur5BEyKHZXVMTcEF9V1tlDUU3rAcyNxXN/tWDfFY2f8v2OgAyfJDekmhO+tXp2tPnznC
         ZkH+wLR/T2pNKgUMBjsF94K/Nor26O/hS4QnIZmljGFfCEkN99UVNBjT+0It8mKMXrD8
         uc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219366; x=1784824166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2imiRgpQB7OQgK4Ohs1pH8krBYFWXTY9Zu8UGNU2E9w=;
        b=RrcJf7l8DY17M3sGz8nJuz7OgiqaF/Z9nn9m3V1h0c6n307DNAh3ECMjcLJ7fMjXE+
         90GSYumfBoPjeVyYRYc2wUlVMmgjBvD3HVyZ5KvBn1trKJmRWE1+O+UPLDEWieMxRcEf
         U0/gBp6PLONtxxFm6oDotoRTDFVV0Xd2NduzlrqwBB9Oz5FoP4AfKgSzxi+AK60z8jWR
         9QY+H16zYJaXJq5MW2dwKArW4ltWzq2VYXklFfCse/IZGMeEVXkf7o98LrrYlOKJmBAB
         MA3fi+tR0NZIdGfrPfPbq/lNLrihkw+o4jmzxojUo0IDtpzGt51noj6Iw8+aU5PcWbjz
         lPPw==
X-Forwarded-Encrypted: i=1; AHgh+RoELNAkJJ1PgZOcMSk+iTugbyLgiiTQWOrHG1EABcnrNRCOGOJ6WOlmAoxtk4OkE8CxX4eDY0w7PcXI@vger.kernel.org
X-Gm-Message-State: AOJu0YxeYcGPxlX+sVC0GeR2EW8Xdbv7MaRqYQRi0/jWcsE/IC+0oMgz
	w4NbARi5ltjvZt9FzxkmIRHyaidkmLbOgSJPGvSKdzqmnCCpQamlk6JBslee6fZLHZ2EbB4QMnb
	BC2V9GLHCujT0xh92YSPM1XJPnfEgrD3A6uz4SaGU9det/2r7oeCmRSRubxH6ZHf/
X-Gm-Gg: AfdE7cnw/HaagLP1BisA2ZW98pVY8XrNET3ZXyDEr6hDWfQqwrp2dnkzIsjnYbZLDWo
	hXumTLES80CP5F20F7jUT0wkiYMIIZt2Lx8XNwrOW26lYqbkOI3hRirkUQtt1kchpS1VgYMrZNw
	BnGhwapRao7xd3tTJyLsYQQNtnB7WW1fXHFD8Joc07hg9LvD8wMI37QPuncohppnymzHoMrW7bv
	czM7UsbCuq5SAwfCJKD9VMVzEMmmugnP/zOwExHJ6Cir69WtrLTn/QgHFCFrrU4PzQyR1kiTM+v
	/WkXacNiGYJSIdJae65Y+xQ/vD8YeZYIikG7/uQZg+A393Oo5uSUTj35fH4035ANShzNlZbVrQg
	E5M5nmtM7/cPZAZJ0EIXiDCq6qkwDqA8F068RrOsqjphJoRrI69W84Dts+OszAo0ICdntYw==
X-Received: by 2002:a17:903:b86:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cef1363a32mr128826235ad.18.1784219366226;
        Thu, 16 Jul 2026 09:29:26 -0700 (PDT)
X-Received: by 2002:a17:903:b86:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cef1363a32mr128825625ad.18.1784219365582;
        Thu, 16 Jul 2026 09:29:25 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:59:07 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-usb-dt-v3-v3-1-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=6859;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=DhEm+1JWepm2P+dN4sZDmJseyaBg9adswfAEmTRMLUc=;
 b=CsXkObfisxA3ZECMyTOlnZ/KeT4DzfFFEhYKe0WuNwJPoOurttrpjjKjjPNfaS+zj+2/h1I76
 JEGMD9SHpRIAXRHEMTT0a8xJOgwyNqkx0rKRZBaLhEt5Ih6/GFlEaoA
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a5906e6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ta4lsJVmLrVUBxl1HI8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX19el21CItrMI
 FlFW/EJlZO9qaOSE9F5ZGrhUKhjROAv6lCTwxT+qZ3qby+iPfYDJ9EfEWauSOj9ZA2SH5GgCsXi
 fkvkZFftlV2e3Xxrd7W853re46C1ddOp5TsFWPqSLK0oJ4SGvsj6tqrO8Pv3bTNh8Uz/YzKF1QL
 lBi2W18OJ+hq2PP5fJ1C/8/udG6YqpVkLd/n6TOZ5J3D4yDDxm5/JZZyPkjg/+fcVSR2s4dHXfP
 PseWsQx+HWffYOLn5zyhzELsb09KpAy3x3v69ADOd1607TYC0aEJ6mRc+vL3ENuO50y8EHN+bpC
 LjFD83y/REbiR8XOsfZfsHaeGrbQx227uuLskGWk4MVnmFSUBB4Srdlewwj1QrmjeySO2ub6BoZ
 17qwaUsymiAGuu1M23ula+32A7KiFVf40+FdIEijLcTyfNBaA4ivCXp5TDb2W6KxLxI9djAyyJv
 +BkGpGighd0d+kriRKg==
X-Proofpoint-GUID: WPgLmUlqScDoFCduXCBD0zxUVgtIEvKH
X-Proofpoint-ORIG-GUID: WPgLmUlqScDoFCduXCBD0zxUVgtIEvKH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX+8rrZ9dqgS+d
 Flh6n10LrZ115G49+iMiAB0Kf6U4OK69kKnCc9DwRVu/DPqjXxl80/cwJ4Jp06mlooxnyqugSYl
 vaJW0399bzJnZ5nsN1krT8bhHAy7ySw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160169

Add support for both USB controllers and their respective phys on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 221 +++++++++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..493c5d999d87 100644
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
+				 <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
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

