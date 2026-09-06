Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847783C09EE
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718629; cv=none; b=uuazzchYhXNtBqG471JdeOPRxQHeQY6+9E/MzoasD0cbzwKYfeFantm4+nZS+w6d37+Ll5zl48VfMjt5OQ33zP78oNK8Ex5QrOvM933uveBnWrWGF57xwp1B4UnwfZNUmvZWPwOenNEq8IRP4im1Aarjz5fr/Z1VOJf8GNJSnpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718629; c=relaxed/simple;
	bh=zE/2hqn4I9P57cCKdIKN6nY4HEnzOsNL+Lxb4BdK5Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zr1Wbk1B+nQWCT1CXnR2ECZeoUKSNiv7jmqDlm1PEyDrAhLhWI48EsuVaNbjYZ9f2gLV3E2VLBy5pR2EicvT8tRqLJRjTVIWle+yGfN+7LEDbIMo5a7rg05sJYeszgb4LYX+8V+tzRv36brE2cxns2uCDRXQyamYQc8pIiNaQJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+o5tDm+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+o5tDm+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484399babcaso165921f8f.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 11:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788718625; x=1789323425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/mSQMe/ffg+AP+VO4769NtESa1TU8r20BVXKonSb5k=;
        b=K+o5tDm+s9drKsg+ic/JvPkVIPEltlhZlGhLNY3dXQumcoqVAeOn6hL4zwTjQivGro
         Dcdk9YEf6K2yA2iF1kb615YITnEuzz43ghFR/x+dKWPRcaoGAhka+nE1M6ynpaCR1Tyg
         E0O25V7Iklcg03P+D2VjvO0tHN9CBZSdVr8dVR+JwCCq/+b6szLM4FqizQkm2hhKZRxW
         8SW3eh8Tvdo6xA72XqGhDzZfshvENnuUuJLncC+0MECM2fF5d+PL1JZA9Aly5WlN8QJ8
         NcCZu/UEMET+PHJKtAgyMX3OPtKf96LvCJ2aiYCgFzMFZVWQDKtjQ9vlo/3/t1bujd/A
         Oi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788718625; x=1789323425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/mSQMe/ffg+AP+VO4769NtESa1TU8r20BVXKonSb5k=;
        b=Nz8ah9HdHNEa918SqlgfVVd/3z09Ela1ddaWDOWeqhn/jU8a0PXepgB7dNYgi+O4qP
         hLjnXtNmKUOBOuScSUXI+MnO1519xTySzEJcXzSiTQHYe/AbbZk/UlTfcHcUy+S1nNSq
         um46tjHVaFiKZgPo0GCjStf39JbNVKi331Z7VQuAkzXGHUuhBikPQYiyH7LGpNz9btmu
         +sd96ruPM7Vr9aLkVa1pL72ne+hi/MZ6c3eA10yHza5i/5u6wkUAG+PLiiWCB3x9cH49
         kgXb0FsEEbdVzA1+2+COsho6+WEzWHtWFFXGDatwkbYbtW/mR2XTJ5WYnXI1dgirprYa
         J2+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzy7qfTcHl9E0IydsrRPQAkH1mhGCXrB9bFPJ1F5D9ysC1kWjlOYjcbul+rnime5L1KT1r8pBG57DdH@vger.kernel.org
X-Gm-Message-State: AFuF++ko0z2qUsv0dkelPgXf4Q6vt19/O9Z/inyNWATax6nbeqGVl1J8
	KCb/4khb1GKsNH47AY/hvRtzZYn/FJ7qxDLHRO+VuSIZ5tkaUWWx0joP
