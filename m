Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1086A47986A
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018255; cv=none; b=JbJqA30TlAMPRuUX88S/KnMdWSDyUdSTvRjMyi0X2mi/Eh6oEa4lFaoVcq6L/z0Pyn580g5VRKTuCPkT5lZft4LMQq0nFjBBoT2ObpXIiw3BUQGYzIlS8iQuYQsS5wa/z2AuJR8g1FSeT+AhiT+IQzcR9A2xfvHZcPH3WSmLon0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018255; c=relaxed/simple;
	bh=CHGFtUMgKclm8cloUipfRSGjYPdlh3BQnzgHKZnKxCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lyodw40sScuNU+5T5fCycU2R9+zoC+9r7ztiEfQMSyVkcF5qC0cBZOO0H4HJxu4nnZtJ+GxLR2OxVLUSYQhzXcEfJfo4WKi+ZRsMqo5orR1uI8buiGdO2AMPIqh8JYZNa0HeeVGOhjO3KfJd4wVIvkrXjaGziPZ9iWU5BGJQvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGurNJto; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGurNJto"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbe3fed2f58so1775505a12.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786018253; x=1786623053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p02VpneCZKfAKPbd3V425RvaKg3GG4ltnmCt6pEGruE=;
        b=qGurNJto1omPRhNTFoITsaoXjVBBYeyBbKUsz8BpQDRF7IjnO3QaMGVo8BFuspx/1p
         kNLkJuMFlqsGZB01EPMbzpMGLzym3XWvmWfzvyROe6PNr1uJmS1J6XU8X7t+lBYDfc76
         xPpic0yBeVjED99xmf46Ukxj0XpY18Oq4La3sZC6JLyoWH7wnNKFGKHRVk6phQRAMefV
         yLvp7Nc+SnLNAG0OAoyhlsYeEr7DxcQU/ueqptqfVadz+kNNEvojFnlAII0+hOk9Jk16
         EeLV4x7Qjl74nK2ao5wkzEY4h4ctj5EwHBZcKeileQFIPvLaiw/GFzAjiJxNPFrhBj81
         6McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018253; x=1786623053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p02VpneCZKfAKPbd3V425RvaKg3GG4ltnmCt6pEGruE=;
        b=KVgEEkgQeOGt1daWYhmBBJoIfsliuXIUeB4MPW+IoWQryNVQZUVRKJzc0zGc7smr6S
         lN5vuXhoTOPByAKyCngEg1EFDzexAguPPpdamwU+pIAV97XYwXwTmpDAvRqWHUX64FyU
         VPh/GB/ojh7DZkOqx5EpPA0Yvtttrv5AJGRoiEWF2Cur59ez8ZkZYkB7B5YOfemXVV9n
         cVTWu7RBpjYSAcVAcz7XUa2Yv/tNpUhezvGDkOhbWgBQBQy0YWMoTbn1S96FHObLWrEZ
         F+s9ihA8Mudip0y8h5G51fI6hDtHqwESavMsSLZ/76zzTgw/hkDZogHNbK6vzwMdGbHj
         tmyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCSd2tCm9z004Z2GoLx+1expuLbQGYaWK+G2oolqNscwP5F9QBLdzU2X+T+1UT9am7hse1P0559V7M@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6iYI9k25LbEI97pnCbbVEqFqhlTg4cPqo8m49QXHcjBf7x6PI
	31O7R/KpYf6xVfOL7eY+2Oj5O1OIoi1X3MY1gSO8sFG2Fu4uU/wqORPP
X-Gm-Gg: AR+sD13uP1abvDoJXhyvOVh9v5tzJ9zH8MCcfeGpeKSdIu2y0QOvMvJXzbOMSTC99fa
	JbU3hwMWNRtEW7JbPdh/gyTFCbtylPlAQnFgybmqys1BE7FkcY/kS39HC7eQ3sEyefYIrIt2oEI
	2EyhGochGLhI3McywM7C9yDRpETMhcyc3J6AvZ4NWzKA29nSOA1Fzd6wfvEaPmiwDZDNA51RKoy
	5RTuCrdPJ4jHEHk+V3r4mln1UwZVoy+7ZX1hq62DbW9joRCTUkfS7+XGiQJ4J1qzZbGkFgORqrp
	/AVT/nUUz1/4ZHYawMaxNIQ7FrJTNOkxIUPM0pswtCatwUR94RU0+xokc1rFiAMNnRq+EywdmM2
	GH3Q+KVEA4VgBjQztpHfoj/rctAqGd3jrhhUzGfUO87QecC6rKU4HT2gKwF1gn0o1WWbPhzNIU2
	HrZ5sv4IDDasfxTEmr45w4ap7ykp1lBD7XyMvB4AK3/m0oE4Wi49pyk98DO3ZoQ+eECAdCwkOQ3
	cdTyTxxWIXfMpr1nucA/KoXLcrKYFsHa/SEYA==
X-Received: by 2002:a05:6a21:9983:b0:3c3:69d0:c57c with SMTP id adf61e73a8af0-3cb8603af02mr14408140637.32.1786018253110;
        Thu, 06 Aug 2026 05:10:53 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:daf4:8fac:b7e6:4f37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7b2sm28406824eec.19.2026.08.06.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:10:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
Date: Thu,  6 Aug 2026 09:10:38 -0300
Message-ID: <20260806121039.16967-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to brcm,bluetooth.yaml, the correct clock-names to describe
an external reference clock is "txco".

Change it accordingly to fix the following dt-schema warning:

clock-names: 'oneOf' conditional failed, one must be fixed:
        ['ext_clock'] is too short
        'extclk' was expected
        'txco' was expected
        'lpo' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 352c8efb37e0..27ebbbc66633 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -703,7 +703,7 @@ &uart0 {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "txco";
 		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-- 
2.43.0

