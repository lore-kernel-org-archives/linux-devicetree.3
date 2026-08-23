Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0855280018
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787529377; cv=none; b=WhzCFCSLvO1xcTlX1iFnzfXIUw0qH3rIvJoLA8WL9Ruf193IyIqYo/0Kgd/9UgT3Ri6wIjJc/HMytyW73HDQ4pU91DYIcDyVhDm0evLGjfhIFKmd7QyP3nFGS0BL9ogV19gLc6FH6OaDSxFgCkWR4bVhAqSoRT19Rsa3I7Mw+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787529377; c=relaxed/simple;
	bh=E2o1w+24lvxjtE94jW9/V2A7t7qO8hn05vXx/fLg8+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lPpTygUfynPrXbGvyepuW0QYpnMlXXmhOOVT3ZV42tYPDuHKus5x2jhCQLuSpDaX28aXN5VrHdobyOJXhArvMBbEVaVu3eduw2qyjflA11mCeHD+Szai90RC4zwH02N2pATyA1poAz2grjqEu5IawD6pSTkcpuNDHL8w+3XxEnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmNRB5fS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmNRB5fS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2658393a91.3
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529375; x=1788134175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hm8ObTDYhg+E35jyHJqZ0AtNesOQLYncxuZuX+5HSg=;
        b=JmNRB5fSfmh3ewztSZ8NbAFu5BkYUPEPeJeSATl+8lJCBMEztIcLB/isqo5ghDWxFd
         +IY6CSFQJsqRwfSvfV+hRE5A0EHl32LACA4svaiJ2o4DOOAkaIPazA7bu+SeTWuPi1g6
         jlWubAGbVSo6UHKRjPEqR48Q86eZHZXvN4Zwn3EBjMswxrT0AjAFmz+1EFWZsMlFEOdM
         ua+I9tEjpp2E+O0vWMtIza6VIR4DjXdpiqg9KpPdKte6U9EWQ2W+xVKosgabtVO9HyZb
         EyYua8VoFJXW8nEVDT5ZnjaisCQJguU1FnNwt+Y+kGn+UUzGFTd93Vq9m5qakkCfXr5/
         qQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529375; x=1788134175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hm8ObTDYhg+E35jyHJqZ0AtNesOQLYncxuZuX+5HSg=;
        b=CUc8g6v6d7X1dFHAXj+oDBpHZ3F51va5sFvpVxO4UcWZFJG7phISRQy1FFKyENP4t1
         Y3Mvnd4x+6Kw0E9BNCw+Dw2tov178K+hFDXLydjEPhnX07qU3BK7tzj3ejZ/5CtgMQ1t
         XQYtPY3Sn1QZRPg8iCKEVFpTrxA3tRi2FWVPha4gwK4tNrdTJrKUM/jYaX+zGynfAOvx
         HYgMAmwer8s1F4oFnBPUxhoEEaIlWT3hTENFkucfAu/AwapprAr3KgfQgLfuh0dJH7dY
         9QS6Li5gu+3jqSZaBu6cRyhHE6i3D5ps4T2jKeqGH6JHuKqmmPY4jqb7101dpFoB8uxs
         0QgA==
X-Gm-Message-State: AFuF++m8G9brm4xlaAzaMInXuJ8YILZtrgKUg0VOUT87GpiYQXYmxAqK
	wXCOL6QaKotgpGHNpFw6yV6PCEyChgVbfqldCjtIWnB6GtVL5Ply0fRm6dIUew==
X-Gm-Gg: AR+sD11KjE6nN4HdcECbXJ1VdCM1Gj25ErmR2B1dL08WlPwGEEn2fy9KfASB3nSS1Wp
	IEBthbMDaT2b5dQ9n6JL5An4lZOYJN2MOyuHIUS0UkOCIhsiPtV2EmX21bN5GLISxIyCl2+iEys
	qR9gu7GS23m6bxa6AEKpiHQZsNea8A8s2OjHlSfKWqQf8N4eA2FF40BRpoRJh6be0mR/iu1aety
	atY5J4YVHqEyI89a9T9AI3Rrh9n13Jr+m2mj6UXEYEob6HjWvDHtvmRExgipbzVnRKK0h3h1s5V
	yjy9qkfW9MgceQGwHFYj44i7eSccFcWGcPZXP54Ro2UY8/dJ+a1TTrB8Ps1wxXf7Ew7Sw8/wz1+
	WcJadFANJyoInHUbv6JrKjlscgHvg7P/w8lvXeIKsEm64nQyriDYsiJR1V42se/9Vr8BgKMzr/e
	hTUEKSrufA+MBuwXQBcXZG1Ki3vefWhij7emRh1Ekl9hoz3li7LfHqBaP44gG3TBhsx34078WyQ
	PtQjAhI7aT4qFxEcdDvwJsK8EDU7eONs9s0/3cGbQwDguerImqyorgcoxvePaXn1PnBp5Yu7Bbi
	5NE0cspZE/51d/Gb99JDTQcDqB+bOdSHeRLpaw==
X-Received: by 2002:a17:90b:4b89:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-395deeae6e3mr23990533a91.6.1787529375136;
        Sun, 23 Aug 2026 16:56:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af75acsm7534205a91.12.2026.08.23.16.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:56:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 39x
Date: Sun, 23 Aug 2026 16:56:13 -0700
Message-ID: <20260823235613.77505-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The marvell,armada-380-sdhci binding requires clock-names, but the
Armada 39x SDHCI node only carries an unnamed clock reference.
Add the missing clock name so the node passes schema validation.

Fixes: 538da83ddbea ("ARM: mvebu: add Device Tree files for Armada 39x SoC and board")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-39x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dts/marvell/armada-39x.dtsi
index 218fcf99ae07..81dd4ca5fbc9 100644
--- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
@@ -381,6 +381,7 @@ mmc@d8000 {
 					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
+				clock-names = "io";
 				mrvl,clk-delay-cycles = <0x1F>;
 				status = "disabled";
 			};
-- 
2.55.0

