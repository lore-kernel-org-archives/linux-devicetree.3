Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621971;
	b=rT45n25WD6nXMuKdKP+voPWfnalFg6V2l2eaHJCxLouzJQmK9WwP0+8dG9i2oW6kKVPn
	 GEL/hfhq/hWRlAdhWa8YYkjd1LJZY/tu8HAPMCxaHYqiHyfw45kxGuTyyvdSbSd+f3g1d
	 jQGrc4SOmfuHxScB8h+xXwbuY95i9L5bLY9ETMErq5TvgWn7lMl1F6t9RznO5oBOewdJJ
	 H9CKQDAxIxNXuYde8KO2UGQIHPKpx2Q+R0zWZa5E1dcMfPiOK4p0N3He0Qwufd/HY2E1q
	 jzQCLb8ZBF3dd8oeRPx8QJcC6nRjfAFZ7PKQZjFLINIsc6NR01ENEkzr7MO8DD9bUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+AqJaPo1Vq76xc8sc0TpBwwjASCHawiOJ7TFM/JvB8s=;
	b=F/ofFt/sN+XQ4JTIzLppg7QtX4FnveuftZtJOE661ngCGQSgzyJnezpB01iMadKbvlG8
	 kZtKEr2pir0yTjKvFsYCU1Q6JyoxBHexJijlRrRRcQEEJc04uS5/Hyaxc6ldpU1M6/LR9
	 4PXzQECaqWOCRO+JbOIkWKWScXjvM0F7OFrFABMMWWh2FCaLPMw916W5kpzTYfUlhr1HI
	 kh9Y+2eMNB5Lo3jdr6SLs5pBsetruo9IftA7wMSL7R9qHYR1W2QtWV0yqciS+DwEcQAjO
	 UV6AddiGZgS2ysIBlfquyEUWLFjagVaffRF+gbe41+B42PM+V6mVFIc5jCyLf9/9V9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zD+NnX02;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DA606A889
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73DA606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zD+NnX02
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-85a5455bd3cso1596921a34.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794621969; x=1795226769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AqJaPo1Vq76xc8sc0TpBwwjASCHawiOJ7TFM/JvB8s=;
        b=zD+NnX02te7aW8UF9fEx0T7tmeG7nlBi+TfDNmysPuGZWqYcnr3iKpOrVV+1xGtJ/q
         NG3BKkE1GpmTfk/AhtWx8dMW9D44qU40CF8HImjWiAQxT9E0pNSYzcww7jFnIbGt30Wl
         41mc6w6Ns3RfyiqldzVX1jS357g4Zqn2a3AV1U3+yu8GIBEIjHc3ZgepX2g2weCz4CPi
         63G12lHy0SvexswlLwg0dFniR/NGTew/rGdRcvdmj4uJUXqnwMUHTi09J172+hYSRRg9
         407CUZguwoxG/ob0M8WXgex7tOggTr3hlD2FafFfM//VOOo+702I4yer1cYFlLMA3GqY
         b0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621969; x=1795226769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AqJaPo1Vq76xc8sc0TpBwwjASCHawiOJ7TFM/JvB8s=;
        b=V3gbEKY5WcmoCSt2WjCf60NaIOfpqYDS8lOYUI07vimVC9j7QSdq1f/sRzidBnq97d
         /fTay9cnQGbJc6auqql3f+e4/fMRGayK1utMmExf9bIxAiSeowriTZ6WadyAdnFdo6eV
         B4mKUUZMaO4bhEA7bticxbCkiVyOepHUJ2uqnzvxIkUiV8IsTXkIKpMJO+5qmKst2F+U
         dKeUoHMDS10NJeCnmiQf36tslrZHTy2hYO7ltIdeLuk2b/ZPotqEFg3KCfZkdOyS1vDa
         yJOhXTBLW+yIphSz615E/Kopwe2r4kTK3QzL6uGACMjPGG9SpX+KVrb7bGiekGGvsW5M
         tI2g==
X-Forwarded-Encrypted: i=1; AL+hErFkM5ObA8WD9RH62odYqVjh8x6pH3Wohbo9Z4BJIwgyVtNNhB7xNr9UmhpxQHJ9NeRcJFJ2Iah78RV8@vger.kernel.org
X-Gm-Message-State: APuU4Z/5p78eU4VgkOiHZAdeOqHRGXV98GbYXlRrHIKuQsfV3+CyDsJf
	pbJdnZISN1tO9UCRCBjtHoMoR3KKkzIZDKwNHhLvoi+PjTQE8VA3k0Aw
