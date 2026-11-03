Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695241;
	b=STUSSBtn1o1xGWw1iGZc2BU+Nx8uQZJuQYGMYdI5y9S6871EgZExwEMfOmjM8HEP/+es
	 Pvq7s66PEfL1DBfa/OTwuTuP9Jkuo04Iqijhv0WUllv8YUCJ1oGckV8TrUE54BK50mtIA
	 78XL2iji9kB+LhiNEDhGow4YiB/X37/0mol40YnHvwLu6LEYEY+/y+IwxxS95KDmHqKbJ
	 PixiFTHfaKB47GxU8r3GtM2MaYsebGf5fKCMvA5TcpiDXmb7IWBbXDiE2/SLStwY2iQfg
	 X66kpShnb3z6O9AxaTYr3b+Z7TyTgSTeA+lLxriyvLHCHJgXoldwK83B9OgM/nbsZJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
	b=WRFaZFptwHUvSZpda5leQ85KNn9rxAemRgSOWbHzdhsI512P4LWRVTXveZ1EZlawaH9f
	 0vvxVTocSgVgsFAI6Zg5bK+i6liMB1urw24J0m7AMJFhHH6pPWRi6RpPRdR0+RdKOonrk
	 v+dsMvP8Nr1Zk3PYX3mu1zBM8k47mowaIlqi2hPd0oulDOLhgskjR7IY50yeLaygcejyd
	 +7fCOMUdwWR5/mBmTmafCy16oJlGxxuPS8etYbL8s6OaMXPvJUldf1SXKPwyY3crC5nh8
	 xxqj3e/qCqYz8E4R/xVslTO/OtBzo72orXlwfkoFNR7FVtOHxNafvUZj2hozfjKKLJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVBCXhox;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7A606D80D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E7A606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVBCXhox
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-7143451981fso2806286eaf.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695240; x=1794300040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=rVBCXhoxhmxcS16Rq20RgtufsPsPsfPY/X4cIh38MFyg3Ep65ewQXsub1G2U5YcDmy
         ZCf2cwSJyWoRmQtmJZSwBlslK7OPJkX3Up1+7lZeQdfp9XFh7Nu/3Jc/0P7ZQlGA1Mum
         fhlONm9vM5YxgiP0e2aX6ob1VgnC8beVvVfjyibq/72fwBpEbxSzYIQF/Bp3476FaaNL
         ZPkd4y4pAaX7D/QPZCUxpFtsPpoEczYnzQkZYVUAemz2pwzhDH+NFRLovA27zeoMpVnd
         OWNy84whZBEoGPR7Fu99JC+wW0/tWJwTCKjBjxXrnvDqWXUgqiw/v03HbsGT55OV4Yld
         Zbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695240; x=1794300040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=DsykvpBmXjLZ0UijmVOWrdHfNEfGFTqc/Tnk/PVJ2iTVJXLpUkAAXNKEsVspOpfNME
         T6QPN8G4VeqO/wXhPf27iKaZuT3yAcVOtBUEvhgqT9ZDIFRIOG1W+07kAlzV8i5ULBOZ
         sbjrSPZ/pSqvLoBuQJwIsNODxqC2RwDHN15CScK08qbBVNp2E7N5+72USQtCykPC4DN+
         4YuZQTEeB8ABJFSx2RqQ8/2fvhRI40297gzGGWZQhGuw/Vb6SvxMJKzr8fWFG4po95t2
         ebZhXiNoZkDEoj6wViAQ4Oh+E+Jdt1d+oHuPpF0pm8DTSvljMd4cb06kpL2BIYJ4qPWY
         PdtA==
X-Forwarded-Encrypted: i=1; AKwUvBwX+L6of7J0NpldmVywRN/O/FIcFVygmuq/UfuvViinbn8uo3ygJnV+Pj9stJZD0/PRKEffpG1YGK0J@vger.kernel.org
X-Gm-Message-State: APuU4Z9MsyEVu8a5rJus7ZkySdy/YZOJgVP7wbPDXm8m+cBHQ5vWvmKB
	52bYHWYHkLRM+eVUV0Z2cspOhuY2OoKWhIwaU2s626MdGPh4z0gol+Jh
