Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20AF2441B8
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787525838; cv=none; b=Yvl/WVnMMRw4ER7WXrAjJ67ekWNU32TsbBA2xVvFw3nwFzHISNptx/JA/wjmA8Q43CBu+NjwZhQSYeHgGs1gb7F92KoeqGfycW4psACwDTtvZgAZSaTixanA4oPhnVaa8po0CfGkltpYJ5KC4HLINnfcC0mLEcnJZJxpUzeU9v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787525838; c=relaxed/simple;
	bh=MFVvndqmgqt7XvRFOQuuPx0LRipmu+49v98832HkAZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FmEhQc96K+qgMnoSFiSoaCeihbnCwLwpMH58SL66y9hWgIRf6K2bflOxAQmd3RF5Ktc+L2pESL2yAJm9Vy8NtbkU0BE80V+Ilqqn8F2UaR+Y7aLL3sc1Cd1FTD1Wz9A3oD2RxvyZenhuPOdnZ5s2kQjZg39tIrRA3xdKKq6jEWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8n35vg9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8n35vg9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3806594a91.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 15:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787525836; x=1788130636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=;
        b=d8n35vg9Do/BQ8WoPTWs8a+BtefNAn5fT2XcLhZOKHeX7pbnzt3TxFgMBP6AHrojgl
         anG96oXobxKmVqNAqcv8dpbi6g/VzhUQOcypNPVyCfeuAwK5m6VX4Oqul+nNcrKRbKAJ
         VXwZSMUZA08E301utq3STtJXO8tpTsvvn5BufzHh7UNkvqEmdwROMT4wi3b1GSI0ybIh
         pxuC4dtFMu/BUQPczmsdRrn2cmNxY7ZFoAf9UoPtlUPaG29tBfbWXeyQdF8wTBaG594m
         70BlT3Eivwwhy+2enNrRPSAaArKzQsf8kypkf0ZMZDv+DFh48h+Q/8xbehIdypp0QChZ
         +79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787525836; x=1788130636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=;
        b=fmjH9OKdFWK/NAUG9yon0R+1g05aeYnvBvVCFQJ0rX64DFxQVkwWGVWPmtpwEnHqow
         5m/guaEp/IQ5oq/Yd+uzgXG6u9pGiz1gaSHQ0wyOayBTvVCZpL5bfgOwg4UASlwdZ75y
         71e7gYj5NcPSajs7k270dyctOHg1bHjDTGAo8Cn6xALZ3FRVtGX/cgJdceWQbSKFOGl7
         8hjJTUr6/Q4uCySLBI/iQWGr4jgBsME2HYiMt2mNuaYTjTCKdxxdXF4MhIFcyVGHk8HI
         gA+k87OTaXZU0b/N0PiKrlXRa1anid3TsvRRq/L996I7SJuQ0a1S1DLCMu5aCQy1RyA4
         uhzw==
X-Gm-Message-State: AFuF++m4RQIEgvSz/eMkUGr7EppouWcGcZvugNiF7pVtS6a4t/g+hGsH
	YTl09X+d/IbkKrtgtnJU4HNDKAbwUeGtIhq32OFywwgob29o2XDJu9ogJ2+O7Q==
X-Gm-Gg: AR+sD10G1+Vr6vgum/KaqOiEjoh1y6hrZLzeG0m/4xPdpth0l6uC5KX3KG5yBIubb97
	trgtI9quq2sMKTDKRJKQt5DiiiFyl76/JoInfJYLzOYuHiifz/Z8uK+R8trRuUaIiSOmX1WrYFS
	jnlr0ovqCkULJID2YbWg4RZVe9aAGP2QojVxTXxhjjel4TkMc2PLn5NF6Uw+XdKahpJ50PAFctZ
	lmfnX4cK4YlxKd0y0PWkUQNInPBb3N44VJ02mB9/PYhqU2ubY2aZwYN1Aw4sudJbohhw52wrcMA
	OjBB+2YRpEjscCYq9hWyUIvOZpUsg2lTfH/GOpBfNsh1XFM8bK5Hp3JdMbMPjLkeFf9Y4Z70SFK
	EQRF0JQbuvsOjCyhSfw7/RT5ph4PLZo9uIURC6ZekvzXHNLVyhS5OfLDM331EaMjIcrKqhiqPoo
	vWs1V5bny3HkHTmeOXU6MHbOQz0laMKXp1V3nDuD5ciL/5qgQV/6jG0X7AT8Dwcs5K4iz0DVJ89
	bVo/HG9jCKcs5ctq4k4f2Fbiu94XtyGXSrP5CGwtpZDnW4hFVG5mBqpuNE5NgAj9w/3/+X0/Xg7
	EaOTSDhu6yyQXHzUgChi9JYAMjZR4JD6J1KKfkToQ17jolo3
X-Received: by 2002:a17:90b:33c8:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-395c397f4ecmr34800142a91.15.1787525836228;
        Sun, 23 Aug 2026 15:57:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c9174be7sm3416564a91.3.2026.08.23.15.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 15:57:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: fix lm75 supply name
Date: Sun, 23 Aug 2026 15:57:14 -0700
Message-ID: <20260823225714.33938-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lm75 driver requests a regulator named "vs" (the +VS power pin
of the chip).  The Helios4 DTS incorrectly used vcc-supply instead
of vs-supply, causing the regulator core to emit:

  lm75 0-004c: supply vs not found, using dummy regulator

Fix the property name to match the binding and the driver.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 626a7339a5d0..af96d27e7159 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -200,7 +200,7 @@ usb3-ilimit-hog {
 				temp_sensor: temp@4c {
 					compatible = "ti,lm75";
 					reg = <0x4c>;
-					vcc-supply = <&reg_3p3v>;
+					vs-supply = <&reg_3p3v>;
 				};
 
 				eeprom@53 {
-- 
2.55.0