X-Gm-Gg: AYBFou1EkFzuT0rZBgjDZ5u5GVop9ryl6K6JfZBqSn/jMsHt+VPnLWM0fzL9oKZGqlK
	t9W2W6/mauMX+QumcUAvYzpBJVdFb629rbI2t7qmkwUkNf0JQEbwDludInvQgg4D+TVuUMJoLOi
	DMW/9gGDPgg8UtDUD8b26/BGkEvRtslwsK8ZyQbTebsLhZvzUGJHPsVhJAqO3BN+8iLhsXGnLF8
	+erkxilaciGgHnG6wU8ZILFOBu0Xg5qeUlCGf7EHfMQkWOu2qbgbHSfpkNNoWlx++R+KwYFIbFm
	zx+cQdJJJTTS/QvZHqzLsm1K3/nCX0dHax7ImkOWNnM1apPC8DFzOfW4rKU2GsbIK2suQOLy408
	WHTdLSMe7DQOa7uROF+AN8wH4K36NoILIKsm4xUBmiHT3Y034nGig363CSiIpsTXUFcOZ0fdnSy
	AJ8sgn89IxtpQi6/x0VxYIx4+gzJet0qPEyqYh8uE2B5nwr4o53AMcQ1xPTkVykY0hcpIM5xwDj
	H5bAKQzWUYu3TO5E2M64fqb34IooRbtB2UT42ltkLFbvQoW2K/mWY/tNsBPXc4Tcn58hNoEToVt
	v73YEresHqRwlY7D/h1cYrdmBJMC7uGUasgxBI55a+3g7mUF2CJm9g==
X-Received: by 2002:a05:6808:309d:b0:533:87ee:d131 with SMTP id 5614622812f47-56e64effd43mr4146215b6e.25.1794621969480;
        Fri, 13 Nov 2026 18:06:09 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3f179sm3385433b6e.6.2026.11.13.18.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:06:08 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 13 Nov 2026 20:05:08 -0600
Message-ID: <20261114020509.632311-3-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114020509.632311-1-jeff.roach0@gmail.com>
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.

Supported and tested:
- Keyboard, touchpad and touchscreen over I2C HID
- Lid switch
- NVMe SSD (PCIe 5)
- Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
- Two USB-C ports with orientation switching, USB PD and battery
  reporting through pmic-glink
- USB-A port (usb_2)
- Webcam on the internal USB 2.0 host
- eDP OLED panel with DP AUX backlight
- DisplayPort alt mode on both USB-C ports
- ADSP and CDSP remoteprocs
- Two speakers (WSA8845) and two digital microphones

This device tree was written with the help of an AI coding assistant
(Claude), starting from glymur-hp-elitebook-x-g2q.dts and the laptop's
ACPI tables. I reviewed it and tested every feature listed above on the
laptop.

Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 647 ++++++++++++++++++
 2 files changed, 648 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60..e84836e5c5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -74,6 +74,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= mahua-hp-omnibook-x16.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
diff --git a/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts b/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts
new file mode 100644
index 0000000000..fd0ee66473
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts
@@ -0,0 +1,647 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * Copyright (c) 2026 Jeff Roach <jeff.roach0@gmail.com>
+ */
+/dts-v1/;
+
+#include "mahua.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+/ {
+	model = "HP OmniBook X 16-cp1";
+	compatible = "hp,omnibook-x16-cp1", "qcom,mahua";
+	chassis-type = "laptop";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c4 = &i2c4;
+		i2c8 = &i2c8;
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
+	clocks {
+		xo_board: xo-board {
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
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&lid_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Left rear USB-C port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Left front USB-C port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "HP-OmniBook-X16";
+
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	/* Qualcomm QCC2072 Wi-Fi/Bluetooth module in an M.2 key E slot */
+	wlan-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+		vpcie1v8-supply = <&vreg_l15b0>;
+
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
+			};
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <200>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	status = "okay";
+};
+
+&pcie4 {
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&pcie5 {
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	status = "okay";
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pmk8850_rtc {
+	qcom,no-alarm;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/hp/omnibook-x16/qcadsp8480.mbn",
+			"qcom/glymur/hp/omnibook-x16/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/hp/omnibook-x16/qccdsp8480.mbn",
+			"qcom/glymur/hp/omnibook-x16/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, left speaker */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, right speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
+			       <10 2>, /* OOB UART */
+			       <44 4>, /* Security SPI (TPM) */
+			       <65 1>; /* EC reset */
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	lid_default: lid-default-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+/* USB-A port on the right side */
+&usb_2 {
+	dr_mode = "host";
+
+	/delete-property/ usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_2_qmpphy_out_usb: endpoint@1 {
+				reg = <1>;
+
+				data-lanes = <1 0>;
+			};
+		};
+	};
+};
+
+/* Internal USB 2.0 host for the webcam */
+&usb_hs {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	status = "okay";
+};
-- 
2.55.0

