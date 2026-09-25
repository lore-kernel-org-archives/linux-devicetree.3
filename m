Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CDB36F91D
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345016; cv=none; b=N/tosIRuGdcg8aO+iL4o9mqMFAxw70uiYvaJ3EgyjWlPmJGmeWr7Iu+JOx0pqcg0NS5eDmpEo7gse8Y+QPYomqoJ8sYIE8on/16y4FNAdZwaOeAqyZI2/RkS6cVZWatZenop92hFZucQZuAfRhZ7vKES7RCyZ8HBkK5xTJXGIIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345016; c=relaxed/simple;
	bh=queYg8jebZDKALpESmOgSvm/jf1BqtlHzBVG+6l5D0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TD1fleAbJ1T+lyh6j20Lcw40jQBQzFZ1QDThkd+bNBHsAc8QnQy5qSNYK3g4pQEEiCMeA1Z4Z2nwi+A7SltBDQRjsqBUPPEn+Y+0OOkLpiupm0p+e7y6QlEK2jswkpofdJLd3rydKj8RRtcrW/DwjSPGa5w56dCO0l6pjkMZf28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPX3pg2/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPX3pg2/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso10058795e9.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345010; x=1790949810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAojoNrF6hH81cwZKMxZWdwXN7p0kfLj5eW0o8KlERM=;
        b=DPX3pg2/coJbG/+wSERsq99ULTHwh9ImJYtM7DAGFCm9WGsZCavOBveJSVpHmg/88W
         GRLy6eADMlvYT74xSlADCMlexTQHSnOcmUOf4vxC/UpQhyyH4JEtphDotBR/wc3n+sNH
         SzdnBppHLuyIn6+Jtufw0Uz/9FqdoZturctzU1cy/yUIk734osuHgXC6HjfC4SFpQnyM
         yr+kXVODZBY6KrHG7on6XXDJuW6ZndSHYoC7JOc3nlrkSLHnNYk6Xz8ev3sULJlqeNvm
         vX2o+dSdI0y+CgTIwiCi45dSknYl3nU5qPwWnYRHgQ/chqgp1VZWVHsh8lE7z/uj5niQ
         Kg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345010; x=1790949810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAojoNrF6hH81cwZKMxZWdwXN7p0kfLj5eW0o8KlERM=;
        b=UDANp8QKQaQajbLiqEtLiYDGhSxKqhBVcG37mx/G1spGJACSGEPGoU9QdTY2vcMoXZ
         UYPl1lr2TzByovUExv4+R+B4aM17AsIhg8YxaZFO0mFg9Oc+0L+k7F+g53P4E+B7iYQ9
         whAIpzzKFXuK63+DNtbmClDijg7R3dtUwl6gmNUWW3fLOg+bA+t3eSst9y6BIV8JsovA
         ozho2eoNRAhoM7LeQcEcjh/DvOI7JS+uWfHCwkm7RFRt0BP1JIYPkct+8l6rT8dzZNn4
         rFUWzcdhrUvTJvsyO0RFSA0seb+cry+h4+r0Xewpj91UM9HOYM4dzKLLaFebOPcmSV99
         11ew==
X-Forwarded-Encrypted: i=1; AKwUvBx78SmNwEmr94v26JVCBSuUvJ7P2tvFWTtD3bPiHKgSnD5KZ9gK+GZ0/GZRGfaO0C1si71g/ODTs0Cq@vger.kernel.org
X-Gm-Message-State: AFuF++nelmb9OCf0chbjEl7A+P8jHf/4vrDcLRpDrIcjdAwylyuVowKJ
	1FbADNtG0e8iG0SBY+gFsYrJheqC5djhgPJsS/WyyPYw4d6qom0bmDeH
X-Gm-Gg: AYBFou3EPQD1Uyf4V5Kvl4BOwHq6ReVKy1PL9r++kTVyP+NmvWbQo/QhLMspD8z723m
	dSIsk3YNB3sQUCJp6t6s/hdR1gfhrxoCiWO75GP9b3CTBfAJIz7GU8eJStdFTb+iz3anqSJuSMG
	oxfWrI/9eztFwQiChVXP/0ntlMyRJNR7QWBrd5NKsSvYixzTEZkf2GgbaM/1mrY2sLjGL96D20N
	Q7hK+KW+4zfvaisPM+VggjYTkrQuVFnHBT3zvvSeC0hSRC5s7DU1WxUVxgtWAQSbqeuluxiImmz
	0kBac1cTQmcSBUyMU61JSH5mwBUpwgGxviOJLuCu0sD7aT+omY4cBMSPTf4hS07RVc/P0nnhufE
	gwrKRV4OOWdF/aWw2uUiWJTkjq8++m3E5itqEUetYTtZP53DbI87n4uLQeT20VOEmSgVOYqg4qw
	8PoGe02J4lzPUZvKBXOXVVQcgXqmYP7habbyG/Tw//kg6o37oFMJQ606Er3BSdQV3tRtTta/zst
	nVCqVGJ82J1HyH4IBTbei/H6tDeYqR+qPMr0b7pclglkvE93geQrBkKYNfLfc5kD0CkK0tJdpZk
	R45la8uED1E0aSb3Ow0oNw==
X-Received: by 2002:a05:600c:4f4d:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49fe7b52e51mr115515325e9.6.1790345009914;
        Fri, 25 Sep 2026 07:03:29 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7522431f8f.19.2026.09.25.07.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:29 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v1 04/11] ARM: dts: imx6ul: Add Variscite audio codec files
Date: Fri, 25 Sep 2026 16:02:21 +0200
Message-ID: <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add separate DTSI files for the WM8904 and WM8731 audio options on
VAR-SOM-6UL and DART-6UL modules.

Put each codec node, the SAI2 setup and its pinctrl in the selected
audio DTSI. This makes the WM8904 option explicit instead of placing
it in the shared module base.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../imx/imx6ul-imx6ull-var-dart-wm8731.dtsi   | 71 +++++++++++++++
 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 88 +++++++++++++++++++
 .../imx/imx6ul-imx6ull-var-som-wm8731.dtsi    | 71 +++++++++++++++
 .../imx/imx6ul-imx6ull-var-som-wm8904.dtsi    | 85 ++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8904.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8731.dtsi
new file mode 100644
index 000000000000..7d74fc3b7014
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8731.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		HPVDD-supply = <&reg_3p3v>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_sai2: sai2-grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
new file mode 100644
index 000000000000..1e1ff8c6d7b5
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8904audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN1L", "Line In Jack",
+			"IN1R", "Line In Jack",
+			"IN2L", "Microphone Jack",
+			"IN2R", "Microphone Jack",
+			"Microphone Jack", "MICBIAS";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		CPVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		MICVDD-supply = <&reg_3p3v>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <11565177>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_sai2: sai2-grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8731.dtsi
new file mode 100644
index 000000000000..7d74fc3b7014
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8731.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		HPVDD-supply = <&reg_3p3v>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_sai2: sai2-grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8904.dtsi
new file mode 100644
index 000000000000..72a73011af6f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8904.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8904audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN1L", "Line In Jack",
+			"IN1R", "Line In Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		CPVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		MICVDD-supply = <&reg_3p3v>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <11565177>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_sai2: sai2-grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
-- 
2.47.3

