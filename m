Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9F02D12EC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603297; cv=none; b=KtO3fIXhfKECA1zTrdWpcddoaBu2X8AhvNgruWsb+lGxvqFc6kz8A6FB/3oEy8Kl3OjQVNZ+7mfjH061YIzAgiFRwJAn57RDLx3kU7ZnHHeS65jDeuptaK3J24Fzpk6H/kS+bAIFgnlPVrrWtXb6kNByVnwDWjolNmOVR2zJMiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603297; c=relaxed/simple;
	bh=BtpuGkJvyEh+v50hJEHKjTHlSJ4ScbJTO7pAmd8N2d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AE939Y4xNZJBYSfKqYb6eIwdAZg+D08h10Ik/qOqRE/E/L9oQLDPdxMZUjVwayVwGaEFEdPsl/2sUuFdxbW8Fhn3RwtvZGlS266Kvi4NzGKD/6EHzQsPbhAXq0Se3TBx27KlciLHTujY1jzCvniIbAN53bW493roPWpPgZOzUVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/CplFtR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwCZJXS8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/CplFtR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwCZJXS8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNVJ51672696
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BcsPLOCzLy4
	7YN8554whS01OQtGN+SlN/i+fqAed9o4=; b=h/CplFtRFZl/9z9dzZ5wpW027er
	q90NojcQ4GjMlkGTNd5uGqmnfQkDPXt1ipTRoyDOjzbok3sLSj9NCpEKuD0rJIS2
	0BG6uQStz5ReY0JOrtUuG+Q59310SFnxAEBl6bNfsUX0jeN8S0YROB5ycDArE9PN
	YLQJHCPbAcUhD0lANtrygDt9W5NFjX+8UqbE3cWX3IjFmzZpjCJF+D1jojchdGmM
	BkfWqm38XJgIOoUGAfCTjksR4f9P10ysnPboHXFb5uFBV5XmwBzetVgog6Ho9Fe5
	awyfES4UUk4W49Tr2f14AQvoG14NGf5TyXT02JO+l+fYYsrdy7g8aSphupg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqscf0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:21:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so112067185a.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603293; x=1784208093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcsPLOCzLy47YN8554whS01OQtGN+SlN/i+fqAed9o4=;
        b=ZwCZJXS8xMynHAw+DezIZUFsK+6oeE7CTRViqvYuSq+KzuxxeCJFebYAo+HTYRloB2
         Lb8g/ZmQy8jFwOv1E/OXKGHhwXNqfdLcRgTpL3ZpEpJoCQgKiX7GTezWydi7KMbCpLhr
         n/IaJhivJdAPyw0bX0OWjSGFCAQSmNJZxNYkvS0yG+pgQXdXyYSpQjAsq/NpVaNhBZ9K
         EuDBYy1iNFORP+KuFhIV7AYHFdzfY2aOWqkUXv8iaOxBh5msAd8wFr1q26ZgtuAP5IoV
         MLD40m0g3RLuD3AthZGu4FMIRy422SLnHZ0JlWkudIIhHUzFt9ytG0X3eUvh+bHib5mv
         QcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603293; x=1784208093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcsPLOCzLy47YN8554whS01OQtGN+SlN/i+fqAed9o4=;
        b=EYXwtGVj30ZLD+2NQIFG9iE5ZmgGCdl95LQsbeneDPzxDgRkWTTerzpWfQlnMUfHh4
         h3PKgamnX5UtquWGMFMXdB77jUlkTMLh9kAyID2gokwc6Zw83O22rNKKvjrhSVgUncP5
         vKfcuMeMsJMypkxR0OPzUK2hTgxI64o09tOWaSpeTXaVHPmMlORDkWAxswedb2KwRa5X
         vSNq+zqDp1Ny/k1+LBYjX6ySg2qM4iFLH1xpuobAvGI3vtA6G6e5NRXM380TqeHQvK1W
         yr1qMHTb0qPt7Z3V+RTwTp6tnGiCfLj1+kyfqHL72GJdD8CeC6cm0mvsopIeKJrw00Z5
         7vZw==
X-Forwarded-Encrypted: i=1; AHgh+RpPDQGRvCV6w238jD2dkamJKf7csE9aZFgLP+dShc4TFgoI5OcIcyBomC9VrHBuRr1lhh51EMF7Fy6y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjxw30e3At1iVtxtSXCkWcR2Q31w3wfLqE4zddlelhUH1qdGHY
	h7q8A4XrDRN1wNa9BPFgRoUBZw5+T5lkavccAdpDhFviY2UOrqfuYLd8cAIxsVSJqeZborPopsL
	A1WhteMzdrECholxH8wXhPu1AnTSB6svy+cqlCFo2Y6WcmTMgzfrjEGb3qImjMzii
