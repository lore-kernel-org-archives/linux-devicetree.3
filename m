Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171705;
	b=xuBym9kuXZRWYnCejQjpwj3zIY4KNqOWyXX+8uQQTKsqDdxWMWDLpTvSUXMXD1tihaqE
	 asHWKD+u8xsAVc9w4vPznvty0v7YJgvELO78/9VCCqzklfxoqoFE7OhCiRlOZFrCnUShF
	 mNxO5mHtQPKCqdCjSjLny7Jm/paoDBA2JYc1q0rQawrylSFRnAXSJHYMSvbd3IL8zin4Q
	 AmN7vtuIihkhdX/2Z//OsymaYO2Lq5iapV+4aDRDt+pYmQEKOqpz/dED/QCh6GxA3YDNz
	 nDRSBSKw6uwRtSKRlvZhVbsC5FrT3sdMnqnYlseqFQuVfLvnCgZ+IO8j+cmxZjA08bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uv7rVZc4l2BEJWjfYhOWW8q9b0czaroyJ+vHsktb+9w=;
	b=GSZ1/yYZ9lZV+x9Bg4Yadj8h0v0/zjH39LY9JEX1VQokfyrB0MHRGQpuIH+McftZ2FPk
	 jlIO4VN25UO82NYnBbxqgvZzZE9HJGnzqd9oZG2+rrVQyoKu+tal7WKW0WAxqqdqmkgBM
	 uRQb9vimUgxvO4pb3k0zgXTEZsoEZ4cYJFcQFjwjBuVELQqwa2rlz0hXlEOcvI4JogAS1
	 ho+ZX6wGYte7SKxLTgB3k6Zp93y+lGt5kV5FxmBGb7KgT60tVR2r6dDjkEk40QLYGfOMM
	 ++jkcfAIzQM7uGqd6Hf7Wa9zjbb0Rf925qYhWO+kmkSzb1d9UGMlaLs93k3OO21A3AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ASvEOtZt;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68780606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68780606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ASvEOtZt
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so3800665e9.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171704; x=1795776504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uv7rVZc4l2BEJWjfYhOWW8q9b0czaroyJ+vHsktb+9w=;
        b=ASvEOtZtWJ0BqqihkMuNr8WWO1RdaLISu/pTWWuaem00QnfoyPMMmTaOLUimo6j4N/
         GgH6iVydrqtvKUiy0G7TLRTk855MVgPVeN8KQKc5wIBlJ7xxUpeOmfS091NwWc7lloDo
         JJwYtRhxUCdyAWlYdTlpUO6m3SZGAFHFqYV2EBiSigQnurC2kgGt8rPwvE+VS/UDR+AN
         KUJkwkV7fmMVdbt+Z2YjYXVXJpIHpnGRMBGAdMA03ZbwGrj9zHNLpjs9oNgmWcmA7Nde
         865HejyhDaGAOu6qZddkfS9Crk22eWjC9mHZS9N+SFLlb3p56ivvFBjfa0vijElFBnRS
         mvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171704; x=1795776504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uv7rVZc4l2BEJWjfYhOWW8q9b0czaroyJ+vHsktb+9w=;
        b=XaKCAHruSr+3MEvuVzXdhZ1aBE784N7mWmvJHcX+wdzbhVDNhgLH+GSO/bbxvSamaS
         C6wG/YUIxle5JbEKoSQ0V2RRykHEYA5L0EyKOyOjfUKkIYirqGxXfPxv/3VbyjGeTgcN
         p1fx3DAHL5f1/OUwSQdmqO00nTuMOg11T2tCb2LnoC6y5ISWn2v4x7a0AmO9PKwI2XI8
         84Q7xhhUe/iDICT1lqBgFdPqnB8G0N2wTYKo2ZyaHoUTi8LycryeG/u3EiAfMJS/G+iv
         pSYM5y3meW5zzgKyX2q/wmVFohwGZOs2ArtYsFMPtdKVLdz8BwJTyBZwVp/7IT3makte
         oByw==
X-Gm-Message-State: APuU4Z/v/y18Wytmc07iTn2KqRac6inWVq8ql1ZH6kPvWYj0sgjkscN5
	l7Y2tzBS8rQQhYVDOqi45fWA8gHUE9gpOxPZfpYjT7MxJ1QPRbAHjrGe8NaKQKTl7VE=
X-Gm-Gg: AYBFou1wT8ujFvpu5TOl+ueLvV8xF0pxLkZ/bM9p69/1DlXxlguZ/Y/51ldhASs2Lum
	PkLGVQxeU6vM9MUZ8BYufXKolQNci80mSrCedzhHqMxa2196LjNu3CQ+ZvDAnt7BHlwgkdrg/Wp
	HaIqX3A6EWjlu4rQjq87QqtsXpeR7TL6tBGdxE1W7hb9TI1ChOjGlAc05bS8a+i69l6iyVvI8Wb
	7fizBMrppGoH7KLp8O2IQlal8B9g6Ll2JRR+6Zan9SBJwShqqwwWSHC/jM9DzeyG+drHFX6xADy
	OLUURBlIWVQWQAeDze6w2zzgdfSFbbky/TG/8OZu1dCTWN3IvzasJ8NuuxZi5LUJWpFl7nZ9XPl
	vICA4RPOSUdybfFTiEwmHWfuYMkYE1t94nTCArdMbvLtgNnBp70JAj+u79tCUMxc9d5HAstdh+j
	DFmLWi0mQr4YRACWTE/7pFDqgGj0Ua2yLoCYGd34w/StXohMXMieoU8b2Ph2FRU1MK7sbodRk4Y
	tYlqRAaggNTagl2tcmY6m6RZSnqQCynn1tZ/jPg5h4M+gcKIMQ0qgBcX2/ycPi8I7+Ogj2XjtSx
	0X/Useksd2e9swWNUkEHeqs0wIvhsJHHihliWCyFx6ii+orPpIcqmdLZcRvr02zwx1USf/dSOnI
	Uk+S+XWb2rYlvBXU9PFxeZTDpb1yIhA==
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr53057695e9.14.1795171703610;
        Fri, 20 Nov 2026 02:48:23 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:23 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:11 +0400
Subject: [PATCH 3/7] arm64: dts: rockchip: Drop NanoPi M5 PHY reference
 clocks
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rk3576-phys-v1-3-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=alchark@flipper.net;
 h=from:subject:message-id; bh=5qT6I0fyxu/KWGFadssYTHPy5IComESd8JDoC1h/QDg=;
 b=kA0DAAoWsqLYjxBZ1KUByyZiAGsAJW2gyaWdTUQhJ45E0zow6TH0ZQMhhzZW7bte5h/v9dF43
 IiRBAAWCgA5FiEEnfakPZUyDpq6SEj1sqLYjxBZ1KUFAmsAJW0bFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJELKi2I8QWdSlK94BAPQ3kqGcbzUlhw4XuafSmIBE+T4TPflywMkR+EONaWF
 hAP4kxZJpaSjPBy3yWYacO2N4ASKF9wtaQl248+2S22unDQ==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Each NanoPi M5 RTL8211F runs from its own 25MHz crystal (X12, X13), and
the SoC's REFCLKO25M outputs reach neither PHY. Remove the clocks the
PHY nodes claim from the SoC, so nothing enables an output that drives
no PHY.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 49bbef5730d2..778cb8181639 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -805,7 +805,6 @@ &mdio0 {
 	rgmii_phy0: ethernet-phy@1 {
 		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
-		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
@@ -820,7 +819,6 @@ &mdio1 {
 	rgmii_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
-		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";

-- 
2.56.0

