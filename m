Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171712;
	b=Ie6D8OwZ2mJ0hZQWV3URLiPSAeiIKfHSHoIHixYh6XTHcmUbiBytQ8lFvuden+NxnFdM
	 D739DP/hoUbAKSmKyGe7dNlcy6wneVy9auKJ0YNozDRBVZ/HUAuxkbdeOG5I2tGx3rvKq
	 LkX14k3ofXzCq8DUECiL8V1zE6hfnK+ZW66Frrg84eH15m5tI7VKCynx19lqufGm5t8Vs
	 yzPAMo6dhgpOI4Nvc5Qjx1Yr29IQ8ulp8EGm+gBXvYc5dNE66ZrtzUuFdBggZ0mlNW6bx
	 1c+pxyQroMYtxEFQoBrBZ/al/FZOoo619AXJHxt0Vpw+NS1GCaRazLEV1n6GJCEtBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SSya2n1vOn3uoQkwXT1G4lqjvii6kin5nIUMHVd2ZFc=;
	b=RcwdFQyEbEzBnoAsyTr3GXAR4+yYUpd1Mj+nPsf81FtMHaJyTEqGo4TQgUxf27ILm8jw
	 797W3CLInt8Uw508CROMUYj1t/1flyc1iP9399cfParLqfRoEafUlQeENp8caIUnOOLVT
	 B7czw4daAEt6NW8GVm8rHt9ekGzOFCGSThHpMuaciQphkSrpfpPPVSdKl0uWnhePM4QhB
	 yJhh26pX8fnOs0ByntZnnarKC+EZ0yIh6fDXHfkRrOVFRpRGmrin+JsxCoTocQfcF1EZz
	 jk90bPUy/HE5DN/0Ra5oPbc+2y0/tcmk9EuimcBu5LUEP678pBwmuJfEq6kyZA15yAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=s5+4XROj;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B099A606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B099A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=s5+4XROj
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso457447f8f.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171710; x=1795776510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSya2n1vOn3uoQkwXT1G4lqjvii6kin5nIUMHVd2ZFc=;
        b=s5+4XROj6LPRoJVLtCWsqgmwcQQreM0WSx6OENoEPfvkfsJnjwjLQm7rNWSYCjlBsv
         ct1yHBizo3VC94WU0nIrGZbWUJ1P2WOawcoSfywUM/N4Tnct6NAa8bV6jtICDpWkPcWz
         rFKeMXFHDGMYpZMEe63lnTX9+FuOZ9ehdHCTKl8uYLJjXDWx5u5QywlSFFogFiPoS/TN
         BshIkn89u8/2d76B/ah2gSbmzfy/iHk6H5sdPYc3Rc4q6e4cclThdk6kxF63c18rREl2
         vmWlnL/W8GSoHO/mDVNscs4hDHLFD0Jkj3eDcAymJOFmIm2DdGjnhSYV5/+j/yYFgal8
         CUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171710; x=1795776510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSya2n1vOn3uoQkwXT1G4lqjvii6kin5nIUMHVd2ZFc=;
        b=0OIj32GyziVQ9RFJu+EgoxlPgzOg1pKpFUJCY5tWYvc2133FyPrO1usCp68/N4DI+H
         FOewa/SZjQDyWiaOKNnJzFd4/3gwh0GpP1Qv88ZXARS8SYCRVrvGzpO3suWi7RhzAdZN
         xJUl49VDGtA0nVRWy24UlM0NSXQ3IVFZzCzfN5a51wJP0nda9sKcRPvcy4QMr2cr3E3C
         wt+WKAjILJSVc2p2VHgH5PJnQlqnC2njhDwm8NFTTqrqCBRKrHVXnZUx2csVOjO1hu8a
         Q97i1OiKMaet4duxVbU1rKImtise2zIRIsTFGHtwLxBeOb3s6rCEDz8bIQpjXoaddRmN
         +bJQ==
X-Gm-Message-State: APuU4Z8/N4Sp6GX2ZSlU0hnur6u+2dH2N3QVXzBa7ucEAcNYzVtJ1NiP
	nE0LYcvmkF/BB25qmVBNzhE7RaS94PcSaIjRKig6+sE82tCkOBmSUQocucOHPhaojcY=
X-Gm-Gg: AYBFou3x93UXjbwMiaJARIQhtV4QeWNGmrU8kHLOz6VOREQj0LDKxyMmj12LgDkLe1h
	w8SZYzRGCO2EIzX0t78GD+ZFZmo8KgMRzjz7Rz8148lh3HMJAp4MoS/35wcRv6sIQGBlUjnsZDu
	0TVm6H+ikb34br8vI6b8WKiCGWg/tb3vm2RGdqaDkQ2CEKHbbh4gQErtt8Of2s6kEyBbHnVsBAv
	5Pr6iNx9gyr6+16I/6fAd3wR4OQULmIZYKQ9ZCT+1tMSzs+WqIIrRm+Oq1lqygGQb7vQaU9faNE
	mFO0h7LBV2QANikKpDNsll2/m74q212ZSol2c58eIjODCxPHsGFbQRGKfryl7+qpYUX2+aN1j7X
	6CqABghzyr2f38yppP6CkCYN48OkKLzNm/QwJqxx36jLaOq6gyEInHM/e4j/BAA4OQkmo40v8qB
	DowzrTavqLvX9ANLMkcRAz782pclsd+nT06zqupJwoEihcx7HE/ps1k47JEj9KR2f02T4y4TpwB
	hL7HboAqGmBW8lCsN4dXvpMgvID7czqK3qqfNuMtQ8q1Jc7q6syaGN0VNMUiey9gghwVTOpChY7
	VcywiOOXsPP2Zpw/d+t+1h7Ash+xfPkuyXyO3XcZUIaPk5V4WagmmyVGoYTOwhO/5tYsl9IlEjm
	4haOPcuuU
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr65663905e9.0.1795171710109;
        Fri, 20 Nov 2026 02:48:30 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:29 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:14 +0400
Subject: [PATCH 6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY
 reset to datasheet timing
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
Message-Id: <20261120-rk3576-phys-v1-6-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=alchark@flipper.net;
 h=from:subject:message-id; bh=uW1NJdgYTHTE7LDSMq7O/aHv2OipTZNfjjFmlRp5Erk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqObumam5fa2bzv9iOYfkf4cO9HO6X7/D8a78/loBv
 TN/GYM2dUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVlgmMDPNs1zbPSbk7fdGiZRs5X/9Ztj/vbJvmE7PZkQU3PF9uu+/LyHDgI4v
 m1Iq61/tSNnvvjxUNXrCvqJ5dPbN75eyyUw65whwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Use the RTL8211F datasheet minimums for the PHY reset: hold PHYRSTB low
for 10ms, then wait 30ms before the first register access (Rev. 1.1,
section 7.17). With 20ms/100ms every reset of a PHY keeps its port from
coming up for 80ms longer than the PHY needs.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 638e00b6e165..3444198b6cf6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -809,8 +809,8 @@ rgmii_phy0: ethernet-phy@1 {
 		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac0_int>, <&gmac0_rst>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
 		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
 		realtek,aldps-enable;
 	};
@@ -824,8 +824,8 @@ rgmii_phy1: ethernet-phy@1 {
 		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac1_int>, <&gmac1_rst>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <30000>;
 		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
 		realtek,aldps-enable;
 	};

-- 
2.56.0