X-Gm-Gg: AYBFou2j3XgGK3oGRM6aGTOTt404yNfAzN/k+l2HaTegHmwnVnnkdpWubPEmWkduOMK
	kV5/FfDgcw8r+TkNQFiXFWVzPrEOIA06F/B7l5gPdgcMoAQLkbGS8rrSL6XYlOWp4JPxqLDqiVZ
	vZlNsel+P/RTo2bj+9EreB64hMqs/AyMjPBVKiePHQKSdWg7d2uJtD2uqRhf1vm7Q0CLHlpDDZd
	CQOIu1/WbYlkMrlnXrqjcC3tutA9j1px/d3QMuCxmRDkLMipxELXfHP3L+fWEd0rSP5BvfEY3FJ
	S4Wdroeg4JljKx/SLnl2egKKgJWH5sBlPdYW0YAVIU6xFCIJ47CQd0h89ce19vEUXaT1+H5ADmL
	DFtZEEy0UpEj3CI9favmwf17U092UZs+uwcgXrglrGg3kO6s1C4A5O6D2JiLP3Uw3ODez4tAouf
	mjZGXwqpteCFOqKY9FXM+zzqp1eHFVMABbjdKmmXhmm16BD/9SSMUsANu15HYm7KKto0uYM/BZd
	+7UglwX3Lza83ef4yMO/HE/mr+h7ybwdxe6mufR/SOZbpTjQ3UrDYzngmQ3qqHX38m0L3NloCas
	x08bry9u1Jdy7cctJ0oLN94GlR56c3u3jJCb671z/bl/CeKQQWIePZh1R45ap234XMWy+Yif9H4
	HmhC+3XzV217ARquaskH18mFZhhrTSwfWRq3xeKCiyESufP6JYFloa4RO/1V0+FeZtAHw+9JJ/l
	7cM0eDrFvf9gJVq4lQlrh2QZitG/HaYm3V4ezCRHp272xr9+u6eKpSp9Cc+So87oN/yaeRdXAA
X-Received: by 2002:a05:6820:221a:b0:702:778c:ec5c with SMTP id 006d021491bc7-714f29d36c6mr6837555eaf.53.1793695240569;
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:29 -0700
Subject: [PATCH v11 4/5] arm64: dts: allwinner: h616: add PWM controller
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
Message-Id: <20261103-h616-pwm-v8-v11-4-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a PWM controller that can provide PWM signals, but also
plain clocks.

Add the PWM controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b6580f0c6e0f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -293,6 +293,17 @@ watchdog: watchdog@30090a0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@300a000 {
+			compatible = "allwinner,sun50i-h616-pwm";
+			reg = <0x0300a000 0x400>;
+			clocks = <&osc24M>, <&ccu CLK_BUS_PWM>;
+			clock-names = "mod", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			#pwm-cells = <3>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h616-pinctrl";
 			reg = <0x0300b000 0x400>;
@@ -397,6 +408,42 @@ nand_rb1_pin: nand-rb1-pin {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
+			/omit-if-no-ref/
+			pwm1_pin: pwm1-pin {
+				pins = "PG19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			pwm2_pin: pwm2-pin {
+				pins = "PH2";
+				function = "pwm2";
+			};
+
+			/omit-if-no-ref/
+			pwm3_pin: pwm3-pin {
+				pins = "PH0";
+				function = "pwm3";
+			};
+
+			/omit-if-no-ref/
+			pwm4_pin: pwm4-pin {
+				pins = "PI14";
+				function = "pwm4";
+			};
+
+			/omit-if-no-ref/
+			pwm5_pin: pwm5-pin {
+				pins = "PA12";
+				function = "pwm5";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";

-- 
2.53.0

