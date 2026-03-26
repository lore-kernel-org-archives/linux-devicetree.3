Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14B53BB9F4
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516255; cv=none; b=L6w6fTnCDy68b1ns6Wlei2Gf+AjCX/dJtq2z4tEVO4vOAVE7IZ3C5zzeLul1wF25k2uWA0AzYA39a+s97Mf+EJpYfgN2gkFFwQSBWSGw/fdIRZlxbV7M+SzZA2Ra6FgtEn2HzSnqnSZ9pkROkbj40C6hb0+2rjuk4pqtWwjIQrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516255; c=relaxed/simple;
	bh=8+8i3aomOLS8R8b5sollZ2ZiFAWOT1uHJtt2Q7PXFp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVCF+LvtvAgM6es7P6ShmQ4E44PeYBl8Td+KEpSPMGTq1BTjeJ2v4+O98tZszJJot3hDfFb8Vk46K77PGf+s4G+TVV54ZOPlUvs+fcZMjSgZQbKqplhpG3xpX0mOUoxzSHK2kroH1YirIaOwmt5K3IX1zYzZHxOEUC7qGK0f3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK67c333; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK67c333"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b983bb07eso92185f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774516252; x=1775121052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDIt8ynlMPPK0wzqF40DJoyfDxdBKdzIG4wv5s2In+Q=;
        b=KK67c333v2UQBXZfGlsXu9xlt/W6+97A1LgDGPy9T3JFTJMsNLJjD5WxT1/DUFBzK9
         zsdzIQuMsr29z636kNd1x5JUteFRXB6zcfysUiKQksiv/UVOQz2gkxGOog271WM+jfVB
         CVRPAocAXRzgkU6pio+Hljdx5smHdRknkcxMmYaXWqfMZJm+8ALnXVubjnl/M0mPurhA
         PrpGGrSlA+dGDXzeXhAKemLU9U/7feSXNqo1MfiBGwFmCyCVoFjECtZhfoM9aEMuAgEh
         jX7BM9dTHvJ0xyi2/gEVPXSXg18yd0LK8mR2h++x9OLsVjU75izp/kZfeWgXEnWU1qfd
         F6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516252; x=1775121052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IDIt8ynlMPPK0wzqF40DJoyfDxdBKdzIG4wv5s2In+Q=;
        b=np3vHx28FGoKBtb701oGJe3wcml08KfEE7wxmviGkM+kT0K1gKCIJV6nJQCZ84VLBm
         KT6QTZ/pcDKRW7uswZf/SPfBhae7LF1VCMHtTzG6Ue2CJfrrSFlMG+SavWNad7N01TuH
         JJRtTIWI/oFc/UJnWSq6ucmRKky6PsNNmTyTCzFfAIwSuFOktA1Hz/8JZ/6K7PbWCkvD
         qEvxLVa2lDRaxrfhWwml1GpPXjFHD+CEP6Olco6mJac+EbpqPwWr3R40RQKgHXPnWEdf
         EvbeB3eYlVu/2cJRQLJ+YW6MKT40UuUna0pBVMblb3mKsxZDoszoJ4watcV8VJwMOkvA
         wr+A==
X-Forwarded-Encrypted: i=1; AJvYcCXKvfIo4rRY1hGkEz157gNx9jAlF6x5UljmukGaXGYb1uCKRUXrC5mvnIkK2JTs72ubsgg9469NZ/rX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlhk3fjF9nRW53c75MHt5h4j5upg/Bd7BytX/3qa54HZE4nFJI
	/F9wzP2LAynYw/GFrYjZoSoDAg+4YUoko0J3qUA8HrtVWah3p/3yehPj1Zgyyv+2
X-Gm-Gg: ATEYQzyHh6XHWcl8VCLoYe4ChR5nBB6Oqsfb6LAy3suwR6aIYXFoVV+/oGR0Km8AbXC
	FDndK6SGG4ebe4dWI07eiUqiOguZe3n7Gmwpg29Xo/DH3D/4pyBlXdobvxS60TAWrVTbuoxBITT
	9dcF3hyZbrMTbnv/tmfopRfmlmmuI3cUXqUQN590GKUj1xV4jNHKI1CatxBs7Pow3Kkfe3H+zkK
	6+Xa6Lc8wpZXb+GmXxhMuUQs0lCWS6kDjmGCa7l8LpQKtg6FrtNPLogCxy8NiZ2T9fD943R0ZeI
	RFiCwov7c6JsnMOQH4EP+a55xnlSXi7YOOknWiAZmyfCxUlDFJLeHNKzRfGHNl74rGQ3S6xrzvV
	Tc9W9XBIQWIKsXp9tTFkK+uZOkm6mSCCi6kBKDbGaq4YAvIYaFDZxPMjnAFITE6M7VvI6qMR7Z9
	Ol0UYqPPK4RrxMf0quysyZq/RuvtG28HQtYhogNklijoRTnDn4AuTKZXIwbXBn4ydbd3QbVj0B2
	mLXGrjotg==
