Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ECA368D68
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782782497; cv=none; b=STdnp/DjOIBb7xMOKUDmMfmwHrOe020/ZTzbuIF/lPAEmj2/NXdK1clucd/5hqIHnCISkPudtdsMh3to8N4xAHHn9ocygK+pk90TMI6A93r/lA06wEvexvbWYLlKTvJFqOAZm3zlvTrVNleSSTNO0tUo1eL4hwzyJQcIvaFul7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782782497; c=relaxed/simple;
	bh=zGn7310A3+W7wbORcg/BF7i/RaT5ZsNMg7+gLfl7YPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HRUmyoDyF6tR61c8XkkiOkdX2KYdG0No9blTc9MO38LOcekWL7wzIuCunbnlLcciE8Ded4LX+DDmSlY22Lx2yTgxksZK2F1kjC+xvU+ixEzswErYHBPnpsaBIV55rlLNuPDrOZzCYAb5VTUo882eEasxY0YxmT7Kmophh754k+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIg6aLTd; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIg6aLTd"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-845c92bc464so2346264b3a.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782486; x=1783387286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okOmr0t7RA98sStpJAac9VxUn6tLvqxzMwMqZfIuluc=;
        b=lIg6aLTdHSwF4USM4wShLAN8iQ3XcbqpPa6eu4B/ZjzsBqkDDGDHhlAI9e63BGjQlr
         3qvmZlWFvgfD5OFVXHnFXDiyu3PR9uLTjKsKVX5gPxKMwWpzwrqVCx7Ggn1qMeCgbynK
         zW8XcapvncMeDsjWgPMZWxCia+Xry1NIbdWpPOVEh3Rl91R3t41wRJkHde/+3RRyqWec
         dHm8y1UPuNAGA2QHWjw0Pb4KqBnIuvYPfEKApGlNs64Y6aLgN2Ylj+dckBiguBe+oGQb
         WKA8JMIuS9K6yFe2zv/cr8Ng30oN9vascsjXFpYVESDDd/47jBRpg+iPpUoVLXW8BQuk
         bJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782486; x=1783387286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okOmr0t7RA98sStpJAac9VxUn6tLvqxzMwMqZfIuluc=;
        b=R6spNd40wlYzOvAnPpEQk0I57Lf85p1DTNub45QoMagVhTlMvowZVYAwcYQvqL5LXn
         je5U1HPIuX/xtgmssmzhluwYa5oO1eilwKThOIZ9MOCwAb+LUwsTC2BkTP9ZyIrFCZzQ
         JmFIChZyMhZ1rcwVRpJpnRMF4jBSVEX8SbUk9cQyFlv6VXvQnWS4zmbVdeZ5hKTJRt6w
         FJWqZMDWgfxjjp/grsc9vtaFXd0l1I1DnC5TXxtKNn8Nr9ggU2n4bWqYVkUeavXiOaPX
         jMFQsnZPB5UhCUfiLhp43P22P7YqB5Dihl/xiOGX/fel36AP3CNR+n8xgJ+J00pS+DNd
         CrcA==
X-Forwarded-Encrypted: i=1; AHgh+RpT2RJu6GbPiRAOYrm1RT/PbtRPDjsY1IUY1mZtunmxAyuRatryREU+T2wv06eR27MZAJC0j7T1fDWa@vger.kernel.org
X-Gm-Message-State: AOJu0YwpjKtLco9S9qweIVnqmqddjcodEZ2+VXgDyev7aipT+3dAzQMf
	gbXkz1Nnm+orkzh2oAX/4W8siLkd/v9Y+c8msVb0W+8vXn4zY55VaZ3m
X-Gm-Gg: AfdE7ckaPTHhHsbTePN5MVpLNqahPpBO3M/M0zPUui+9GWUuO8dqt5PoRToCoIanWDB
	nlYHcjfkFswiwLDw9ZAcTR6f2p2mbHYXEnYEPl/aovebSc4CrkChcGJ+DqqBeDAWFtT4/6zPbsc
	UcSWv24JsyH2l8/ouKy7extbbngmP9/NEcappc+HhmTuTxqP9xCezNKIej+XXlpdRPVxtMnni5Z
	IChheV1F4M6isxbS19fKt/GI7ZTD5OBaURtVGKnP2+uARy0ocHdKwxTx7uet8A/7hBULoWGfa7H
	cTZiNVQDCOuXaPkAotty3S8xvGKxcir2gofsaNb+S8VFrR1A96/1m9SXcet1Opte38wN0tqtpQ+
	doUpIW0FkRM7hjxOy2T1r1SuHcJ+FsFeFo9oYo0nvs4pOK9uwRN2zN71uAqD45ylMwaL7jsLwIs
	LhuADNdpVq6gDwqQ1rvLuLz7YsvFWSz1xnrVH6wCFRqDio/bHl1Z+yLJsEQ5WH2AxLT3Ep5G0=
X-Received: by 2002:a05:6a00:21cf:b0:847:9351:16d1 with SMTP id d2e1a72fcca58-8479f22aa06mr1116256b3a.30.1782782485795;
        Mon, 29 Jun 2026 18:21:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm654503b3a.49.2026.06.29.18.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:21:25 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Tue, 30 Jun 2026 09:21:06 +0800
Message-Id: <20260630012106.3616821-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630012106.3616821-1-zychennvt@gmail.com>
References: <20260630012106.3616821-1-zychennvt@gmail.com>
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
index a029b660e8dc..1ffe41c03f3d 100644
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
+	nau8822: nau8822@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a> ;
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

