Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB31A3E2ADF
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140413; cv=none; b=Rc4xTBCzgHkCDBvbzjqgCqw5Z/j8XWjzSl1xtmR5yLCKVBwrTJ0erfous5fN5kQkBA26ZgxJbcrLalaaZAhhjylnbIZt/B2dJuwPfoRcB9Odh7Mu4RDj1A3JZPhB31zYIiypajS8ieha960RRNQvWWX9zQOW+LOqY1FSUHGX46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140413; c=relaxed/simple;
	bh=0aK3nrisfIvMUC7hMzoMx1aGyZsFxW2jrw74ipuIpwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=crpVsVFc/omPXPqPQfiC53GjNA5PNg56rnM2TzFspGvC3CpesJfWXN6AcNHQzogpW/cERdGqZ9CHAa65AnjeNJQHQluQzhofitWzV+C940hkFvZYmwtnPqPESZdDSMS/MmdsVbhWTTBymrLEN1pqUccBH68ABCA0MhPQ3+0iOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roSANpQN; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roSANpQN"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1782671a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140411; x=1785745211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=roSANpQNg3quVzBKKHEK6+TiDsqmMju30Qg2Ce4vLeCBfbM03TPYE6CoILpSuSEckk
         eD8XU6OA6Ag+7ShUYdGH9GNFd/2RGE3Vyxdj06CjzTjqWmBWLPaHvHkkoADLk5AYwQSX
         Lfb0YpiGktrnaUlGiEyoG8+bXwQjoFyeNIM9ksW6rYESzW2jykBM4ZYOUjzo0NKCxpu0
         EG4KQ88ggdW+icKs3LUqlNhIDXYkAaZbd/fO9Txn5sGA2BcTL0n/zeOOvIIr6HC5uIOW
         3dCdDXZuHDE3ymbm4JZbTgBv23cLpdLqkhU6UoirPSD54wc8ZSQfUxUeconsm5/4t6yG
         ZBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140411; x=1785745211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=iVl1zBSeBnRUVmNykUINwA/vDW/J0lA5iAwR27XI4XyUZAjSTv06nkiOzshhtBXFe9
         +TtDn2Yz8TPMSih2MaWGEJWGmV8TfItFC6T9n4LW188cXTDff/HIvLsErV6fnG4ujV8n
         N/FJZNkN3tlEtB3tASE+S1BWoXNlZTeCkv9zv/wH/QfDAb/aobKzlARr0MmOsY3YQFpC
         janb3aMAn1+zDOTZFA8CPX6sUlKBesa2zuemXgk/6RIhtbK5hAOfh/MZ8DGItj/NjLWp
         5gCnnv9p+CO+1Wg/nYyZlTUy4ZBnnQUePnnnyfEsmQZZQlm4IDOHOjduWLwASX6T5AMC
         kNww==
X-Forwarded-Encrypted: i=1; AHgh+RrsU4E14NrkHElKAg0DZptbE1ahn024WiyjWzcQj1vnwiKGrJhyisx0rDr33IweKO2nqWxRp4pKfdGz@vger.kernel.org
X-Gm-Message-State: AOJu0YyYLnmi/tspIIBRecyWn53XC9raVM6CnLbihQTcxk4H6eW7vwOA
	3YD6NheNWmGEOHlH3zvdfYjIWk5avQJZ5Ot45JVt85uazb7ykyEabP6s
X-Gm-Gg: AR+sD12t2qwBIecjw1ek+qpSRvwjY/a2Q3Pq/dkv4SQzPpUh2vmsf9y0a+O9z+WeTvY
	QT9Jq/aP9MKYB3QjxWukMqnlDZEBW6lhS+HQgsZDZWtkLg7h4VAdmT9TvwrCRGffMoJ1c+5f5qk
	2p3pvE1pKzJkMq+LIBpiSbeaWpve+Z5vB2PlYwLA2Hr4OsjJ6v+YO17cKsfu0zNT1A+tj8haaai
	uQxZqxZn1bYTU1pJ9nC3rMBMHuSrPnO6CYWskTZcjKZOY2An1F5XH6poSv/3uESrJvqQ1QU6sLe
	qUkRu6MI4cHSbonwsqH8jn1YAwpcTXeSgAqqr8N/EyxAZo6YpY6edGH13Alp8X1oZLYknli9kim
	LN3iqHtb0ujURrObeCt+p8CqOQQO7K3oR27GeMs6JhLRXl6bFxPwvR5HPDoqAKJJulOIi+IuhHz
	7bnsxyaDUlBOAqszJDMf+TKk7ZcPPvFYOn9dtpRm0/cU8ERqsC5QsurelRU1FLUEzwRtrHFNI=
X-Received: by 2002:a17:90b:3806:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38f29523451mr7212928a91.16.1785140411114;
        Mon, 27 Jul 2026 01:20:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292aed12sm2629156a91.4.2026.07.27.01.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:20:10 -0700 (PDT)
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
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v7 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Mon, 27 Jul 2026 16:18:59 +0800
Message-Id: <20260727081859.1737223-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727081859.1737223-1-zychennvt@gmail.com>
References: <20260727081859.1737223-1-zychennvt@gmail.com>
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
index a029b660e8dc..422468dbc3bf 100644
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