X-Gm-Gg: AfdE7ckX9RC8vmhoGKrSlcM/0WDWKEoDh8itOEbSB6SvYM9htzDj9FS02V0cmq3CJQJ
	Fs0RpksDq1VByNJPUUBoItoni9/nrrguN6E6QDTam3MuqFr8EJd9BBKW9tS7ERELczNsoO+HBTk
	S5cDI5gEV4KY9Ux1lLTnPf1PoiYMw6sgwVNbizVPkcDPbr2LYZ4uv2KlkTyE4FMyzrA08zduLEQ
	1lzvzVj4SRwEnmhBx8OW7MafLH5SiabV9+2tbuaQuS8eWGHS7s2+jkl5CO8ttW0BUuizUc2cYst
	LpNcKElCXYum/DWiKQzXUYGKdGPPvCBwqEVxuudmhaQBjPlk4dBiwoxUKCaEDLjxv/H0DnQ2d40
	Ws/YRWZLfawOueHFlXBvGrUffTk4Yf7y4CA6M0NQNGBKh5VaAzFn30blH3bPaHQM4HYSjs9c=
X-Received: by 2002:a05:620a:4082:b0:92e:6c8a:2a15 with SMTP id af79cd13be357-92ecf528a21mr761546285a.1.1783603293284;
        Thu, 09 Jul 2026 06:21:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4082:b0:92e:6c8a:2a15 with SMTP id af79cd13be357-92ecf528a21mr761540285a.1.1783603292605;
        Thu, 09 Jul 2026 06:21:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:21:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 7/7] arm64: dts: qcom: Add device tree for IQ10 RRD board
Date: Thu,  9 Jul 2026 21:20:13 +0800
Message-ID: <20260709132013.4096850-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX/HT6HQYEDMbW
 FMAXYWdmHNgsWFTFq2Rs6Ners+rPvTex/NjLdt/fGVdufk3m3+OOdlK1nML6oeL1nyQ9ErBUOdb
 /JcHPzIOcWFdfguPk6L6Ezloxniw1ow=
X-Proofpoint-GUID: CpU7E7-DRuK_HFytwiRJjBrHEr0F2204
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfXx4uKTQFOEJWP
 wyee5hMSZAxEIaXrmvEsmWscG4RtvtReQ1EUUGnSp1En7+ElGrHIWFJn0+liJZts/YnlwSwyp4X
 hJy9F0pO88xoV8tbgXLftiUzy04Hhta9OVcgqV2K3NyNpazXZUMBwVaMhq45TfdjsM/5By8AIlq
 oLi56GVTsdj2MjbmyTVbyjgUN86U8kQzpHT0AsfCNJer+202QDYIs31IyKaSzrETmzQYoEg+6JK
 NEurFzC29Vzy7om5d5AXn/RNh5dfYXYu4aJgyx556WNlZkyDJEsfXFVwG5qARQgL4GB6Txz0TSu
 7xXKKCR0sOuSEF4sbqCGmRrIgIX8rojKp0JdFi+2kx11ZLd6OUORAsXv2smveXJjDhVJMBL5JND
 ltYUaGcodRDv82vOua0NtrKczWj8EhXuHzfoC052gno/lHz2KoSA7OrkAkSDghEau3qS7ZX1qIv
 TO38UEPe/gDpVx4t/qg==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa05e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gFB056dJtrE0ykQbG54A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CpU7E7-DRuK_HFytwiRJjBrHEr0F2204
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090130

Add initial device tree for the Qualcomm IQ10 RRD board, which is built
on Nord Embedded variant. Enable the debug UART, UFS storage, PMICs,
I2C and SPI.

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile     |   1 +
 arch/arm64/boot/dts/qcom/iq10-rrd.dts | 588 ++++++++++++++++++++++++++
 2 files changed, 589 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/iq10-rrd.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8e6ef4116146..75d29d602e77 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= iq10-rrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/iq10-rrd.dts b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
