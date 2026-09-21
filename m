Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3484F7981
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015207; cv=none; b=rWlJuZmh6PEolv/STlLjk43db+6RhRA4haFqUEmE1R70zg0/i5iupem0i12/m0w56zT479PypSPXDSpwQiODbMMmMeE5EsqcuAIHvfwPNAKZwTUacMEZDnnNGbfApFS4YJzBPVxgFLnjrVfT3ooc74wwfw7jywjqmMPhO0w32gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015207; c=relaxed/simple;
	bh=J8b4zYIQqoa1IElFVUyA20gVC4pPVnEgC7C3+Sw6qko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISU9hwi60HbQIkfnjmwy+m1CHSWHc+cb+sOcCAhOxY0E03APPWHYpOazLks2nBuw5qILjGgsOo3dskPVHyVMisojq0AmM64sosMPOa3q6M9wodgKifj9Oq+qe1xaaqO3+HExW9M4DZZVGvH2wLD3ai7GWiiRRRGE95vQqWqMMCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=zgZXe+sw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="zgZXe+sw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so23031235e9.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015204; x=1790620004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20Yw1oK3y3ksu38jNw5LwKcm1H8AlDyDGvzedy2bX0w=;
        b=zgZXe+swLbDnRJ4iz+JjoTKgk7sOBlpvSdhiTfJ3nFjVdYXhzDfaiKhqsf0Kn81F1/
         udWA0ypZRQgXXPGwfXsM91PMOf3JzW1sCdpdNxwo5XcygBstW1ZVYeWnQmeTTihiHDm8
         jpl0Ylco03qfJ9SvMg0qKbxjlzRr0mkhN4xnWmdicSJzJrSh27tNfOeLvG21+AHTXsuF
         SsYMqDAo54h1nmLLEHp75hfPAWT7DBHMdvNRdzM++moq5MA1EpMbgmPRZKHN6AP+mGs4
         HNCumyu2mS3ojl2q4P7mPu7OS02OQGI+m5VlD6NclXbbTm0RlfG49ciQsm9obEGCJTpe
         wE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015204; x=1790620004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=20Yw1oK3y3ksu38jNw5LwKcm1H8AlDyDGvzedy2bX0w=;
        b=uFAhGR3BsQrJ1Me0Wry7VFGRsfuSq7SIyLGVuNeIsw3GrRj+4y3IsShJjQTloA0BI5
         D8vSNeqNTRN5MQoI8szhOY3spun/vqnlC/QsUSUE7lZpFtXN/DzVEQY6AsP13YVUEnwS
         W/qJQoVJGOHj+8tI/RYA17SGgCCsRWNTbTlLRY1+pVAFqjlr3H+Gyo8/lJOlYmFdQXLm
         WR1F9KCApvvXAyNPKLBB1SpB1hFmL0BPfACge7zKd58Tp7qzFmlS9l7cios7fOF4EhsT
         dF+QkVBlDUlxhzmPjErt37mD/ZTlHZeranwwiqIP2l8I3ITiNQsxA1VL/iYwDyAcgU0L
         Ny1Q==
X-Gm-Message-State: AFuF++lotq0Va4Q7OA7wiuZZwnAtmyRXRW+nmru3+OwCiwVsLJYPs0aT
	7+nK/oul+aSBe6cvrBRW3FMom8bqy9wFmUvLTf4JTukFAuLQ2wle8H0vi0JfOObUzUY=
X-Gm-Gg: AYBFou03XS6wueQmARHuCV5wBB1d13GEP+qseyNqtUuuk48RmkVQu1ilJBx0HDMbull
	OU4OhilXxmzWEa3i7atuSSlcSQaTi/wnSJ1/PJK53sxgdvXCl68nUhaAggfNZ0IG8vAt9aKQ8Sy
	VBJx2u/rfA5ngOgyQ5hV3mb4++AqLbFOzi3yElMxvkrTkmkG4mYgZc7If0nc/7gNEP5zzN0DsdV
	xxXU5h8PunvF3TwdjJAbS87xmtiEF45dJ/Hp3jRgmkucMG3qQrZ6DvAxJqfS50//aRLnuEtWaSm
	qEdTX9mveuaG2+gQCvGlpOFwL1aOAVJPZF+0IhMSqxCM7mx0czZsDyF+yya0fN0wDNXGU7VbIzI
	+wQPSG1oEBpz9zeAlC+OtRzxujQw9VHr3SEFyNp960yJwNOdrPeXEeEvEhoXAI6jToA6LwQXYFx
	179i6XtXowBg20dVPiwWDU3aWqV8ZlkwCEe1H0b5eLg2nhz6JUYBhonEiLOFv9fmB3vecj7+6uv
	98dauiCwkgW22MLNLpBlZbxqV7ze4RLpsRI
X-Received: by 2002:a05:600c:3ba0:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fc55adc12mr204998805e9.0.1790015204081;
        Mon, 21 Sep 2026 11:26:44 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:43 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 3/6] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Mon, 21 Sep 2026 20:26:17 +0200
Message-ID: <20260921182620.17597-4-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the peripherals that have upstream drivers:
- PWM controller
- Watchdog controller
- eMMC controller

Also add a label to the gpio-leds node so board DTS files can override it.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
index ae9bbe0320b8..17185238e7ba 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
@@ -291,13 +291,48 @@ uart4: serial@8780 {
 			pinctrl-0 = <&uart4_pins>;
 			status = "disabled";
 		};
+
+		pwm: pwm@7a00 {
+			#pwm-cells = <2>;
+			compatible = "sunplus,sp7021-pwm";
+			reg = <0x7a00 0x80>;
+			clocks = <&clkc CLK_DISP_PWM>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@630 {
+			compatible = "sunplus,sp7021-wdt";
+			reg = <0x630 0x08>, <0x274 0x04>;
+			clocks = <&clkc CLK_STC0>;
+			resets = <&rstc RST_STC0>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@3b00 {
+			compatible = "sunplus,sp7021-mmc";
+			reg = <0x3b00 0x180>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_CARD_CTL0>;
+			resets = <&rstc RST_CARD_CTL0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&emmc_pins>;
+			bus-width = <8>;
+			max-frequency = <52000000>;
+			non-removable;
+			disable-wp;
+			cap-mmc-highspeed;
+			mmc-ddr-3_3v;
+			no-sdio;
+			no-sd;
+			status = "disabled";
+		};
 	};
 
-	leds {
+	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&leds_pins>;
-		system-led {
+		led-0 {
 			label = "system-led";
 			gpios = <&pctl 0 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
-- 
2.53.0