X-Gm-Gg: AYBFou0KHMLC6a/upYLY0xiZymeqnTSYDp3lSJbrjyhBaV6+fBQXdmFNAEkKOKPrzn3
	v2OP9XK0rc0yCBBCuAKd/A/Txs1QTYDkendjWKlYiboE0shi9K0k0xa9kfnobSvfuf9QzyaJm8z
	eT7qCRxt/pQfHXT3jneLP8iCibBfRm6aYfS7Cjr8MCaXrcRwcIfyEk+c7IEmhQGRBVCrdUib8q2
	VesYo3F54GY2wE8sBmpJ2Tf/nzR43yCC5WZGTJ3MLzIoL2tBLyPzVlVs8J2aP7PKilEjP9SjHTY
	pM8zMkQZqCGxiBk/ilF+dn53/RqZ1INvPegMM3ce8HVFNGUYBaK9DVN22O5Wr3fp0ZW8lRy8B2n
	KpAN1VMMaN0odbu9whAJPepOz965KRUU3r0XpN5+vAGTG0hCEC27tiByGNgRzVSdukmOTNNBLmo
	n9SjNo/qeBob2KNbZxdpfoA/+cEDDoBR9ffVxPgXFrmN1nbxPKHvE56euxsnmV4hgjtBlqZkewe
	XQVjSrzI2e3FAhF+UHTKQL8DVONaSjBukMY9v3d+eAh7zogRhVhHku+fPOXT/LXqBiU9rHLTgXm
	Jig=
X-Received: by 2002:a05:600c:c494:b0:49b:916a:e553 with SMTP id 5b1f17b1804b1-49d010c2a57mr100932445e9.0.1788718625331;
        Sun, 06 Sep 2026 11:17:05 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B886400ACFAF9D8E9019935.dsl.pool.telekom.hu. [2001:4c4e:1b88:6400:acfa:f9d8:e901:9935])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm433916725e9.1.2026.09.06.11.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:17:04 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Ondrej Jirman <megi@xff.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: fix hym8563 interrupt pin on Orange Pi 5 Plus
Date: Sun,  6 Sep 2026 20:16:22 +0200
Message-ID: <20260906181622.11991-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt line of the hym8563 RTC on the Orange Pi 5 Plus is routed
to GPIO0_C6, not GPIO0_B0. The vendor device tree uses RK_PC6 with a
pull-up for this pin; the mainline board file uses RK_PB0, which is not
connected to the RTC.

As a result the alarm interrupt never reaches the SoC, so the RTC alarm
cannot wake the board: rtcwake enters s2idle and the board never
returns, which looks like a hang.

This was verified on the board by enabling the alarm interrupt (AIE with
AF already set, so INT# is asserted) and sampling the EXT_PORT register
of all five GPIO banks: GPIO0_C6 is the only pad that follows AIE
(high with AIE=0, low with AIE=1, across repeated cycles), while GPIO0_B0
stays high and its interrupt counter stays at zero.

Switch the interrupt and its pinctrl entry to GPIO0_C6 and use a pull-up,
as the vendor tree does for this open-drain line.

With this change the alarm interrupt fires while the system is running
and the RTC wakes the board from s2idle ('PM: Triggering wakeup from
IRQ 52'); before it, rtcwake never returned.

Fixes: 236d225e1ee7 ("arm64: dts: rockchip: Add board device tree for rk3588-orangepi-5-plus")
Cc: stable@vger.kernel.org
Assisted-by: LLM checkpatch dtbs_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Notes for reviewers (not part of the commit message):

Measured on an Orange Pi 5 Plus with the vendor-style method described above
(GPIO0 EXT_PORT sampled while toggling the alarm interrupt enable); the vendor
device tree for this board uses RK_PC6 with a pull-up. With the fix the alarm
IRQ fires at runtime and the RTC wakes the SoC from s2idle. Note that on this
board the resume itself can still stall later in the USB 2.0 host controllers
(a separate, unrelated issue being looked at); it does not affect this fix.

 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 145986695720..572b892e4066 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -189,7 +189,7 @@ &hdptxphy1 {
 
 &hym8563 {
 	interrupt-parent = <&gpio0>;
-	interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+	interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hym8563_int>;
 };
@@ -298,7 +298,7 @@ hdmi1_tx_on_h: hdmi1-tx-on-h {
 
 	hym8563 {
 		hym8563_int: hym8563-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 

base-commit: 1fc5a74b108fc90951890ec513ac81869f5eaff1
-- 
2.43.0

