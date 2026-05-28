Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD62F32470F
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954382; cv=none; b=ZhDjY0oF4crtE1i2PlBP92kHhNOXFT0AKpM5zurj44hQfPVmemQ1/HzDYKp0dpx03c3JZNtPy8pBu3WgDbNnhJu4J4HaErrLnvmTGJISXB0SAeKP8w0aoSap4S1OsSsD2/Jyk377p5Vh2bGwtlvDm3UcJPXUcuR/jSBIHx9oxvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954382; c=relaxed/simple;
	bh=Kboas5xNLKk0qBHKN+fxDMxfgo86/AwSgt9iVJrmwBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWxw0Pe8G1sgGrsbxql1u/JBGCggrKqVT8z+WXFFJ/ol9fa5YHnBK4JzwL1iwTFWoyC3mmjdj0bfQ7NE273SbNu76YIqh8fcYfH0BtzwVC5GlP3mL2sYuQSQ1vqx2n0E3EFUtA8PWxcOcddg5EiqHsE7eGDzjSttNeOKVhFTML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSXLIO/a; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSXLIO/a"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so48536955e9.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954379; x=1780559179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IK8cXubIek9iNkpA8iJuTiBed2eiFBkLb37ZvD2iJM=;
        b=GSXLIO/aUQhcz5F+aI+AO8ad/PsVHaqsnBFygE9zGedAJD7iaILnLGQjHXBSmvqNaD
         Ld77ZQ0Zp/oaLj65OCkyClnEOSQdFT93ZaQf7NQ9xZkWtivrx+M9lv8luDr2vtlTz+Hq
         bDCWKpsoZf9bhJnIDEIUbYHCatjAYQY85T+nn7WupZsi+UUjnFjjs2eueErq8xDjgJ4h
         7UIcomQADMQydmYyCzp3zZ4K6WvEGL1N/nyhMP84meWgDjNMgH8gJvYpQf0K1uc4UgLU
         5KXYdLtGVctOmFpCFWfb4oa7lh2qIZbsfDD0rhYgHXjsO8wbtCgeAr9SUI2k/XwSpsb7
         UH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954379; x=1780559179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9IK8cXubIek9iNkpA8iJuTiBed2eiFBkLb37ZvD2iJM=;
        b=Bh2Hb1A+Oyhy7VEJNYoh/SE43CmWMq7x/NQo7Qk2qnyhtiicMUkTXKfk/7M+mA8ng5
         G1xyToP0keXpeU/NeuNES22SwnkOWjkr/gxpWeCboaiMsLUL3XKNmQThH8TXxIG3Jenx
         s2vfW3UWZ6B31cSA7PRlqDEMTRYQL6emwxbhdJE2fmPxIFYgSL5r5kbsVhVIswDILmGy
         Key7CHQjCf9doIXhZAvvKqQM7j/YO1BSccuwtCIOVmMCHzqYdNvWmXXBCYFfZp8uBTVh
         My+TnetYcSkPY1KaV9VbI+3kibuH53aYTvhX0Vx338XqiHVix11kgxuHbKyNw1o7dzbG
         aDuQ==
X-Forwarded-Encrypted: i=1; AFNElJ86M3g3MVdf6QjuaKpN8QbdneQqzClQbATqARlXn339968fcqcefZJ3wbZFj70yF22+vu6CGcXHsyEG@vger.kernel.org
X-Gm-Message-State: AOJu0YxlD9gBoXWx7MbDQ4jTo9crAze7KGRWaqYD5ieqL0JQQ3fVWIGG
	wiDB4VnWNBOmRl3hKJRYUPY4xjkSKpMkNNnKJrH3MjxjbrPPbiXtq6oF
X-Gm-Gg: Acq92OEgVkf5oaM7D68LNxK0Rzlo1tO2LrSgBETIE4Y1WbRSZu3Fd5wkRTLuPyFpJc8
	ZE3upmjzpW6VEWE4sLeffC6cPlXCt+xdH25tYWe8t/EUtsYrXfeHk5OrQ3/mVvzqTceUccFDZOA
	9EQIRL50WD7wePU022Om+W82ltROl1V3lpDZhkacvui2CTAHkRkIbOrf5dRc8pUaCbm3DWOAJ/W
	SW3QGiz9k9v64m7cxpLDjum3yp8GHYnwDp6Z6Xnck8Ftbm/INeqsNErSqkQVMeiyB46hMfj9Qpa
	tEuX2cy3f0JTEoyNJMM5c59OFcPfAaGbqTwD9t2zSogfUdZsQSew9ka/wlmchUsdCn77ciSbJq7
	Cf1XAeeVWQchf+VZVMdxiiSNEqj037LG5+6f8h39A31fhMstRknNrGepxv0qT/eIdEps03Q1rHc
	PeTvvbxIcDKh4xY3ETr3QNWw7cnJfu7nFjJQeRefQwuST3lMNPSQGdXbwpXBc=
X-Received: by 2002:a05:600c:3b02:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-490425aa70fmr438828655e9.8.1779954379113;
        Thu, 28 May 2026 00:46:19 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c724:a823:10ad:6b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908f0a3c2dsm10865885e9.31.2026.05.28.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:46:18 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
Date: Thu, 28 May 2026 08:45:44 +0100
Message-ID: <20260528074615.91110-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528074615.91110-1-biju.das.jz@bp.renesas.com>
References: <20260528074615.91110-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SMARC SoM has versa 5P35023B clock generator to generate the
below clocks:
  ref: Not connected
  se1: AUDIO_MCK (11.2896 or 12.2880 MHz)
  se2: RZ_AUDIO_CLK_B (11.2896 MHz)
  se3: RZ_AUDIO_CLK_C (12.2880 MHz)
  diff{1,1B}: ET{0,1}_PHY_CLK (25 MHz)
  diff2{2,2B}: Not connected

Enable versa 5P35023B clock generator on the RZ/G3L SoM DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description with clocks arranged in clock output index
   order.
 * Dropped assigning clock rates of the unused outputs (ref and diff2).
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 17bf44778398..5e58e08e7fad 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -40,6 +40,12 @@ memory@48000000 {
 		/* First 128MiB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
+
+	x2_clk: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 &eth0 {
@@ -75,6 +81,18 @@ &extal_clk {
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x2_clk>;
+
+		assigned-clocks = <&versa3 1>, <&versa3 2>,
+				  <&versa3 3>, <&versa3 4>;
+		assigned-clock-rates = <12288000>, <11289600>,
+				       <12288000>, <25000000>;
+	};
 };
 
 &mdio0 {
-- 
2.43.0

