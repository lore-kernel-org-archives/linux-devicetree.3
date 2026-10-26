Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036923;
	b=r13HVgXn/rz4932panllu6qQThNb6VX4h3p3XuYoMz2HL/1+3HyhbXFwD0z1FABEE6A2
	 B1P4Py6p3bntDg+NBDqaqsMcAagJrpJCp0RhC0SNWZliJ86dMU/k3icKEEDxsaHI8MhFl
	 LqXEaQRxWz3hJKyNqUzgBAPCR6xS+pTp6Tx0o01/96jlGhMRiaoyrDeJlLbDcUBcX4tjE
	 OUfqFNtPcmtQacwSL/5Ixgj9eElNyYVYHmW3LjzlGbyt8E2E8FUDz/mMplONCbf2ENF4m
	 HGJBfdxUE0wLmNw+gp051Fc1GdPdh5b+TsJnDe00Z11QUsNyeeEE9FO2mlc6NQ6fMJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N9zgC4CWhJeh+seFqtnSsLa173CrHxMnNgtBBhqSpwE=;
	b=KTYU2zFNwEhvyBB9q75kGjdFpqVMGTq+tWO23AJKpL+t/06sTMpaydVHbaxk2E+xmR6A
	 pv9Ionj9dbYbitCujvZGnwkwDtxankJ5+jZctiSflOyULQcupkKdcB5Z/BL/bR631nrpC
	 T37xbnBydQgSn49+WX5JPmz3oNVjDYGsemUjobq0a6KnrB9/tTCc0j92tNdQrQn6Qz+In
	 AqWsMfsO2xz9Yj42FYzMMvfPy+rI51BpaO/UUHY35I1eZ6S4KHy8sBQ8npVBbTmtnaZZW
	 uLwdr9oVMSpnvrb/Xgzx0O0BP736GYARcAbJoQdXOQ3o60q07V2B32ie9U4iySvjeLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gxF6lqeT;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60808606A325
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 17:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60808606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gxF6lqeT
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a71d0c4233so1313192fac.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793036922; x=1793641722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9zgC4CWhJeh+seFqtnSsLa173CrHxMnNgtBBhqSpwE=;
        b=gxF6lqeT4gVf/xUNIUhq3UUvwoXlNR25sMn5zwwYBwbrBUnnnXOmGYJg9VyCzTArUd
         CdZ/15/j48lSxCW9snXHOITpJzAs1hfC2eMc+3TUbE4Wi5IEq0bE1j4wmGEvTwdxiiWS
         hEiikpsMWT5UlNT/SIgHFqI4Hr+aB2miIGH012NARK2kkMh6uezWhi9ViNyE0sh+HZTm
         ujfchaSzBCL7Lh8YZeNxodcABuGBEIHZX4QcYNiMxJRWX0kY5b74nAASA0ZOwH6Y2ns4
         MCvPaSMprRjpACBJbt+L+75jKwkmx22yiQKb3uSY5+DWGvg83xadQV/iw+aSI2Qbkfbu
         yjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036922; x=1793641722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N9zgC4CWhJeh+seFqtnSsLa173CrHxMnNgtBBhqSpwE=;
        b=LZi4Pp7IdDulRvqdrYZmsQRVKNSeLPANAQTFLTwZSWeQD3WaJwCGQ9DwgFFElzlbVJ
         r73uIuLua2HeZp+H9SKwdmt16YCz+dI2fRLVNC/iQ9ZcjmEAjq+YC/ZFXVbhisFFejYp
         U5pD4CZYfJ0dyLpgyHbnwz/WaJAcIY1T1KHJDB1jg9eKnpE355jmRId8cLNsZW++qkXU
         dtmKN6hV7h/tkNknv8YcfZadUHJnaASVTdH9ppBVSY4jXwClm1qECoJ4eaQpzUJ147g7
         63MUaWd1Tg16l7xi/H6EX498yRVGNjfACCJ0futZa+xAa+gf7st89iA712MtR3zVc+7+
         QRMg==
X-Forwarded-Encrypted: i=1; AKwUvBwwWZSGvdXzB+B8OgmO3BjT49G8j+KfabyoxNgc3y8jWnGepKKTOUzrhSrUlxAt/1u8SfqKjXYxsR8R@vger.kernel.org
X-Gm-Message-State: AFq9FYJZJY/FAhGKbCfUoQA9P3ozjjBbuaurOs2TZLM14HG9x4ZtfZ0A
	LtlrmgeXCNJTEVN+H3BxP8BMT+QCawr6SAy12GnIhDu9DcL2+lAUmvCT
