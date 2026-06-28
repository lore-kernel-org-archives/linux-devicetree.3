Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1579833343B
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782680182; cv=none; b=GxLpi7qGxp7NX4c4A2xGXXhCntsK4PzhDVB4RBy/3ZHsO539meSCqPk1NnrmLiX1+iRuUBvEB1+zQQlFw146PoMjVI+mygHYfhGdu6lwrzzSMtajjXK/HDc+WvD4S/OVq6NCCIoSIEne0IG7R9M1iQVypMC2rG0a83r9R2ZPdBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782680182; c=relaxed/simple;
	bh=I/uGtthAET1zDD+aWXG33eE0xJwbGBNamNrg8HbvBjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJhy5REPUu7rcopHJpKyovOwQSWdsF5+U7vw85LEey8Pqw++wWabwsQKx09NET0f9ZxlqNzEJ+pIP4sOyMCqV5exeNd5wcabQT/3BdGOYNbGkJ1S77r6+2su0B5HuMrZRxfIbTSMX3FMWYV+j7fWylSHrJxRsejY4ggXiuY0z98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IasWJfOu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IasWJfOu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4624c1409c9so1373633f8f.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680179; x=1783284979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYbNSlbXzmZdo+QTPpl+J2/pMoMtbvzd1t0gafKRqIs=;
        b=IasWJfOuz9gJ0VmGvvShK2BV/F0ktEcD/Xjc0hA445bE1aNUQyXjd0VY3jr/9MohyS
         4fWJBuKqjI1l7SwzxSWItdVEs8vTVjuIKl5o0hOGz7BAsEhYDxC8LO+8Il4KXraEuY67
         vmovhnb2WBS13OS5EsldDS3qTybfdZbhOt67l4UePwUuQYBri5BARJTUe4Q0ABN2HM5s
         uv/sYaX3lHpZls5osTyxepueecUTu+slYA1GFWFZ/+D4tmln2ds0jvfFSgET9LkpXUcJ
         mnojSxMZLFtfRYvqGQykdCl8t8zs2rBXTYWhqHdwDT5t/ZJH+zyYa+L1bZPZ2IzYnZb0
         5U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680179; x=1783284979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uYbNSlbXzmZdo+QTPpl+J2/pMoMtbvzd1t0gafKRqIs=;
        b=X58MAExQI24KBokp8ZdDN8MDkKTQAr1ARoX7jHypSjHma7VXaDHfVLB6GIBWlNSw4l
         DQqt7Kzv2sy+oyc7JqHtREGiYKlguUjV1sdbPX0jgdWSZtLoW9RvmQIsBjo+tSbM1UxL
         /mzu3NefFOyfbyLlpGMvNYOt6y3bLiY1AdYCO9vpn8G6NX71E7B3QsKaC2oahgf/FEOP
         kDJOQw9bvyvZ2v6Ma7QtOoO4CK7fqtG7CzKaDhisQwLrhvBsgLQHMjIURdRQ88HqxsgK
         CT2i0osommI7+d9KEhwsxpUil5OPlocrgsj2UTLJBgNwqJVXSfLzJTszndd2Z7HvTJ2M
         KhKA==
X-Forwarded-Encrypted: i=1; AHgh+Rr56zF0qs/XTW4qkw7s5fD0JQv6iLqHXhyf1Z8SNM2/oUI+nQgaXODGabho2IU97dObgddBLedke8/8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5JdJssJPPOIeu6qRRf/qY0LHtcg7iRdQTtFsDEI9gOLOr1jUi
	Z5HF5TG8fpRmgwzw+oUnOPD6WkyvRNJ0z2RrvVD3qz6JPlssP7EdJ1s9
X-Gm-Gg: AfdE7clReVwTvAThMlVcm2NsEJZv6bQO7lCaIqtPl36IVLFi5WoE1z5bf7NzCi7WviC
	kWikIVuw9PKkqEAeD07utqkn6V2GwqUryUfFOjpox6ZQaXlnDHMWqFTP/qEmi5blswPVH319W/h
	nCnNbVNUhH8nMKnAtidR30gC8GTgjJXXNPqXOoxnnS9yjoxgeTNzlMOoynl7jQ9pJ0sSyFg+rRy
	/FCu0CBxcD4GcpCKs6axHx3RyYRt80E8wokTvEAx6gdvL8lsqCyylFsge2fvRvkn3AKkeOVoM0b
	k+0qZLbPPyi0zM5IbSvODugBDIfSdPIpSK5oQje/fNhCGXpDdZQNnIKGvCzjCPiQhLbvVltnQ55
	K986D6IJetoQlHbbtu8q70pMna301kyrpAXKaw3Q0muxj4FIZKvKjzR0A+dJ718EkUDRZW/7vKX
	lv9bxPNwL+LlPJ7/bTtuRc/XDI9vyuLxauvqBKa7mCyWn478lWx2gn3MZBetnygaFKha1MXBacW
	yoUeV6ZyekMKToy+dKd1/nKqg==
X-Received: by 2002:a05:6000:2f83:b0:460:3233:beee with SMTP id ffacd0b85a97d-46fb9453004mr14202865f8f.42.1782680179266;
        Sun, 28 Jun 2026 13:56:19 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:18 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
Date: Sun, 28 Jun 2026 22:56:05 +0200
Message-ID: <4d1ba0d1b9bd4957224213cf17dca93392788e03.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Fix the Ethernet device tree description on the VAR-SOM-AM62P.

Enable the CPSW Ethernet controller and correct the Ethernet PHY
description by modelling the PHY power supply and adding the required
board-specific PHY properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Remove unused eth property

 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index fc5a3942cde0..ca2483a04b9d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -113,6 +113,15 @@ reg_3v3_phy: regulator-3v3-phy {
 		regulator-always-on;
 	};
 
+	reg_eth_phy_vdd: regulator-eth-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_eth_phy_vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&main_gpio0 46 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;
@@ -149,6 +158,7 @@ &audio_refclk1 {
 &cpsw3g {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii1>;
+	status = "okay";
 };
 
 &cpsw3g_mdio {
@@ -159,9 +169,9 @@ &cpsw3g_mdio {
 	cpsw3g_phy0: ethernet-phy@4 {
 		compatible = "ethernet-phy-id0283.bc30";
 		reg = <4>;
-		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <10000>;
-		reset-deassert-us = <100000>;
+		bootph-all;
+		enet-phy-lane-no-swap;
+		vdd-supply = <&reg_eth_phy_vdd>;
 	};
 };
 
-- 
2.47.3