new file mode 100644
index 000000000000..39d254b49c14
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "nord-embedded.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IQ10 RRD";
+	compatible = "qcom,iq10-rrd", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	ufs_vdd_hba: regulator-ufs-vdd-hba {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs_vdd_hba";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	ufs_vccq2: regulator-ufs-vccq2 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs_vccq2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+};
+
+&apps_rsc {
+	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "A_E0";
+
+		/* LDO Regulators */
+		vreg_l4a_1p2: ldo4 {
+			regulator-name = "vreg_l4a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p2: ldo7 {
+			regulator-name = "vreg_l7a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_1p8: ldo8 {
+			regulator-name = "vreg_l8a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* SMPS Regulators */
+		vreg_s1a_vdd2h_l: smps1 {
+			regulator-name = "vreg_s1a_vdd2h_l";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s3a_1p8: smps3 {
+			regulator-name = "vreg_s3a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s5a_mv: smps5 {
+			regulator-name = "vreg_s5a_mv";
+			regulator-min-microvolt = <1328000>;
+			regulator-max-microvolt = <1370000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s6a_vddq_l: smps6 {
+			regulator-name = "vreg_s6a_vddq_l";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8a_vdda_ebi: smps8 {
+			regulator-name = "vreg_s8a_vdda_ebi";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	/* PMIC E - Kai_MV - SID 0x4, Bus E0 */
+	regulators-1 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "E_E0";
+
+		/* LDO Regulators */
+		vreg_l1e_0p9: ldo1 {
+			regulator-name = "vreg_l1e_0p9";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e_0p9: ldo2 {
+			regulator-name = "vreg_l2e_0p9";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p8: ldo3 {
+			regulator-name = "vreg_l3e_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* SMPS Regulators */
+		vreg_s1e_nsp3: smps1 {
+			regulator-name = "vreg_s1e_nsp3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7e_mxa: smps7 {
+			regulator-name = "vreg_s7e_mxa";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	/* PMIC F - Kai_MV - SID 0x5, Bus E0 */
+	regulators-2 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		/* LDO Regulators */
+		vreg_l1f_vdd2l: ldo1 {
+			regulator-name = "vreg_l1f_vdd2l";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_vdd1: ldo3 {
+			regulator-name = "vreg_l3f_vdd1";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* SMPS Regulators */
+		vreg_s1f_nsp1: smps1 {
+			regulator-name = "vreg_s1f_nsp1";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7f_lv_sub: smps7 {
+			regulator-name = "vreg_s7f_lv_sub";
+			regulator-min-microvolt = <1036000>;
+			regulator-max-microvolt = <1136000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s8f_vddq_h: smps8 {
+			regulator-name = "vreg_s8f_vddq_h";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC G - Kai_MV - SID 0x6, Bus E0 */
+	regulators-3 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "G_E0";
+
+		/* LDO Regulators */
+		vreg_l2g_0p7: ldo2 {
+			regulator-name = "vreg_l2g_0p7";
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* SMPS Regulators */
+		vreg_s1g_nsp0: smps1 {
+			regulator-name = "vreg_s1g_nsp0";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5g_vdd2h_h: smps5 {
+			regulator-name = "vreg_s5g_vdd2h_h";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1150000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	/* PMIC H - Kai_MV - SID 0x7, Bus E0 */
+	regulators-4 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		/* LDO Regulators */
+		vreg_l1h_0p9: ldo1 {
+			regulator-name = "vreg_l1h_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_1p2: ldo2 {
+			regulator-name = "vreg_l2h_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* SMPS Regulators */
+		vreg_s1h_nsp2: smps1 {
+			regulator-name = "vreg_s1h_nsp2";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5h_mxc: smps5 {
+			regulator-name = "vreg_s5h_mxc";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC I - Kai_MV - SID 0x8, Bus E0 */
+	regulators-5 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		/* LDO Regulators */
+		vreg_l1i_0p9: ldo1 {
+			regulator-name = "vreg_l1i_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_2p5: ldo3 {
+			regulator-name = "vreg_l3i_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* SMPS Regulators */
+		vreg_s2i_gfx0: smps2 {
+			regulator-name = "vreg_s2i_gfx0";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7i_mm: smps7 {
+			regulator-name = "vreg_s7i_mm";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC J - Kai_MV - SID 0x9, Bus E0 */
+	regulators-6 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "J_E0";
+
+		/* SMPS Regulators */
+		vreg_s7j_gfx1: smps7 {
+			regulator-name = "vreg_s7j_gfx1";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC K - Kai_MV - SID 0xA, Bus E0 */
+	regulators-7 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "K_E0";
+
+		/* LDO Regulators */
+		vreg_l1k_vdd2l: ldo1 {
+			regulator-name = "vreg_l1k_vdd2l";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k_0p9: ldo2 {
+			regulator-name = "vreg_l2k_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k_vdd1: ldo3 {
+			regulator-name = "vreg_l3k_vdd1";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC L - Kai_MV - SID 0xB, Bus E0 */
+	regulators-8 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "L_E0";
+
+		/* LDO Regulators */
+		vreg_l3l_1p8: ldo3 {
+			regulator-name = "vreg_l3l_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* SMPS Regulators */
+		vreg_s1l_nsp_mxc: smps1 {
+			regulator-name = "vreg_s1l_nsp_mxc";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2l_cx: smps2 {
+			regulator-name = "vreg_s2l_cx";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c7 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c12 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c18 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	audio_dac: dac@31 {
+		compatible = "ti,pcm1681";
+		reg = <0x31>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
+&i2c19 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&spi16 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l3i_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+	vccq2-supply = <&ufs_vccq2>;
+	vdd-hba-supply = <&ufs_vdd_hba>;
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1i_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+	status = "okay";
+};
-- 
2.43.0

