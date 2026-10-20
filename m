Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505023;
	b=Y44bj6E5gAAN5EAu6/Xok2V/GIIM4EknvTTMsHiLGSoQxF5/yjUjU/RN1KO+Se9TQyxf
	 xO+x+WISUMunojwfoE2otyPbXEV39qj6BVQpPUoBrlNCdEGyU4NfyXTYlWazg0DcCk7pA
	 ojjHiqF2dTY5kr/Z0dKkr+CgDqZeAQEiIT7P5FXK83379X9nv/RGZFzv1N4rq1cZxMyml
	 4qiXI4tTgmgXDPsfQ2sykzADFHGzY5hwoRuoemt67VeWZXxrxK2d08Rve/pkrMvEwBGEP
	 XLshVwkN+IG7c4hgbXf/758mIc0ED4wz8N0KOigB8w2vjS4twWlE4LbgRBy2DJuhBnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=QLuhPrpShgNIQIhRNY3yKLmujgc/2fxn208zMyK7FRb6Yh+U5JXw8ogeqjSfK24S+75x
	 VzowGeCslRe9v5BbY0knqGYEE5z4MZ+RRfZLkAD1VSqMdAWSbmcRbhQfXNNyT++D/J9U9
	 DVcfJZEj6Z24Aojgu4nVQ67yVxdRf5vnlQyXlZsswNKO2UpFVcJXqU9XxDXwYrFP7DCPk
	 w2mKMoVIUJlTVcKHsLwRKRSOjNj7UawsQ+TSs5JfKlidwP6AYCX1NIMH3egLgijzscg+A
	 PeE4NnagJ+8tiSM/H744fUTqpN1rSqHAOM991BSR/WwxLDKYWsuvz4ACjoKIcUupaIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HxiTvnzw;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94ED606A32F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94ED606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HxiTvnzw
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e7e742a2c7so4806745ad.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505022; x=1793109822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=HxiTvnzwxG+Z4/tTdOnOwEo8xP/vrYpSV/ydXWUaOzzfYJO4JbvQjoz+tRYAChzTer
         ng/yjkIsN1a3TTM+m0rF1GjAgsXiuLexHYpXDp5idwUUpOFBdAzDxnDHgzZfp8D++0hF
         HYO+pkonW4yvEBkVQLX7zIIr4+mXlCMkVxJQ8FU/U77fJI+/j4F5SaS8lPHhNih2P739
         QL5wRnRARdX6cPYCKl1M5WhN+YbZeXZsumdMO4JbxlnddpcMckbBmzoFRMpb5QQxD0Qb
         PSpkTQYqydF70T2kwmyVfOBGMd9uLipAGCajKgfCNBX2SxWObutrdrD281Kwo3Gl/xeK
         +c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505022; x=1793109822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=0HpdQaYsSHU5aBWACjrZWyFFjDu58cjmnqHp2kDYMoMFslN6DmhbcuRtK4PET2ZA6s
         VShUMs5IVo2Z/V0dTW50O7zVrdxxQSoaGZDsgvF1qe1UuSdGSKWTD9IJrdpD39dmNBgm
         ogFLSruofASDABdJE04T2w8rDgLs7h0nwVJDoKc3AvBIE0CmTO0hFp8apG2GmqLYhRQV
         KvIJ5pLRaKHzLf4v0TDz1pRAzlc+/92GkUInKlwpSWK+77d8/9QOkM8OiBAY067olkOL
         BWU/RIElEootXU8mpf7peLa9yo7GDAHfsiD92FG7o5/ZSTZweN/CuEttljcLlghh1UYy
         S06Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7A4XNdg8ZZyRhNQg2cG3vpqRMiGNjW9sruwoaIGJZ5UZHbgwyW2oyyYvT+rpQQO3HJHA0zLoIwLV+@vger.kernel.org
X-Gm-Message-State: AFq9FYJlOwSxypUyw1aUqfCHzG0/t/PwCtkScnHFtJ+8hEg9Hj1rNCXe
	KagRo+0jA1BylMg4cY7KlHFHS8sT9quPyYIwaJUe0Rrrdg/h2UKDmuhi
X-Gm-Gg: AYBFou39dO8zjHw0OwFXAnqrOaf4dxxoSyl+DseXXKl04wTAhKt/WSKp1N712kk/szG
	RWyPlxLZCWBi+puML4UTK5Byw7/K4F7l5ZAVrTXXcIETt01yXqkp75FKsc9+vnCwIF6BhAvwfAC
	kc0+YZubzYMB35G5OlWu7XhO6tV2S4/eE+lDQYSplhrdHz2FqrUytAofvK1ddpHcGlWbs0CcrCq
	EfGbZ8N6/3IUiplf05iGe0aNUhGb5kzX2oAnp82rEtD5gcVDKt2mey3pxh1kAsW4jFOUsp2LZhQ
	vFRr4WyYBFSyPgrp9M9ibyvkGxmfVa7hezrX9qDmPralN4W+rhhHjI28DJm7DJX6uqaw2gZvwSg
	FgeiYbLqAWgYb6jca0szJNyFiP+gh5fxPz7vPMkSVBEU8QW283XLhW+Hj5QV2WPChO4TWCCAzpK
	JRtCeaA2TA86KsXRUF2mo5vdDVctTLlWacRH/EkfpDhsJ21rXXf8LFuW61L1n30Z/3KPb54fa6l
	4ly1F05jYQ=
X-Received: by 2002:a17:902:ecce:b0:2df:34c0:72fe with SMTP id d9443c01a7336-2ea1dd670d2mr14819585ad.35.1792505021811;
        Tue, 20 Oct 2026 07:03:41 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:41 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 20 Oct 2026 22:01:14 +0800
Message-ID: <20261020140127.720-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261020140127.720-1-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
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