X-Gm-Gg: AYBFou1Q5zDMn6pD6e2lWZJXubhRaV3adZnEMs4QqZ04V2l453aUSWspBMrsltQjQjd
	z5w0j4hGFTfFtYCyirx53+l+MDYcYnJt0fUj4Pahrjkcss+MY2jvjzQfotNvlaQbBJ+fM7WO4bJ
	QqPeBnE53jwmGF5PlJ0tNP/Cnr94P3StznCmTaBdqplnHq4NH3w8nNv0LxU37PvEUHrUx4SVAe5
	/RI6sE6Z48ziqjW33ReuIgekOzlx/969pewPHUaSiNffVK7LzkzP7JvnmODxGf3iLVmMW2RlBCh
	juBOXut0jFb65lUwx1ar8ApAxkWxhZdL1caqFBCdrQ8MnGzG0r5/dqo+SjD+haUKUJ+kuowxWYf
	HGATegy5UShM1PVH9qJDS38DVinMlp+MN23hInt/T72LnCmxUoYSKE77FJPm5Of0AyosCcMR6W4
	Xp5pA/t05k4AZ92mPQS95ZgKgTAqwy+e4JtKdwruFJtP6+L3+Y95itOq8DWzv+5zTZ3sfJHZA2q
	aI5aHqbOluuMiHAbPrzjGI3YD+NtPj2iQNM48z0cn8wiZ82TwW/Ge/hDGVJEuPKvWJuyz86ogdM
	r0PVh0t/rZLgT/Ogp+x0sU+Jx/wxLA==
X-Received: by 2002:a05:6870:4ccc:b0:4a7:9509:a937 with SMTP id 586e51a60fabf-4a83f63d5d7mr4284004fac.56.1793036922304;
        Mon, 26 Oct 2026 10:48:42 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a842e89e33sm5034753fac.1.2026.10.26.10.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:48:41 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-pm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	maccraft123mc@gmail.com,
	zhangqing@rock-chips.com,
	zyw@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lee@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Zetarancio <zetarancio@users.noreply.github.com>
Subject: [PATCH 5/5] power: supply: rk817-charger: Clear SYS_CAN_SD register by default
Date: Mon, 26 Oct 2026 12:48:34 -0500
Message-ID: <20261026174834.1652309-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026174834.1652309-1-macroalpha82@gmail.com>
References: <20261026174834.1652309-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The BSP driver for the rk817 charger by default sets the SYS_CAN_SD
register unless a specific attribute is set in the device tree. This
register tells the PMIC that the system voltage can be shut down in
battery off mode.

Though the BSP sets this value by default, it also has a device tree
value to override it.

When this value is not set, it can result in a persistent power
drain while the device is off, as observed by users.

Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK817")
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Suggested-by: Zetarancio <zetarancio@users.noreply.github.com>
---
 drivers/power/supply/rk817_charger.c | 9 +++++++++
 include/linux/mfd/rk808.h            | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index b6714d8e4fed..6971f572c68d 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -1148,6 +1148,15 @@ static int rk817_battery_init(struct rk817_charger *charger,
 	regmap_write_bits(rk808->regmap, RK817_PMIC_CHRG_IN, RK817_USB_ILIM_EN,
 			  (0x01 << 3));
 
+	/*
+	 * Shutdown the system voltage in bat_off mode, unless
+	 * gate-function-disable is set.
+	 */
+	if (!device_property_read_bool(charger->dev,
+				       "rockchip,gate-function-disable"))
+		regmap_clear_bits(rk808->regmap,
+				  RK817_PMIC_CHRG_TERM, RK817_SYS_CAN_SD);
+
 	return 0;
 }
 
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 72419d311626..2bc58de53d82 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1297,6 +1297,7 @@ enum rk809_reg_id {
 #define RK817_USB_ILIM_EN		(0x01 << 3)
 #define RK817_USB_ILIM_SEL		(0x07 << 0)
 #define RK817_PMIC_CHRG_TERM		0xe6
+#define RK817_SYS_CAN_SD		(0x01 << 7)
 #define RK817_CHRG_TERM_ANA_DIG		(0x01 << 2)
 #define RK817_CHRG_TERM_ANA_SEL		(0x03 << 0)
 #define RK817_CHRG_EN			(0x01 << 6)
-- 
2.53.0

