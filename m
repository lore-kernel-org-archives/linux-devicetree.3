Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA331E83B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112714; cv=none; b=DtWuz8v+d4t+SxKzyO6HzhIBGkiQzqiFKJpX5Z7bubsYDWYz8sJwmBtHCg/JdphMXU1AcXPGIUhbGjgDNlvOpnxUta6VDB19Hmnzm+B/hMC0FGUCKhMivmpBhDsx/NJTgdZbRDs8YQMPjDlzK3Wa6FpnB7Rfx6IuGfwW2MLqr/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112714; c=relaxed/simple;
	bh=0aVue5qlHixKUDgsg0/JaFYVf7jDnLSm4fZZkO8n+uE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rJxLZmoUZVYSbDsYcAD0Pf+N5EoNeN1ihDdxY03XPLtuy1YnQbKe3K3MVy8kdd15p+UIVDTJIx+2knr6r6MXvoD8m6KXGUTMA9wAkZQF94hK1x8GI7IsgFv90MrjcS9viboSROKDhm4nGpTDGega6mBdRidff1okLOliNQM4PaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx0xLwq3; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx0xLwq3"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1485102a12.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112712; x=1792717512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=;
        b=Fx0xLwq3m51kkwm0Ymk+ePc3lKedfLbq8CanXOX0qEn9snvHOEYhtCIaikt38puj9m
         Qsjjc8LFm0HsaTJdDoPrYdY236SBr3SKGTGOlbj3G2fnV+KHXAoLGVEniuBts2iBCJUA
         RjIgd5PMSgoF9+F51aAMrQrFlHrhQimkn/XlUwLHf60/yHWjSZKyy5s/1LDq1ipzkh74
         q48OgskfL8xjkzR8k9DTSaeDKefzABOsN+u30jD1ukydn8q88H1Xyn6S3/2tQNBq+PI1
         PdYAAtGjT1ARqJyeJXdg6a5GCa23f2KEMpnepJPyGG+93rwbzJIh+rFYg0s2cpiNGObO
         /H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112712; x=1792717512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=;
        b=NdVUuYetOXDhDK2z75ccel8g4BfdNaJR7hyLPTQZPVofgQ4uNAjqTjBMZVo6k0oMoJ
         ZDS7OHxztPbEDzK0X0/RbdTVaUYUcTPtID9gzuy0lKlhOZg6D8TULt9R+gLUMYJfYERK
         aFTs1+VY/MzxBAzzIQ7QoZPF3/uhkaH8V7zb861VlGNonNv/kjQtTXdOwGiBhE8SQOZZ
         ocaiU0j6opZMQdNpH6/8NznnBYjqvXZC9D7g5A/ViBoW1U9OzaYhAn4ksOQvJcj85l/0
         1k4xbTl4+2ml/P4/OZEkRv6Mg+qoYoid7e/d+cX5pJzk/wKPo/Q3rBVB5Lal1Y4/WLWu
         Y48Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4oAWxHyhrO+lRc5ltaQsTskA+q6adnuuLQWKlae0RL/7ITTIGJANchcPymLMthMYF96lSqPTyd0BG@vger.kernel.org
X-Gm-Message-State: AFq9FYL8cOwBLLNzdM2OsEdUO+6WYXT+oHALkMgI943JEsOCBUyH+H/V
	EH4qWkT2rlGmdlrs9z0qIGuHgvL42650g4st2ZWiV3BZqLWvs6INWM7y
X-Gm-Gg: AYBFou3lUOMtkLAl5Igmsa8LDk+Apjz/C+2QqqzzBO4vJXvaT4Ddk6SvakkoPSyJ/ZD
	/mC8CQJtmYgDTydg5FJ/gFK+XA7RChpi4G3fwIZmjbIRIy6k6CTcJVEh8vtE4mElyBY6jG6Ty54
	Aa7QVEOchWbBSup8a1XxYVOyUvG9iBW4gv83HuFj4Ps54Y1q2aPX+ow9wD9iMG/CeCSj6heUA2g
	6Vd64C5UNatCxZsDKhEWnwhybzJyiM+49nYqPXbGcMxlYE+g+JBgZhGAp3O2jAeGn7B4QxuZZhN
	KbXmQKt2oqNmaLJaQF9W7R4YS1/IhqS+oGv+REGUndabnQjwu+bWHXUs/4Qs045gderIjUDTyou
	PeEbP9AzYXfNlgKNCPano5+tZ5Q6LOdu1S81vkJn35g7XmBxR+xAquVh0N+jTr2jafExRj/PPOr
	qf1PEocdQXjX6y9VEmD9pBXvFieCkrj3mys2EVpwFSU2TtAe96NqUoaHjNXSCLA6Lb6tZ5glaaZ
	xfIacyAk4yW34qdftgtoV2TQy1GF5saNEeg1qkjFih6GRrlBZQnYAWZ
X-Received: by 2002:a05:6a21:7a97:b0:3e1:5816:8743 with SMTP id adf61e73a8af0-3e16bb71247mr17172837637.6.1792112712303;
        Thu, 15 Oct 2026 18:05:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e513sm302821b3a.27.2026.10.15.18.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:05:11 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v12 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Fri, 16 Oct 2026 09:04:48 +0800
Message-Id: <20261016010448.324856-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016010448.324856-1-zychennvt@gmail.com>
References: <20261016010448.324856-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..488567f830a6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -57,6 +57,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: audio-codec@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a>;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -100,6 +112,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..28488889f564 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1