X-Received: by 2002:a05:6000:40e0:b0:439:936b:bff4 with SMTP id ffacd0b85a97d-43b88a2939fmr9878451f8f.46.1774516251706;
        Thu, 26 Mar 2026 02:10:51 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-119-166.cust.wifirst.net. [46.193.119.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm6381199f8f.37.2026.03.26.02.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:10:51 -0700 (PDT)
From: Fidelio Lawson <lawson.fidelio@gmail.com>
X-Google-Original-From: Fidelio Lawson <fidelio.lawson@exotec.com>
Date: Thu, 26 Mar 2026 10:10:22 +0100
Subject: [PATCH 2/3] net: dsa: microchip: parse KSZ87xx low-loss errata
 from DT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-ksz87xx_errata_low_loss_connections-v1-2-79a698f43626@exotec.com>
References: <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
In-Reply-To: <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
To: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Woojung Huh <Woojung.Huh@microchip.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fidelio Lawson <fidelio.lawson@exotec.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774516248; l=3456;
 i=fidelio.lawson@exotec.com; s=20260326; h=from:subject:message-id;
 bh=8+8i3aomOLS8R8b5sollZ2ZiFAWOT1uHJtt2Q7PXFp4=;
 b=R/3HNms1ACa2Mn3v7SBYrjkAoaa6bt/B2PlA7rR3/K+Hd/yvt4vsoeheFdN7BB4KG+iLb5tw9
 nheDwsKTLVlAPe2fatFvMp7rPf8lFmWrgrHN0M8n753bPqnXiN9qEpx
X-Developer-Key: i=fidelio.lawson@exotec.com; a=ed25519;
 pk=866eH9Bmmpjc+ctgkr5T1uXxBefZzob3tEEuiVWZ6BI=

Add parsing of the new DT bindings related to the KSZ87xx low-loss cable
errata. The parsed values are stored in the ksz_device structure for use
during switch initialization.

If the enable property is present, the driver reads the errata mode
(microchip,low-loss-errata) and selects workaround 1 or 2 accordingly.
If the enable property is absent, the errata logic is fully disabled.

This keeps behavior fully backward-compatible with existing
device trees.

Signed-off-by: Fidelio Lawson <fidelio.lawson@exotec.com>
---
 drivers/net/dsa/microchip/ksz8.c       | 25 +++++++++++++++++++++++++
 drivers/net/dsa/microchip/ksz8.h       |  1 +
 drivers/net/dsa/microchip/ksz_common.h |  9 +++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip/ksz8.c
index c354abdafc1b..78b42cf50ce2 100644
--- a/drivers/net/dsa/microchip/ksz8.c
+++ b/drivers/net/dsa/microchip/ksz8.c
@@ -1989,6 +1989,10 @@ int ksz8_setup(struct dsa_switch *ds)
 			ret = ksz_rmw8(dev, REG_INT_ENABLE, INT_PME, 0);
 	}
 
+	/* Check if errata on low loss cable should be applied */
+	if (ksz_is_ksz87xx(dev))
+		ksz87xx_parse_errata_dt(dev);
+
 	if (!ret)
 		return ksz8_handle_global_errata(ds);
 	else
@@ -2096,6 +2100,27 @@ int ksz8463_w_phy(struct ksz_device *dev, u16 phy, u16 reg, u16 val)
 	return 0;
 }
 
+void ksz87xx_parse_errata_dt(struct ksz_device *dev)
+{
+	struct device_node *np = dev->dev->of_node;
+	u32 mode;
+	int ret;
+
+	dev->low_loss_wa_enable = of_property_read_bool(np, "microchip,low-loss-errata-enable");
+
+	if (!dev->low_loss_wa_enable) {
+		dev->low_loss_wa_mode = KSZ_LOW_LOSS_WA_NONE;
+		return;
+	}
+
+	ret = of_property_read_u32(np, "microchip,low-loss-errata", &mode);
+
+	if (!ret && (mode == 1 || mode == 2))
+		dev->low_loss_wa_mode = mode;
+	else
+		dev->low_loss_wa_mode = KSZ_LOW_LOSS_WA_1;
+}
+
 int ksz8_switch_init(struct ksz_device *dev)
 {
 	dev->cpu_port = fls(dev->info->cpu_ports) - 1;
diff --git a/drivers/net/dsa/microchip/ksz8.h b/drivers/net/dsa/microchip/ksz8.h
index 0f2cd1474b44..3a43769a4c53 100644
--- a/drivers/net/dsa/microchip/ksz8.h
+++ b/drivers/net/dsa/microchip/ksz8.h
@@ -66,5 +66,6 @@ int ksz8_all_queues_split(struct ksz_device *dev, int queues);
 u32 ksz8463_get_port_addr(int port, int offset);
 int ksz8463_r_phy(struct ksz_device *dev, u16 phy, u16 reg, u16 *val);
 int ksz8463_w_phy(struct ksz_device *dev, u16 phy, u16 reg, u16 val);
+void ksz87xx_parse_errata_dt(struct ksz_device *dev);
 
 #endif
diff --git a/drivers/net/dsa/microchip/ksz_common.h b/drivers/net/dsa/microchip/ksz_common.h
index 929aff4c55de..f40e7bd20b3e 100644
--- a/drivers/net/dsa/microchip/ksz_common.h
+++ b/drivers/net/dsa/microchip/ksz_common.h
@@ -158,6 +158,12 @@ struct ksz_port {
 	bool manual_flow;
 };
 
+enum ksz_low_loss_wa_mode {
+	KSZ_LOW_LOSS_WA_NONE = 0,
+	KSZ_LOW_LOSS_WA_1    = 1,
+	KSZ_LOW_LOSS_WA_2    = 2,
+};
+
 struct ksz_device {
 	struct dsa_switch *ds;
 	struct ksz_platform_data *pdata;
@@ -219,6 +225,9 @@ struct ksz_device {
 	 * the switch’s internal PHYs, bypassing the main SPI interface.
 	 */
 	struct mii_bus *parent_mdio_bus;
+
+	bool low_loss_wa_enable;     /* low-loss cable errata activation */
+	enum ksz_low_loss_wa_mode low_loss_wa_mode;     /* low-loss cable Workaround to apply */
 };
 
 /* List of supported models */

-- 
2.53.0

