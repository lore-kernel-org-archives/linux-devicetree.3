Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816481;
	b=exwPuXu3Bh5hvLtlqywhgFGi84xx7Y92HxUTFRHy+ak6iy1DjgmcMugGYR19Jdqsbh0R
	 /f3Kxc2EWw10i7rKgAmUYTEKk+Qa0IqWhlPvWB/DNSKqTvmOe5kPaoNIsus0hHlV8q0uw
	 nwibZfgacng5SnTa8uf4Esv3kMiwIfnjSXQA1Q1+QZUCG/HUEoxlXofh4Rjn5CauN1nAv
	 uODu/mHRspnfExlxhltGYx6vw4LehaFlD4xBaLOrrri5dQOoyFEXNdbND8tcTcju1zdVq
	 qOg3NjesLlLIJtdYDwOeVgMlpcfL73qgXi7nBkOZrvtUv/AGnUct9MBl4pN/iWKzZsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
	b=TyAs8UeMpetd4GNfHpdumBK3KlIYLi7Mimd3ma3LOVPOVBs97me/IwzsiTce/nMxBuub
	 0QQd8rbx9HWO32A5GlbQJzpVxlm6r2hu9TLOWAk8r9CjPXUUxz+pZJi1AWwhmemWcvOlC
	 jtR0cFbj1+rQu4L/MABg82C+8QQLoU9DInSBKOjacyD6jsHp30Qt4L3LM6U1OlgjD6ich
	 Xi95cX6tSWPLfmy9pB2DJuoiNvecMjG6Rp9brfr9qj8bRk9NM16ggD0m7/42+i8jnYbmb
	 dguJo6dCTB1KWESE2+Je1K5am/gHOwXfBiE2GUbQ/sw19ftKcuR9DfF8eFnX5YJDvWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgYBPg+z;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D5606A330
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C89D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgYBPg+z
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso506479f8f.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816479; x=1794421279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
        b=rgYBPg+z8aTcOOqgqb2NigaNQAKH/UEO51ZtpRUUUQlGUwVBl9l7W1aggtunfwT//8
         h045sPyhYjb6sBMTREFpCPj3YMH2FxuBbJS9skFQpqeZeIINduFNJD135vC9sSerjMdh
         FCOoHuGdVfF0NikfDmR1G97i7H4TJKaB028BznSDF10dhnovHyZu0mOQTNhVAvc3woZJ
         gPtbxLjZ+4FyAJarICpUFq22ZSEu2VzoaGfoIGYwQeGB/nB1x5shbEDZQ2WZwrC8zRnb
         1LYLI1piVZYRcIhO/LJ1Q6Am9+tII3CWRI05YX5KRvqdhbjs1Zv5AyOwTkupSYKkdLrS
         2MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816479; x=1794421279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
        b=t3i/S0Z7QFBetSIqHRoLaxRsm3JbW+eOdMeaE03jdjARgzTYZ7Zie5JEdfMFXU5iol
         5HRKWfxNQBTyTdUNDvc8CQh4dHGTLjwxmu4BrA51Yx/4rqUs2ZDbebxS7BJA01LOsVIu
         iccRiW9jPjSq9eTeJJeGKC0160DGKf808easCOEqxPOtN+WhMWVrSN5/Aegwt0xkN8VE
         npxdk+4MNzZTAkKhx34PPelOpKxZ3252E/rnGjEgyqivutXmzY7QjXyzAUcwDFnsG7qC
         zzBRryuU2vRyTwYOd4lqb1DukS+T3etVkV2j4e8dw7ZMkn1bJ+77g1kOHdLZHusfqkOQ
         gHEg==
X-Forwarded-Encrypted: i=1; AKwUvBwAuPrudRClVig/hGUMhPlYwAYNvY+2giQQvQTexMoIHpnYSYNyWEyd7ifMtFxyCYlvUyqUoXGLR5Nc@vger.kernel.org
X-Gm-Message-State: APuU4Z+zj86+PZzcv556iEoAVxDDVSU80MliTO/L4DotsgZJDubjZCj+
	XmNg4hjAJVB+vj9MtDsfx4nFiqr4VvHbbP0N54U5Vk39cg6nG3j7eXRL
X-Gm-Gg: AYBFou0mWFJRwUgl0xMe7kYmLv8vx6am+RK5QKhV2rv9kJcV5Zk28poHtRjv+Sx0Odl
	yVeLymdtLtKCAhO3uxZISrMi5iR3aGo1QEv0h+N7xGsc2hILX0BPxH/mLR6kPw6GpO2D5TZNsXH
	KEDH1xEUiOqsKdWEsPdFbXVPERG/645cBqRkxbvxfy1Kac+QAS6neCGfv2VGS2l7/2hC6hNt/5s
	Dz9poy43EqWUDwhZl4dS4fDbla7k+3V9xNGmHFlsAVKdk3yrQgESghL1awbCVf3aAXmyKwSS/9z
	RDoAfLz7TDpvKr4aPYH40c10CN8QK17w1MYART4JAG1qAT6q/ZkaTJ8usiqycdPm+aiDquOVy7n
	853H4dVF8HB3QOegFgHEyuZDI8yUrXX9NaWnI9Tbp3Ttt02HHpC/ClvMvfw+GDN7TmkAyXmrE1s
	EDnWoN+uFFItMgPa3oE1oQWVownVmfd36j5+2v7tgBKsSswPg0F3x7l6Ew3cw+/mB2zoS23FPb7
	Pyn796bWeOJ5lQUM9JyiP7vCPnTBn9HBjKkYhLjFpzyc5XfsRUZcUmQAWM/lfFZYYpGPFJSAsPA
	I0jFz59Ru2pmlWInwmDe/mgiJxecxlO1IBVAuGqSvvACIu6Wo9M3uBUd+W9K6LoBKzSeoVzcAix
	1rsNendYdzoTCfQv6HILVa3xzDfVCH531u8GPIQ==
X-Received: by 2002:a05:6000:24c4:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-48e6e511219mr37783890f8f.45.1793816478980;
        Wed, 04 Nov 2026 10:21:18 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:18 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v4 07/14] net: dsa: rzn1-a5psw: Add support for optional reset control
Date: Wed,  4 Nov 2026 18:20:55 +0000
Message-ID: <20261104182105.1102555-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for an optional reset control to the RZN1 A5PSW driver.
Obtain the reset line using
devm_reset_control_get_optional_exclusive_deasserted() during probe
to ensure that the Ethernet switch (ETHSW) block is properly released
from reset before initialization.

This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
SoCs, where the ETHSW IP block is connected to a dedicated reset line
that must be controlled by software.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tags
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 85ff1fd2bbfb..9daa5d8245df 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/reset.h>
 #include <net/dsa.h>
 
 #include "rzn1_a5psw.h"
@@ -1207,6 +1208,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 static int a5psw_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
@@ -1243,6 +1245,12 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = PTR_ERR(reset);
+		goto free_pcs;
+	}
+
 	mdio = of_get_available_child_by_name(dev->of_node, "mdio");
 	if (mdio) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
-- 
2.56.0

