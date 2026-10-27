Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090757;
	b=QxpKS4NB3bgHkRAjL+CSmE9QYLfFhI99KuPdvYgkVqnbeYou13Ek8qois45Dkp0JEsoS
	 fhnIPt8PgRq22kAW0JRntavMJ1J90MVvk3gdIsroJVXYExpsikGb7YvcBykNvawHVqvBz
	 W6+btNinuQjPBK1X+QwxFUzOruoZ2+zhvTU00jERS+0UrxVyFdrv9JTV5JJazLJUmBs6L
	 UYTsM1fojdk4SKSV4gxCfoSOgxUOxVh/Y03bHTzHaE/JCHbpYt+LWKv94m68xlqEJoZrZ
	 PXnNQLUcE6rSjWpmryTsPiYZO722N7l7nD+F26Fve5L7k6Q8aw4nU+7+4tBWu9U0PWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=vwbJ+4WjlDAQtHGeUyhSv4dRVjCrog6bXvyE1Auz7Zl1wDO5/QfCFHc/oSo06Ka1fGP/
	 LMCaDKe6mXUr8RjmZDXGNbK0ZmTVej4ZuKrrfdkFAGosIvCvVLm9TlcTdeNa8A/g+Y/2L
	 cK1sE0eY7wh6OIrsGIemcdmzqvAl77Hl3pogA6VoeB4yWDbG+i+MVxPqsLHK0MxH/Dsf0
	 KvlpWll0afY+dtsKZTBOuT5JWlxaEh2QHqQ/AlWn9/5MGwequ141pzySAwWeXbC0c+ad6
	 Mr3ijN3VciNTvKZNn2a8KX5BRzkpyAvFntb5rvJ7yXcEQqtjIWFbCriCOiU2t+gtv6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mjQcrcv0;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F55606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F55606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mjQcrcv0
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso1344721b3a.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090756; x=1793695556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=mjQcrcv0zqwIVdk3DgRkBpMbLX3iyPKlyLrfzbTjC0Itrdc9QqJXlIF5+Y2PG35ZOA
         FOY+JY1Tp+/hLwHzaa5yPq39tEpxCPxAgEGMP3pedI6n7nJImKcG/IPzx80z0dFlikRB
         vVDsFMotHgUtDe4Q1/uqPQe5Pr6An6ckfZy7mFMnyRQH9Url5Nn6yEFixX7D0HbgRoEP
         cYnXycIorMr26/GHofqKVN/rpFKXZctXn/rajXF+nmFNgJOa3uKk/TPBvv7UXzNr5ZBN
         B1e0g/EeprlYMY9C+4AEnUPcaz6+4ZHPmrzOvRf0b8CDh1O57DvBobxbaJdrx3h/DgwT
         WExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090756; x=1793695556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=pJm+b0anxLXJvYur8ntUPuvvr5r4YLHCsFUjjmmd1eQImAOets6qXX41E6R4gTGqxJ
         3v85DxXDTKrxY1OSgnBugSXMvNKLlTbEk07PQAYSnGNGLqwg4MwncBCZSM4kGIx4q2fW
         nnQNj9Z3lnVvDD+9KgYsIwiv9czqvVH1wWKyw7gD4QaKWwubVs/q/E+z676d4h9Eo5+s
         oCxcKLec/V69R1b7HXh97wrpmR4G3B+Xpu8rLwb/WcNiqNdcfNAnFHkYloB3fjkKcX6G
         zSknV/7eSnH+YgruE1hepf5PmFTadXspyDf4MhX0obpm4ECp9ZuP1qNN6zJFUYlWTX+s
         ljaA==
X-Forwarded-Encrypted: i=1; AKwUvBxaGsrCI6Yg5qqCSt3FfOR2WGGp0SUXxItBGW7RoNnABx3ROxlclmjaQx+nyhVrnONicsEbp1t26GT6@vger.kernel.org
X-Gm-Message-State: AFq9FYJy1PLk7wL0X6zfkjigGRa3rrRsDi0qnxIuPEP8WjXA8Hik+bev
	aQlWUq3NJb5t6i43ak7XJVGNLqjdUGZKOb7u8KRolDskuzV0YazVXKhx
X-Gm-Gg: AYBFou1EZsxjO2dat7KXeev7XKdKie7Sg6X+nY+gWwwulE4x1c65LERMb1mlUaDKdLc
	90SWpRyakeLLxGqnm1BlEa857RhroLwc7aPGNviuA1mz7amBSDBNMgPEI0R67+zy32tOciUKjJE
	YhF8BvYgWzRM0fBKPcHL0zWeOqstqUOnB9dulfJSwfQODsGH5viQ3B12Ssh/4TuaYg2AcJ2HAjY
	UQzjmdettVNFlsu9GReyTOJdq3rVE3JA8eR/DNWpwNxdw/ccaMSjNDGZkTM6jSjC9rQtGavMVdA
	Ta9zNP+HCbVnyMMQcCvSecZBcyeguKWwBRO2i5e76rEI42YSaaIO3y70upM7dkQBMCfTEdm7DKy
	l9UmzMHlsP7MWs6VHLcPWA4gOj0mvrgUDRa0dlYCDpTxOAz4mVvrH47+HG/X9v3h9ypQjBnkzB6
	cZrj2s67S1sJiLn2raXIyUdPxNBJbSjM8/YqX7q3BsWOTu8a4tQFrRtNgNaDjQl4sw+x5YsZH3w
	ezMFO8czHap7Ro6nntmBMlLi6V0b4DJuxcbVNB5Sa68mlQtsFArrwhLOdFFVdCMg+HM7lK7ZxS5
	Ke15/yvhpZMFDt8ZmKeHafesTcDldbR+OFO71+MtnFQ=
X-Received: by 2002:a05:6a21:4591:b0:3e2:8c70:6d13 with SMTP id adf61e73a8af0-3e7cd51a7a5mr7982940637.71.1793090755759;
        Tue, 27 Oct 2026 01:45:55 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:55 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 27 Oct 2026 16:45:09 +0800
Message-ID: <20261027084511.1992-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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
runs before the PMIC's power-off prepare handler. When pwm-backlight is
not bound, nothing claims the pin; on this board it is then an input
reading low, which also lets the shutdown stick, although that is not
guaranteed on every board. The pin is therefore left to the backlight.

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

