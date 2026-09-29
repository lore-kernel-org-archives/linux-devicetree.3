Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DFC52E064
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690840; cv=none; b=R6qDwr3yXLVQoyIxV0Z9c7GIhCZg/8/6ddXn3QRQ5NIggVxlEoYkZI3Zjgh71S6aLWNGKGt+e95NmtRjF/UFVrzdys/RTxkC4B1nta+g05YfcMCAL2blZ5VzsCMlSQq/fpJevskBEIm6e8UqkCX9y5wFvG+wtDvUn/VgUUPrKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690840; c=relaxed/simple;
	bh=yNJm9rA62v9MpM3ToST3iGXEFOROWx+UkzYwEQFVslk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKmWD5c+dhT/GlQQEcWDJ/kG9ww7jUskRHlBOwBVjnKlhi7BJHafQ64LwZnYHE3POtY/4SIM/0UGmwQ44/OP+mvQVFtawHnCeOTkU2xdo554uYc8YSIToySYZpxXUy8u+T7swqvWhQE2lOZwrQ24fMjvyffBdh7DB0spKp22KKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sALH0gkb; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sALH0gkb"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso438666a12.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690839; x=1791295639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=;
        b=sALH0gkbc4rpwXCYFecuAY6zgc4p6x5wk5Oe7OXJcX4+8+mpXlhmoBSF+apwMSjtnJ
         eMxUfaTNB82/GChQ5B7yGZ693m0MAp1esyZc23pimHaxxMqKPkrkW1Q1D5tPDxs/C9Re
         0ErdT0E1W9+NyPZ39Nc0/jceCVbI4qy+kjQC+6sEx6UbVTZsE9nIoi3UHCR5s9+tJn2b
         e9SwxuRgrQ1Xe91hCOblON57yWkeWPrmwgLI8QWPpnMSKy3MjlfkYLdoMSwGUlSINDPL
         Ek+wuBhhMzSerm1S9wpuf6T3wU4w8mt+JSKrwUvFaCwxmWaO6WKOoKWV9mtNr7Nb/1tP
         IM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690839; x=1791295639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=;
        b=rozrXfAyEwo8t8gjrkEn17uRWirW/83H9ZZEjj7YNxFweui0M/mQ/R6ogcHwGxTEnr
         kzWIC+3RDgaqBNPY5pqiKLKSc6hBNF6dF6EVuNVXLHosyulsgbISj5+LPqgKiESu8UgB
         1lkMNF8mJNuP40cMkSHoALr3Z+ZqF2BwJN/cek/Z6PQyq4wYD9srhaEwLBnes3QGj7Lt
         WQKUGg/EYI1lsxOuo+C1b0bpNxc9x93CQxcnzTGiblPKN/yw50/7+BD58FtQ1SstNat4
         UGVkmhrTD2CYvx/4oWMyKDQzGVLtccxek6l4yYVORZeIGvRIpRRxys2S62GbxRHBfwop
         mEtA==
X-Forwarded-Encrypted: i=1; AKwUvBxaLTPuHdtYSmfl3SdfMLi4/29WCY/arMCjV6eDiZw+g9QCl+bVIBLpoo6x/9Kn5Tm/Y22kGgFeuyLE@vger.kernel.org
X-Gm-Message-State: AFuF++lgl+qBSqGKENfFW7jc0A7ThejYGhOhkOzZKm2hC2EZqH3rm6d5
	c/ylToHc1PVfhEj6ogLvv7PEnYnuGvb+S78D+lzlbSVrtjXjnVq+p+yT
X-Gm-Gg: AYBFou2lKnSFy8rNtUhfwXS75Sq7ChCP5Vmru0oX6UmiJZgsXXW/nnHE/0127r2SZEW
	k79d5vAiuFaQxcBWTUWZYyLD4yHKWm3M26Sq36gZ8W9mL7/aIx3VHrgzq0DbAZfsqwoZmpQ3mIK
	8zwx/qV8lIMYUFWQAti5JPLpdc5PWEwQo8oK4y0SgpfRPiFpIagL8ZYsBhSuEqG9XVdd+2APRL8
	ULuRiBE3I/DvgqFbyfPENa/WzXJ2RnfSX5uTIEePYwdaSUfQF3T1nLaXwLyaXTuvJydgItIkzF5
	CWz252I7OMshIGAYjKHdN6oP4at2mrzjYmOb4S4OlvRVRCe0VSR8tEitCzbEbAycfrtK3J+CiKN
	xjKVxamsh5b2c5+DEMJlOqZrqmFXXGTpYfilQfgZpKYX2o/InbJLKJl6Vuyw8bGfM6uCOCue4+o
	FOu1ISZ8T+liX+85k4tibu1TNqhi59HkAIihrCjBjb7Y4Z+2egDk9Lun2cSO7JW2g3sfMPNZvp7
	drCYGxwQD4=
X-Received: by 2002:a05:6a21:150d:b0:3de:6172:e340 with SMTP id adf61e73a8af0-3de7cf3ea13mr1897125637.38.1790690838628;
        Tue, 29 Sep 2026 07:07:18 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:18 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 29 Sep 2026 22:06:48 +0800
Message-ID: <20260929140649.55-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929140649.55-1-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 high while the system runs and low during
shutdown, before writing the RK808's shutdown bit. Mainline does not
describe GPIO1_D0 at all, so nothing drives it and the shutdown does not
stick. Describe it in the PMIC node, with the settle time the vendor
uses.

The BSP releases GPIO1_B5 in the same sequence, and in testing the board
came back up when that pin was still high as the shutdown bit was
written. Mainline describes GPIO1_B5 as the backlight enable GPIO.
pwm-backlight drives its enable GPIO low whenever it turns the backlight
off, including from its shutdown callback in device_shutdown(), which
runs before the PMIC's power-off prepare handler. That pin is therefore
left to the backlight.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..210e4cb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -327,6 +327,8 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3

