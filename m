Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E044A3FF
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346006; cv=none; b=b/Yrh99H8ON8MyX5YVS4xLQykSGY/5ewKNfOnUeGusjx3zPyjQ0US0Lhv0bp1+ruJJgacMw5OZl3El3ret4S+HV9F0gBKnxhI3dNBmJ6uOSpPhCvC7ceciZSoWimCYkCHjojkt8nUxFojlA+Tu5qQaCzWt/1oLqp0xNht5oSBds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346006; c=relaxed/simple;
	bh=NmiOL95hm0vbdI50DvfNmUDaV52NAtuc+Y38tzUNcAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8Cy19Yfvcb1C4KCG2CPzCoVnlGOJMBm8XNh6mVvJqFYopG/5vBd+SnxO/uf0fjlS8yXojDbAMpLoJxNNsrtL47bMo+h+3dBm5YwX2zCUOCFbq9zr4A0Yhpq6qojKC4YMnWLBwEpQSWgw8MuENAPAfLC0I5CH3qqVOCWlWSfc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=NmLEYJ/V; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="NmLEYJ/V"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso6215065e9.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1788345993; x=1788950793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3iZk4OWcdg0+cXmzhzjzSGUo3JXPkTbXucm5mccprQ=;
        b=NmLEYJ/VgpSqx5RGpsbdXMcNYpfMii7hpDB1zulM2MtlhAa5i943EoHNqgJ4nxYPFP
         r0IhvJrW97EYJqCcbDPJHtFKQsHVn0OREaTGqhk8aECh4JtpTH+Ivq3QtAdFzebJ5x3v
         ANqWGYkt4k2t/acqbEf3B9mhOUMBceP+7S6Qzf2BxPZtkNyZ2GH0HhT32A6MZ8bRQtFH
         WkXrYBkGqLgT1ew5I4e+ZEFrbs9HAk0dUdetoaZrdRzYmKRF8Khids0OZY6EM3AfJ83d
         082niKwEst9OnjGRtD/frkKzQT5sLwcauVemvzN0QH9rrYilgRDB2NPYvWHcRIM4BgWk
         2a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345993; x=1788950793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L3iZk4OWcdg0+cXmzhzjzSGUo3JXPkTbXucm5mccprQ=;
        b=pRLXNZ0jKirzTVRrD6j0pLkCn/qWTr3gE4KiAdXWQbDDdBXnkXcC1JkmNuKc3vE22l
         mDL9+9Fee/f4SPWurW3au9HNeSupdbwfUQ4Za2Sbfx9EanRHKBDpqh/pBCTaZoX4Zp6c
         TnimZwQx5tg+iKrG+6J3ChgGVKw8oH3SljWDH2hNpFDOxBjCekyTtThEQ3v4jOyxTgHp
         CszOlgJN9vdEeN7xuALp2sfbNi5I5+2XbzCV//Du1Vo5IFxKftZr2YVEwXgmgFWlgwA6
         D+Cq9QpKj2Nq7lX7W32h+AsEfTTY718RwjihMV0eqT5eFGY73Q9WhIa6qegX7ke5fj0G
         hhcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ8hyohRKN3+9LY/WKmC8daBdcqtMpXJuHA6upIWWIJVkK6/fQPk623YDxYeu7Ku5P9+NeV0TfrUDs@vger.kernel.org
X-Gm-Message-State: AFuF++lDRXeZECB7fCi2rK6G/PXEpoBtFSU6/+2CNMnVzU2AFruXbZ8o
	O2L0ErcW5KY1rrCIBxvkE0t3RCmV0bf6bfAMkDYjf88byuWNvDoBejqcRYC910i297A=
X-Gm-Gg: AR+sD10AdtOphwWJa132CDzjod1JUGR+KIQPZHZfDPo/lm/jk38Y0EPoOkdAXLaExg+
	8h/EWOC5j2LGZC5hI/8dtDYvtXHTLCvXiMVQp3M6J5BdkafSyKMaLQ8aq+j0fTT0loFauW3+y/G
	C+gs0YAs7rcCZGPzExutQGzFVE40eLWuOpLvqpf+EEhobDsPH7xY8PgUb+L1EogeT5l3F+K9nuj
	KfRTQ1XiOv3C7oDhnRcDEzQsk8uoYIfOVKw2BLFga67v5oTRQrjsKJYhPjOtjx9lKJA2+FELsdX
	MrE3S6BIe/1RT3kDoavNF0u8VLw8TQhWCCMWuWbl+3qUo9rfkxpyVS2hKUpoCjNIi5eetProm6n
	at49g/TufgkZwpsvy+z7IdAX0fBqxDAJevuED9gIrOqfTNHM//WcOk16So2bCPeB7ZMOpJaXpCJ
	4Hfafic9nvLxLeErsYpAJAiYBFequKppAwMbCznwf48QxeYAczBP/HMty0O8a+hHmCTK05sTiHZ
	+8sGql7HzJFXJeqPSjtPIA=
X-Received: by 2002:a05:600c:8b88:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49ce581a0a0mr75334855e9.7.1788345992988;
        Wed, 02 Sep 2026 03:46:32 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm20127665e9.3.2026.09.02.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:46:32 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: qinjian@cqplus1.com,
	linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	devicetree@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 1/2] arm: dts: sunplus: add peripheral device nodes to sp7021.dtsi
Date: Wed,  2 Sep 2026 12:45:44 +0200
Message-ID: <20260902104545.67794-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902104545.67794-1-ag@ffroot.co.za>
References: <20260902104545.67794-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree nodes for SP7021 peripherals whose drivers are already
upstream:

- PWM controller
- Watchdog/STC timer
- eMMC controller (mmc0)
- Ethernet switch (L2SW)

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
index ae9bbe0320b8..9bb349a5542a 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
@@ -291,6 +291,54 @@ uart4: serial@8780 {
 			pinctrl-0 = <&uart4_pins>;
 			status = "disabled";
 		};
+
+		pwm: pwm@7a00 {
+			#pwm-cells = <2>;
+			compatible = "sunplus,sp7021-pwm";
+			reg = <0x7a00 0x80>;
+			clocks = <&clkc CLK_DISP_PWM>;
+			resets = <&rstc RST_DISP_PWM>;
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
+
+		l2sw: ethernet@108000 {
+			compatible = "sunplus,sp7021-emac";
+			reg = <0x108000 0x400>;
+			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_L2SW>, <&clkc PLL_E_25>,
+				 <&clkc PLL_E_2P5>, <&clkc PLL_E_112P5>;
+			clock-names = "l2sw", "plle_25", "plle_2p5", "plle_112p5";
+			resets = <&rstc RST_L2SW>;
+			status = "disabled";
+		};
+
 	};
 
 	leds {
-- 
2.53.0

