Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9A3A9D8D
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996886; cv=none; b=qEVAxrBlY3vt1zjlmGtuHPSCG9OQlPaclZbF1AOo/zFuekX+AvRMj6Pq6P1cQA6A0OWNnmroGs+R8jNe1S3lkvMqNzKnoYSt+he6eeUnfkYhjTcFtdUgEn+RjfSGB7132TWHxWm7zg+g48C52ndqCzSLP35n52+2/x/kSnkv0aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996886; c=relaxed/simple;
	bh=GuyYXi4ARuef6XgYQVb2CfaQCuutDzHN4PZLQaXdUgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4EjbBe4usi6oDHDctNXxRmb8UQ7uieJ09mauPJqq9jLYd3cT5j6CkQZNE8K18z8k0Vr6aSzKDMGDtsaiDpz5+Vu35934u0kW/DseItEayfPvI1/peFUIggWKB9zElH2zheNC5ndsu/jUte+m4yJs3oEHq9ZRUJxD2uASLw7oq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e61a34e5so652169f8f.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 02:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996883; x=1788601683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFDWFiuHAiIqLz4eQ4QEpgbBiAo3LhkOv1R/Digehgk=;
        b=gdYGlLCA7nU8OcKmdTB5Gv9zHv/GsWLfJ53HUrcFpAp+XsRgGYvgoIDpvt53ZtylJI
         QAu8Lx1hMXr/s8p5zF8R0LEu1yWll1LiqA9j7ZFlAZU+z6+00t2Y9JYAUmu9uSi9sWdL
         +VIZADm+FXlPvmlZuFK015NszQmEJ8vpF88pJ5d/XM+6wU+3o48blpLz6n/M3YP+i7Xv
         KKOEn1W1Reqn1esLGyQk1j1u/PSvYJwp6WLfi20BZGht9o7LLVnmh6In7RnVTF42AsRO
         AjVZuCYDjp5ODcI3zyl593z/Uox7J2StgpXn9oR6WdB3m7Dw11s1KDU/LaHA7sbfblA7
         lDCw==
X-Forwarded-Encrypted: i=1; AKwUvBwljo8//tLrA0QaHdPgI1SYUsstDMHL9AmP+CZjCmdgR7hiT1tkiU/QMCRxbtT/G+GggiK7gKUAWAfY@vger.kernel.org
X-Gm-Message-State: AFuF++kmQaCEAiLxuujXs0HsJeusD4ti7xUTH7A+PngPOpUpUpM/l29h
	39SyqQYlnFQ7f3YsA0Y2cAs2xsf1ZB4ZT4i+Gz6Y4vm4y3gTmOgEzYBG
X-Gm-Gg: AYBFou3FBm5mVTOwhjcDEUIWHWwJoCqQmEsb3ZTP20gUYpATAweYfLuXKI7QoHCqG30
	CbpTa6vv2Yg2vuthFhgSrHVW0lkrf9Yb02dGJdxkmxTYUe9uNJhjJKCgD36QTvXJDQvSInLdHcB
	gRQ7ssmSGowd0PzTRRVWctOTPhJNksIYCD6a0ZhYb+x8E4vtfQGdNOQNhmi/CAmUH67yiPpAKml
	/yRmV7WN/qdyug6Z4fzwDr/72Iq57l4bVxz7pbZzTBkO0xszyrQCf4x/rUtaewwhaHLnhFC7YJP
	fg4wg8CWlux4n+wTDHLmd0v0I+qsrm4YrolaAXeEMUv5ayvmzFjDeZKDck8DmA2VHQA5jIhcPKK
	xrVa8Aa4wkekzV8sQbsT792gJKjzZ9BHxaW/tWgnexQXeKVuGMnaFPavLs4JYG+3JFzPUUJGOzB
	nwN6RuohDLFD3aTxuisu7ALsMOn60vEjVgDvMEIzwvJhGEYSenO6a0vZjaJe1IhVvHUfqgz3WdI
	emd5Q5DYxQ5gp7PYoGaRXHGG5A=
X-Received: by 2002:a5d:5e8d:0:b0:484:3317:a00 with SMTP id ffacd0b85a97d-48433170b94mr2419990f8f.23.1787996882612;
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
Date: Sat, 29 Aug 2026 10:47:57 +0100
Message-ID: <20260829094758.23248-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board powers its two CPU clusters, the GPU, the NPU, the memory and
the always-on domain from regulators steered by PWM outputs. None of
them were described, so Linux treated those outputs as unused and
switched them off part way through boot. The supplies then drifted away
from the levels the bootloader had set, which showed up as random hangs
and memory corruption.

Describe each supply so it has an owner and is left alone.

The voltage ranges are read off the feedback networks on the board
schematic. VDDNPU is deliberately not the range in Amlogic's own
device tree: this board fits a different feedback resistor, which
puts it about 40mV higher at both ends.

Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
 1 file changed, 109 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c94afaaf8826..77abfd555ec5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -104,6 +104,66 @@ vcc5v0_usb: regulator-vcc-usb {
 		enable-active-high;
 	};
 
+	vdd_ddr: regulator-vddddr {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDDDR";
+		regulator-min-microvolt = <690000>;
+		regulator-max-microvolt = <890000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_gh 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_ee: regulator-vddee {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDEE";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <922000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ab 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_gpu: regulator-vddgpu {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDGPU";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <922000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ef 0 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_npu: regulator-vddnpu {
+		/*
+		 * SY8003ADFC Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDNPU";
+		regulator-min-microvolt = <733000>;
+		regulator-max-microvolt = <933000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ef 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
@@ -122,6 +182,36 @@ vddao_3v3: regulator-vddao-3v3 {
 		regulator-always-on;
 	};
 
+	vddcpu_a: regulator-vddcpu-a {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDCPU_A";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_cd 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddcpu_b: regulator-vddcpu-b {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+		regulator-name = "VDDCPU_B";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+		pwm-supply = <&dc_in>;
+		pwms = <&pwm_ao_ab 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vddio_1v8: regulator-vddio-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_1V8";
@@ -172,9 +262,27 @@ &pwm_ab {
 	pinctrl-names = "default";
 };
 
+&pwm_ao_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_a_pins>, <&pwm_ao_b_pins>;
+	pinctrl-names = "default";
+};
+
 &pwm_ao_cd {
 	status = "okay";
-	pinctrl-0 = <&pwm_ao_c_d_pins>;
+	pinctrl-0 = <&pwm_ao_c_d_pins>, <&pwm_ao_d_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ao_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_e_pins>, <&pwm_ao_f_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ao_gh {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_g_e_pins>;
 	pinctrl-names = "default";
 };
 
-- 
2.55.0

