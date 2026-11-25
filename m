Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611309;
	b=hg5+NNBHNFXQAKVqqHq2DRSkTMHNcPJFopGeArPVXswu1/CGOqtHKK7hQEdQBgvErSFU
	 qYJq9JpBV3rfhyfz8cUx+Y+bo82TL2ZSkOMAynn5H+8xxyZbGLiBXzMYIMcyI8gr+E8FE
	 yvrucqbIgSMccHmGtoDQvvLMa3pHNvGV4QkH0LYJGxWchU5ACL7vxatHh3/ikTf0p42sC
	 rpVaoF9LJ8Hvg4ztLjD6zro0fkoHGk0/Qau/mMqSSECjzYZJE9qtBuORx7jsmI67vQ680
	 MoHzm9eYtkiwAu2UMIg+1XLcE/uzm1B+TR4W5d8JzjWXNncWo/7gEus6txbCbncdB3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=;
	b=w5ll3dWPGu6NOJewwi2GdfE9eRBUhx2UMwZT0Ob0yfjybbfAZLMbpZi/CtsvbIjs0hyU
	 CPV+UsNGn09LKfEMaWYoFi6lbT6TISXq81Gkuo/kQLhANsdrOXJSOES6+nuHzClQgVYNU
	 HUrSoNCjXFED8xYaJGx75wcN9JcCh9iXDOAwzh31hfEh1+DXpCl6g+gsYkCbAG8N41J6x
	 TU7NlipdeehFeODYVOQJYLDvQjmUDvb2OsVwSk+ugS5eiNgULZVwLADBYN4Dhj1NjQ7Lk
	 WfSn2NT3WUcCj4hpEvxmbrtk6QG+ehVF0hLi1yAXioC5xYEGWFxO8nE/BHVu6bQdCFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dIGatuEn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mc64sO9T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD284606A33F
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD284606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dIGatuEn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mc64sO9T
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9me1x796860
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=; b=dIGatuEnNrSEPkUe
	cFNOr5SSZ8rc0TeagdnMl+X4+5zBnkc45bHx3JuJPAhZLu81bP4KHRy7+aNZJkP2
	OKAEFmJINCA2SebrVwy1K+8oJ1Cljylu8A4R+ajWxqKY/1f+MZ/1UOxZ5GJDwhIj
	13e1XNgCLvvB7Y2hK0q5LUy74LAcKg+ibW8CgX3E1EpyCewO2fNydUyywbWYT3UL
	z/nCOEBNM0qAnamvrY9ebqRddhgaGwJECGkICdTqVmlbzvZ5BU+2f99ZWY647W4c
	Za8y2zvLdIZRNmh+HRmx/koCocpNdtQHZyzeGqRa7ouQI/Xe2g6kGQ5ZDtvMVFwr
	/9RTxQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtrpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:55:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f09775bd77so4296695ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611300; x=1796216100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=;
        b=Mc64sO9TekIIT+VDWpz8WpYqnKAAYwqrl70z6uQgiLaDj4Xtww43JYZnDYetZq/ee7
         CxISOkRNuRIlCaT+1k9acJkt5O/BaLAQ9pbg4726Cvrs6EUi/86Of/qaMWrC/UMJN7aM
         LVlU0nn1LqxL9CwhIygGTqaK5It/J2S1zhjY3LAR/mZ7gn9icEGevqrsfjy6VWZ5Wljd
         FlayJ4HXrE8XMVvjBecA+3nK/ZTKkV/ZzreQ4o8jbmJZZCjWCcR0gix/ekuDSN200FWB
         2QhO0PBV+aQhrCf1cqYv7Pu9O+9InJxLnaoQikx3Uh6NJXLEanKqyPx/85uyyXG8oTOM
         4uOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611300; x=1796216100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=;
        b=YttVOmg/vwrmbZC1kmxYIG5Ph0Gk3o5m5mfn4BnzX7giiPGgnJ7eQ6KTYJl+7v/yVO
         5yHZitibTwbf1y2W5kbSW/ToNQSYxrVhOH/JX6bRmwEj8vf9gIcU/xE3wJBMIQmakkqN
         ifR7elwqNAjmCDVskxn7L+p2OkhBB/zmeooZkolk43QgVm7QVAI/hfYAmr/FRgN3ENmA
         BVT9T0mEbtEkbxUA4q6bfMncUy2eg7jzzuVtdXVSCbMhr5bSCvuYySy+QMCPmVaM/v7e
         mXEXYcCHZ8oK2qwvZY4pB4IYs+Uz9mq2IN7JzXAm8f3PBOWJCTbo5fPlG9as/PTPRphX
         c/FA==
X-Forwarded-Encrypted: i=1; AL+hErFdr6l5aN8LV5yhMsbs9gcYfw/ujh5VPzmHJsMabDRL030rm+uM7muvdIEccvZfEKdXm95j/isUuc/q@vger.kernel.org
X-Gm-Message-State: APuU4Z/HEiMJ3cMdkuC/gLhnodjcXD2MNLXiGPdL2KwFgIeHjXDAtJ92
	0N8uRMZIV98DFDxPrMzz2B+AV43198y7WePQJ66wOyO+1yLyW+CQuJaZH37qcNc+T/dAjCYSQMA
	Vvf7z3M6nJp5G/R56mnd2AqgtnhZMPHCTAJdsLdi/vJhEPGrxtMJmzx+EpMdCZUrV
