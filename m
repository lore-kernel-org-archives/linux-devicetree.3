Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171701;
	b=M7wWjEGl1IOPIGuzH06g7IOm7qDzXJhpXP9o1Z0+TYTQlew9BtIRP+d4d5oCdhYO0s6v
	 tLWjJ7/6jj3fXD3l+RPcyCNvAFgfh+/XI+11G4ZKO9OWV1Nwzk2YumMN5EUw6NY9Yarh5
	 2xS47wxx+zFfFwJqlIcj0xLWVP0KgAzyK9TvVdTSZW5TUqODN4CQxmsIPplyx++J+MsFw
	 wLRlwNIx8M0QZbWx2Za+KHtOcfH6eOQSmIGfWABuMrynSlPYAAGm0AexBLb0pouy5+rkD
	 Dl3nQQNk1Yv0GkG3/YqXcHnjbcKYMh9WGnTUjagXTSD3Dx/DQn4lZn3MrwoMIuHUXAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=soyV8ujwdcUS92i+ptIIRwGgm+3063ycjFG8wPF9I2s=;
	b=SKwXiCCWOMCJIUdCachmydtd/2HEaiwrDYO+InW0jbV00PXROCFFQPzwLfuy0dbRNSUT
	 y0SK/pB4V8Cdpukl+cl1jazDGeHGlTiLWKHRrVCbkx5AwYWgRa29vVGX7TzCvHX6YGuEa
	 B+uTCxBEi+LbuQ7OFaiIF2Cn8mvT7d0U8VTsUu7QgmlRJ8AiXk1fzEtfJmPAtVV/OYZ2u
	 +5h6HoJle0AMsRePqfcu6dPQJQjPHbamx/FRt2aBLK4DKXHXMSgdICXZTn3UEjtab809q
	 y7XbZh0107DERATfdUTbVhiS52ISA0Oi3fOlCyupwkMM3DjFyEPHa3w+d0NSAJqoGNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=qcYWa6pF;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08134606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08134606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=qcYWa6pF
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e46e449e8so467688f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171699; x=1795776499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soyV8ujwdcUS92i+ptIIRwGgm+3063ycjFG8wPF9I2s=;
        b=qcYWa6pFopUoYmDr8OTyerWsbq/V9995CH2EVzxeuL/tJdnER+MAYqc0zPrVCv4p1S
         a68Fsv0EhGPdN2FJ8rYrtx0iUzH7Id2wxMEMH0fZbhlw6T+pnpTtYJ2DnLGQ3PNgGedO
         mNKkM+OulX8kOXKmLxOTLI5Xn+HLMc2f2KhLVhiYj5heG+qw4bbYvYg6m/YFBvi0QaKk
         A1gCu96AB57+1vHA+5FgCyXxV4YL2mZf7ID49AZiWA1YpXJTQHQtYI9eqjOVQ3k2WE3F
         RIHLQiWBVLYhXExwd1DPkGcZIhb/B5lXt35EyVTsS+SxJJJUwfEt/MXZXuIuN5RQwXKs
         87FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171699; x=1795776499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=soyV8ujwdcUS92i+ptIIRwGgm+3063ycjFG8wPF9I2s=;
        b=ILZEs9N2UA40pjnT/HyNq3bU30OYwtTSNQgfvLkvjLn/1Dex2EuDujGB/7NVLxZFvI
         TwlXbjNVVcVsxXlGuVjR/LiLIvHsSHUhg/9If/P0qTD+ga+qyOZ39iulnVKcqzTF59Lm
         bbMPvwB6pAqJbaHl3lO0bPX4/Sv7P9wg84mXTUQqQczE/2R+XZasXifRMN/81OiwZds6
         6GJ/KHr06XALu4JKTNoUdPJdxHN1nFuUK46pOFLCoDJn/QqLnM8ZofK/WSTr5s1x79AB
         LzLwQZijR07ypy8YWEjgc/mAjUvJbuWdMAGwV/9fR6TKdrXgc1PDmx9KdYfSIOUs5V9R
         GCew==
