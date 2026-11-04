Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820310;
	b=rXK12f9+CY6DAHg5//tU6ZEcJMouQFS84gJhjTM9acnhDtedQ5hxWLjoU2rISY6vJ7kk
	 zlgp1iYLzlwz90hpVizbZdfnQLQYk/ZsBdzBQGFO4iQGaux5SBKlxxCLCicBjaza2FpUl
	 9/kIQ0OwXGoPoAA1chCM8PyaDTckuTRsTCLUV6lP0biT/gY+PO6qkI46I/5IviQnjq7hD
	 2NDrq5a23d0g+wIP/cj90KyB4EsX6+BY+bwkDNEiyj6iSX9T8rCFezMmcJlk3PVajeuaf
	 Au8o09RRcP0fEbdxMhpmwYWqWXZ26wllZnJtbU6OS9DBA7/ELKCSzE7b0gnW9d7UJJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
	b=JU0+bd3ru0vJMBYIJ4DyoIgX+UDOBty3F+zGbHPmPS9/DFyfGOyB0W1VIhV1oH6KgH3o
	 7CsilKHKzmXTBgtcvjN60Bm5rmpS2wpRoBDfaNeFgSLe2W3loGiQUfVjdrGBfq0Ee4Mlu
	 5UK7a5q168mSpErKXDub15HuYcnhNitGop8X0nGGbp/ZM6l0IIR7AcytlHQyix86Vuli5
	 GsCkCdeqTNkU95qtBxZ/2AhMe0512iRN+glOq0IJhhRhg/JxOWyNV843t2EHhGQd0D2EL
	 ow9+oZgtQ0H8u9zT47tbtCfObo+yy0bmfTFNBPpENH1+Tl2ZlYY8bp/jb95/vHcGb6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlkBuxiW;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1A26070F2C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1A26070F2C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlkBuxiW
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-84a248254f4so621270a34.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820309; x=1794425109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=xlkBuxiWK9mHFZ6iN9g5y0fn16X1yn8UtEixLRdZoFQcpS9PdMwLdnlMrc4WbhdhAk
         4SF8uJyzjT/KxvKs9sPQi70xklj1OFYTi9nUPICSitilZ+yxHJ50ss9xnE+zczj3FAJi
         J68fk/5fDuCYRUhQGTYbx+rrKWWtyHiczRhwTTbuCPgH2qnG1rmrjDb04FqMblkYZ1mc
         vicUzM5h3sq06bE8GkOhNKzef9nYi1s+jJTe/76FuZLPTctqdFP+KswhdQJuyBiyYjip
         KaREhMZd0iFR64nR/VgRuNUYXFNoQ3HqY3iAcnB3p5yGnyge/AdHM7M/JCQBb8e8vQ01
         QTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820309; x=1794425109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGQwnQ2neaJQ1jlowOf5tkGQBWxndnEwh30xNQGSIkQ=;
        b=OhlmdySbXqEyqHTLqEbO2IfyeE0ozKFylaj1ce058/2Vu9QMlYEp6wQ2367FpTDLHA
         6PBHgJluxVfw8PeGaccTrkFesij+6r0dnEvOsKz2D3zSnt8+U+s2A2mSOjBgzq8wQHyw
         Tu5491s+v7hh52ttowFamxJd4ZdVDLnkz/FXRtC0fq0hGpHkCP5jaRGhp7qB/OFKO/CY
         hFVRhmAWP8/uMk3bI9rk2xkE+SGZf1wUHPyApjHb6Asaq/YHe4DJ3RQA/VCjBAvl4mOe
         MQVU75o0VtPluW5cbns8kcsnEjwZwQrY8GS7yxdvFpXdGPUlLJ5kz3U+05dC5IdU5o+a
         PF8w==
X-Forwarded-Encrypted: i=1; AKwUvBzdlDOfPGJCOZETP4oACYcCed66PS/Eeb3bxRvXpUIn7sHcAQmpflX02jOLOH6keBWvaH2BtOYsCMJp@vger.kernel.org
X-Gm-Message-State: APuU4Z8gbpU/bC2ukK3f0mt/DhaRv0fl3fZni3d4BaAyfQwEb7YwSYzN
	R0WOu0ergEfb8NfiTeB8TWuIN1HsyH9RqD76yMpkyBVEKcxc/VVdeIwe
X-Gm-Gg: AYBFou0I546opKPc0qOwnMiTzB1YYqIxpZC+iRkSEUpslEa3D/kFVTnls7TOFgjnBkF
	To+9bXUl5SDgwLtHBrkRpBig+Tmvvf6AtTNpCMMJ39PQEPZ+Es5bvAaohBjR9kyB+m73ghh1dzr
	sfF2V7ZBOTQTRtvaWgYo+GtsRs0WQpm72j83VChZzjaQ+qAoE4kIgMrCIcPbw8GZU3Xxfnt53kg
	pcIG3WcGdVjnsLPSJh/6EG+Pyc19RqqzGEiBax/BBMGipl7iv8r14usSkw4fF/xVMA93kMs+Yy3
	rp0ftgWn4dyCh+Z1bKe88R8ElYc2XAAi9vQzXG02Kleiu/V+2eyz1i8DKckV99v54qZvfWhFMP8
	Cwr8P4j4AbNl3TWD6VHajoKmrURTOzsrpdA+N9YrLKqpYtHlM/pMJbv8lXCpWguFO0GVxNwbYoJ
	xPjnIwPRm1X62XauZhXewJ1t350k6Pi0pScTDdZv0/C6b8LfpQfXNx+gCJqFyMoN94eoKoyYF7T
	mkBfWyzANQpfXYsH2Yp8VQV9kU/bEBtwZRGBxZDFf9ZPD85B0vBEdZ8I3ggfWI07qpk2C3lCwCp
	zdJ46A+p5YIw43ogTby2qQxNy+5CBu48NFlxY7xJkxdey3YzfY9TNTwwMsRUaMoAKPkfY1ZOX1n
	WdHVXecIg0WdgOq9GgnJxCv1d0bUAlQXtaVRJGnpuzusLCFHNlFrwp1KZieoSM19DDT2l6WApCE
	0HuLlXPr8APoTW/9ZattMlNpUb8iyqPQc4C4y2a3K3/n5x8Nb/vb/M
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr12233182b6e.14.1793820309111;
        Wed, 04 Nov 2026 11:25:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:54 -0700
Subject: [PATCH v12 4/5] arm64: dts: allwinner: h616: add PWM controller
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
Message-Id: <20261104-h616-pwm-v8-v12-4-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
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