X-Gm-Gg: AZFdTZd/tScCgG0OCKwCFGbcfTqdkqWF+7cCnFk6pAHhVeRaCVYmj1AMLbsUfMPJlRl
	iVsZSRxYTZQ5/J+E/pLgJzutLjAwiB/orSS/3R6JYabK5TqTDf39+5SbbvDJOJ2f5rIA1xg84jn
	tSsDLfgSjZenXLSpY7WsLsNa6GhYTEns4mHe9UJA3hgDGd1mC8oyAB18wSC4mgT5DKG5/n30+MN
	GKObHrEO3Jg9eEtFILb5LQYZgVEIPweNUyWADj8ucK9GQPooJNVTl8/ZW/0AMfoXxXQS5tEt1sI
	iNQoQTRhPrb2CB+6tVisaRyoZvebi30R0leNQrJqpS+cnO56SCsDxg8VM93ILGxyGE5CRGmQv5l
	ha5oJ16Hg2ylnPTJ8FgMIu2mDO+rgDgjOxKghpNjUsxJRrpPAUz9z5LLm3xMBnRLD8m3gShM7eC
	uUhQ7yDzhZBEW7hOfjRJr5Nfw1RMHbjqSZBqbCqbYCH1CUn/QOw4q3caoT2QBaxQylrZjmbr+mZ
	C6m8FA1UboA4eM9Sttycirnqp46
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277103305ad.0.1795611300271;
        Wed, 25 Nov 2026 04:55:00 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277103005ad.0.1795611299750;
        Wed, 25 Nov 2026 04:54:59 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:59 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:28 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: monaco-draco-evk: Add Waveshare 8"
 DSI panel overlay
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-monaco_display_intf-v1-4-8a27d60b0d94@oss.qualcomm.com>
References: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
In-Reply-To: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=3852;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=AYpwK+oMY29nTRrXB5g76kNxMBtgPBjHP+Erts0kWLY=;
 b=VPq/xz95s4qEJIiMSnzPU2MYdlsR/X/L5522kfVJKkIF17DvhT4gb/P4vNmnj4qVo9dIVzcvm
 /ATiQwdtpaVDd8tgId3WFuYXiCnpU4+kJ4q59o0L7au3tAPP2D4jaEJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXzjwogbD91mhN
 Itj+tML/SWOVwfH8oy7KKrfJDRJKCHBtFCoTHwnUIbjquqpq6te4LzpMhRzM5FltFgrpYbDAR32
 RF6dX2y7dzY/ZDxqoPpkDa5Slyc88SztQklWnQLkjsYNXc47Yixp7/dEBal477ezQ5O9lswImh/
 ee/DtCFfGVNDLqmcfWQ11nQi3rpX/4HQW911wPjP3dfeqQ7V8XtnJH6hre+Lwx3aG4exsaWVrx8
 r+yr5WRvDmklAW1MdjRqr0Ijk0oixm0SP4fGqz7KjcGvGDxsczuM6l1QFgLAFSd0sTM3KU8ht+r
 SjkRwGFrJDU+8CvzsExsuPn7PDS5LnwZw3/5webrT2STrFFnZlWOPpvo0Zsob3ZUyNtRz1aORTR
 wsTnWzcgGLtUOGn/w+Klmk7obbJZwEH6XHfqcc7u2CZYSQLWTlmHCgkJJTfpLTe2ZNKSe7RvFCQ
 XvraJWolUUBE5lMG04g==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06daa4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8-LhdloVUtFS-VMo-UAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ZKmkaeWthoRH8DqIoDCMj4TFSzmlSVYx
X-Proofpoint-ORIG-GUID: ZKmkaeWthoRH8DqIoDCMj4TFSzmlSVYx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX1yvoM4IXd34A
 9GEpF+Uu+kMjtZxkhfPsXouF7t3OS2egl5TD+uofQlBLVIdE/R2xAXiqSnd+b6K4Pgc4G4+KYAP
 SAjGa5eyPoLGaDxe08mITGsFp7Z8/T8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add a DT overlay to enable the Waveshare 8" DSI touch panel connected to
DSI0 on the Monaco Draco EVK, with four DSI lanes. The panel supplies,
reset, backlight and the Goodix GT9271 touch controller reset are
controlled through the panel GPIO expander on channel 0 of the I2C mux.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the
Waveshare 8" panel.

DIPSW2.4 needs to be OFF on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso | 94 ++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d677d1677f24..99c733c480ce 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -99,6 +99,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
 monaco-draco-evk-raspberrypi-dsi-7inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
+monaco-draco-evk-waveshare-dsi-8inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..79ce8cc4a289
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c_mux {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		reg = <0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		wsgpio: gpio@45 {
+			compatible = "waveshare,dsi-touch-gpio";
+			reg = <0x45>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		touch: goodix@5d {
+			compatible = "goodix,gt9271";
+			reg = <0x5d>;
+			reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&mdss_dsi0 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		backlight = <&wsgpio>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};

-- 
2.34.1

