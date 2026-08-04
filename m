Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B20440A3D
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878863; cv=none; b=eUugZ46CdCOakZhRTt4r+Cc7/+mYTpZey77z4/zm7NIFo7Zr45ID8vJRz9Dhdu8CR8KR8evmstMwMX+apfYLlx2m8pajitg1fK6gakKmm9AWGS9SEwQhHqr9kpK0NoCzvOZHp+gwwb+D8UzqaIlFt2gEn+HB6kRMCHAcBcs0bIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878863; c=relaxed/simple;
	bh=cxjDKZ0MA9VUms6JcpknLJlKdT7ZoJ5aaylgo7tCtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HE8OQJPulVNT76vkbfG3Xt9d2tESHhJkkQ+hX1MhPzOwTpvmpdTOkh53V52YaVwC4yG1iO6TDGFxrID2n2LAz2D9FanzkTKsXyBXdMcCI8IbjeJ4Da3bXiInz+OGWX3ZoedmEY7X5LCOOSP7hsZeFWgXF9a0XZT1bRamy8sUGfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sm/IF/JY; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sm/IF/JY"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a4c6081f9fso121282b6e.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878861; x=1786483661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=sm/IF/JYVXJICXHtjQREnjIRxnzY2X0IFDSWmrRuK3h0uE40KoPKytp4Z1FvJHIzER
         MfYDVl+l/sHy/om6mCDg0EFEQ+Wz/czBoq2LgNdhE6c4HKn8SDbX8Kl/UNEe4wjw4+yT
         u5brBKitFiu+5yTW4hgl20kFCwLExg/jvgFz+vOw43SZobznKx8gmSU4JOzbrVLF6k33
         9YT713jOihYsVetiBtlp8FrT4JwWf3CYANjCtx4B3pQTd7a5zvEukNz4fQxSFwLkabs4
         9HmX6R81JHdaWwD2nlM6HO/FKNgeLdpacU+pOSw6eh6QLpa2tP/D5NnRAG1Lf5meeAf9
         8/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878861; x=1786483661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHj476tA2byKc8arhZaw8Ci81fHtdMiGqz0hVZIDFng=;
        b=JlOvZyqZjUVwV6apnSbhAW0Yb/TT78ZFjlKQVXQ/fwxzNHn0urMKblgRqtb0TGmI07
         FuNBbldF+rwDWL9+26w24D2cr8Y50M9beUjUBd5/f5XM3Md4xDvraOcsCi/NCcA1pF7i
         JiXD3tilxVFrItl2K6nkMfXBGBdpCHyGLH7qbNKIhyW/fSvmZWpTHNZNAtuiC8z7K5yb
         1xO72FT9KEYF6eh+64Vib1oUT2FNpixLro0wGez9oxksVslhAcabP5z5JJxzm9npoFiu
         uoKfHNYGsUd/ZIumGRXvXm+DdSNec2YxTF2ubWE/7HmIhMabjGFfPxa9pmY7w96CgcGJ
         MfZA==
X-Forwarded-Encrypted: i=1; AHgh+RpbWuAbAmrObZs7MEJxOnitJQpUePL6H2K7+LTss3Dm5if5Jw972URrI2JwZavRW95PXcA8kKmLo2L5@vger.kernel.org
X-Gm-Message-State: AOJu0YzErgtpwcx5+yDUVR7UAJjxqlLZiaQ4CpK5TKDaUdaiesGqzb9r
	blBzhiIuL80KESEF+JzROccnw1fp15V4PlMR+1PXQVPr1wu1W3kSH0pq
X-Gm-Gg: AR+sD12oNN73zT4W4FboEXnMwLyFAdxu9joQYQXuwim/1f/hCf/hGr8caXnjKzNEejP
	AT5kk5UNpeZEfuyK5hMhbj7UdGcWg1GGf4bB3sAGLPK5af1ZVZRE5+hbRUDVQRdwBGdLvxhNdIX
	WfMWjiNMCE5wchsyV1LA0u92NtXi81Bhc8Hs8+ad0F+SPW9UwKYFlCQMOdeKXKKIGPfmyymY7q/
	ITYu78NMXUE3b0SUWnFZKSQnKgVVst/AaA8JDHEiSlgXfvcU2gFnWk9wt0m35HVWUnzr+CKw84Y
	YHQb2XQE5KBVi7dA4/C6Gq7ioflLawzt0FADDDKkuPZp/UqBwJc0KxBssPUcZxQfcjp+vKOMtHs
	CWG9CUT/lBdagPMSsHXKlOJTUGrcX6DdQBrwoPWy7CSd5cJKgomZgfexq8IJ2clbDRc0Uf2PF0I
	zzW55QsQz47JY/tE/UVsZr4iTNddP9bNrMU46BtGivDktryL7HE3V14hMagW3pxI8E+ERnqtD45
	xkcYy/SzCfe9qaY28bbOZZB+GyTvUrBxSuyqUeimO6JG//IaVe3aBmiplgFcQ5E3cd8JPkCaiDw
	CE9L88ctp5DtJV1L7XX/6V9G3J8Q5TvoaUwC3PBchgEgqRlQzqaWmMnvVG0lOIRVBnOdUWZCtBc
	HLBPw1fItWO9BuIV9
X-Received: by 2002:a05:6808:1646:b0:496:559d:5474 with SMTP id 5614622812f47-4afadfb0140mr961793b6e.8.1785878860975;
        Tue, 04 Aug 2026 14:27:40 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:26 -0600
Subject: [PATCH v8 3/4] arm64: dts: allwinner: h616: add PWM controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-3-db37ab8624ae@gmail.com>
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
In-Reply-To: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
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
index 1598e86259ab..90fe56a1d3cd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -281,6 +281,17 @@ watchdog: watchdog@30090a0 {
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
@@ -385,6 +396,42 @@ nand_rb1_pin: nand-rb1-pin {
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

