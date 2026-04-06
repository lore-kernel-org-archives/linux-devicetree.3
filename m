Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D5317171
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464464; cv=none; b=dU8IisovfiqSjRoRG3JneX4ICUqUMsg+CMTo0O3MRQoMII9fbDh5zSYdLRPbWLbV7D1Jr4ZM0ErtGlVGcQ31XNRRzov7W6Izy1Lh55Bo7Q6CODOqdHaojzjE9aBbDpHQcU68uxkYZVRfnoySS2wMjiIl2sj6ACEjGrYkOQfeGIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464464; c=relaxed/simple;
	bh=9AkI0Nz1ZzMhKBtxhwDRab9jEHmljwJvezZnjRbkhVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXkny1hLgstWhVIpzT4f1G5ENugPCQSL7UvVH+QIi5gkonPJqo7WgX9sKkdn64Wrm+GUh/PGbQ5uz1GZmYlOomsQg4yn5DkdrZBY/Ah7z8pjO6C9pi93wi0o183oSYFQKJ38wNJ0GOkU2G0WnKsKV+XkVoOuvJiv1mtyi+9GLzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkZlKqZu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkZlKqZu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so11047605e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464461; x=1776069261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nwdcazcd5nv+n45NTFsXMrutWV/muXgCl4fYEEYQm0=;
        b=hkZlKqZueypbrjYiVbCWXD+EY+D9FBYyqaR8QpA4Tc+ZjYM8m5WhlWfKo7Cgiupn+p
         U14ubhZHN4uYXfCr/dKr4O+F/u4+fIusbbGvHHuMfJRYBoOPeuGBi7kLgRnmv1n7JPoc
         mu7NJ/6OtWtVnEmkq508+UOogRyWtT7F09UqNeXVIlrSHq05FKUpGEN4Bv73ut/Nf2Rx
         woK4bKxBngSDTMfbuiP8CD01SvGGpTBO/bprzuOW2xspBUz3j4IZwaTYXJ5D4aHORvfI
         mDYJD8CKvAMiW66TWGvnLjFSoX8xYhXyEb/GMQz/olS8aj6Z6ZjVG+AlLlgslSqwEa9n
         ffRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464461; x=1776069261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nwdcazcd5nv+n45NTFsXMrutWV/muXgCl4fYEEYQm0=;
        b=IRkrXhARC4rOgdFSbqGxqzJUZxyH8KpaKrtpnVDbCnm7t0F61DboATJVYWh/IH9qIY
         qXUG0s8KB7FS42cY/5kAoWkbGDZ+DFJop6WFWCMpNwo2u20pWTdchXbiR0RQZDsw12xl
         Op8I/cj//DbRTDBTKkBMGrTaKRpJZhieRXCWjm8C5fnjnPDwaEP0/nGX1qSu3+6s2WJd
         1Ogxq+G3bY0M/aGAiHy1slz+wW7u+PCeuV1thulwBfLl76Eb+f5rRjj8umkRxeez6MyH
         saWsRz48i+Jz1MkrI6D52rq2H+3LIBTWC9tDMaujW7lQb/06Jc6X/JzW3xMvpghq88va
         YOYQ==
X-Gm-Message-State: AOJu0Yw2o4lyNB9fA36rfvMv2hDikjmWXI2/i8suseBiBu70r+wCXRTU
	th2EsLdCvwMqo5oq2EC4rOQBcpXEFODW5IrLhJoPvDERvDM6MhZjwV1u
X-Gm-Gg: AeBDieuE0PdCoVCU4GTysK8rQoj8eYwS3oUyVAGjkdwIiJzOh3yve9mWFVDOiOySbjK
	Yt1OoZKxuKp3APPHq6myf094DER8l0AIeA3SbdWbKYaMexkmi2CB5jXv9aMzc+XwN61VWptZIF7
	x2KS7VYjSJh5ATyyYywzinCxo/54KpXoIAh40Zi3Eqo7SUGg36R8w5ATa+xqhlV6f9fvUyA/hS9
	Gtf5/UXyn+HWVbuf/e9c+cR1K+DcL+zhXII0ca3ncyubCg1gSRo5+F0PrWMH44hpu9bCs7lgW1H
	DC/U+x9xOqDGiP0yzGV49wY+F/xylV/o73kLPWc+rtsnGxLenmqGW73A1ZVmP5Kil0Usa0P8lMC
	7K9EQbK2BKjedJdJyiWEwN46VX1w5rQKxDi4emNu2dqllpi70m+WXciEHD1Krjsh6wt1o2YjpCX
	CFthkuPuX+cLSj
X-Received: by 2002:a05:600c:8599:b0:488:aff1:a7cc with SMTP id 5b1f17b1804b1-488aff1a9ebmr40356075e9.9.1775464461027;
        Mon, 06 Apr 2026 01:34:21 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/9] ARM: tegra: tf600t: Drop backlight regulator
Date: Mon,  6 Apr 2026 11:34:03 +0300
Message-ID: <20260406083404.31359-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
References: <20260406083404.31359-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop dedicated backlight regulator since the GPIO used in it is actually
SFIO controlling backlight and setting it as GPIO causes backlight to
freeze at maximum level.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 8b68bfef8dee..0bebea0cb8c4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -2192,7 +2192,7 @@ backlight: backlight {
 		compatible = "pwm-backlight";
 
 		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
-		power-supply = <&vdd_5v0_bl>;
+		power-supply = <&vdd_5v0_sys>;
 		pwms = <&pwm 0 71428>;
 
 		brightness-levels = <1 255>;
@@ -2422,17 +2422,6 @@ vdd_3v3_als: regulator-als {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_5v0_bl: regulator-bl {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_5v0_bl";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vdd_5v0_bat>;
-	};
-
 	vdd_panel: regulator-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_panel";
-- 
2.51.0