X-Gm-Message-State: APuU4Z8xp0yfTXH23tsUjwxerUrbmOU0cpjH3XUhYwBZcOoFrT5aMu3L
	bS6O/J5Htp/3K1An3e6RTxyAwvpRAQHsPLetYKxH8d1oTDedoflkr0ihQWpAu44GN1I=
X-Gm-Gg: AYBFou1klVluUD0weFnG8xohUDB5EBbGBJPKbmNB3jR/SIqxRETNr3u2Gll/M8HWHkP
	TfN7GoOpsDRDrIFKSF5UF6f0y8qSnvXIjgoUpsoQ7Jbb33nKHB/1bWN49p+q0q4DlykkhX87e6q
	t3GBxCtxByKVOBLKeX7bAViBi/yYiGaPm4yx+5fk98mvxLYz6ZSqrXxo/SJW5XO0qKonsYRQx+N
	6KzM20scqintYGRjveAjGTSDVSRwy9XzmH8jkeNVwIGnJVy0z5Tr5OoG8NTw3Mgcb9iQHSQA3nl
	CwsBCLjOOdJ80l9c3q0wXNzJT5RsrmI/IfplNTAxtv4UlG58RJMinrE6FHVpf0jmsKv54YiVQ9H
	OS39SXJfXZoJED2Y9UwNKNlBJbLrb7e8EN95cYp7M/+9VyeG+4z3aebVQ7h/QHucVihibzbrFU7
	M3VmNLTvhl5MJH9r14PaP+9B4PAaaV9QSiRfrpGVnu0r1F9XsWJd4qJbqlGv6EHlc9rRXAMlX9V
	Y3dVWtIQpb1NSMsVb092js3oZzsLYK4tsQZEoCdJq4PjGZtvnxgndceMcDA61qu2tdoR6FrMX7U
	94RZKTEiw/s5DUtoU2OGn6tji2E0JiNfOjKMlAgWzz2eUQpHNrZqOzqjCRO0L+HiYdf6QE5ib26
	vFY25nwHt
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr66087065e9.6.1795171699317;
        Fri, 20 Nov 2026 02:48:19 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:19 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:09 +0400
Subject: [PATCH 1/7] arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs
 by their ID
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
Message-Id: <20261120-rk3576-phys-v1-1-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=alchark@flipper.net;
 h=from:subject:message-id; bh=8iZDArBxSAUmGNv6IPTGJGDjztGubBmXvBlIYDN4D+g=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqOaGLDxxZU/I9L2m66UKdBJ6fbnlWCZ8ufqQ53iy2
 5OgF/+UOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqvuWMDH8Mb1WZb/I3251nW1YhNEub963Z6dUSbM9/akXO+b+pw57hvxPjw6w
 X3PNV3nFoci3Itdvq+6vOvOZp0ibVdRNk7gmt5AIA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Both NanoPi M5 GMACs connect to an RTL8211F PHY with its reset line in
the PHY node. With only the generic C22 compatible, an OS has to read the
PHY ID registers before it can bind a driver, and only that driver
releases the reset line. Unless an earlier boot stage has already
released it, the PHY stays in reset, never answers on MDIO, and neither
Ethernet port comes up. Booting straight from U-Boot SPL in Falcon mode
hits exactly that.

Name the PHY by its ID, so it binds without the ID read and comes out of
reset as it does. Name the node ethernet-phy@1 as well, as the Realtek
PHY binding the ID compatible selects requires.

Fixes: 96cbdfdd3ac2 ("arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index c84afecd6e2a..49bbef5730d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -802,8 +802,8 @@ rt5616: audio-codec@1b {
 };
 
 &mdio0 {
-	rgmii_phy0: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
 		interrupt-parent = <&gpio2>;
@@ -817,8 +817,8 @@ rgmii_phy0: phy@1 {
 };
 
 &mdio1 {
-	rgmii_phy1: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
 		interrupt-parent = <&gpio3>;

-- 
2.56.0

