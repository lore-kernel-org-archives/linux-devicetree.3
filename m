Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52B83B1009;
	Fri, 26 Jun 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507743; cv=none; b=l/HakjtrczWfIhWTiT0A6b6Pw0WYWJMpZ1lfXPoRkbg40LShJCOEJLAJBPuAIFROHxGma8VATlGSz7AHpni5zsKIx2LUHIp48+HfQZYZjQ3R+fxMcGLGdfLBAOwixGTESmff/DuyW1eNEbfVlcMTpvJ1yfMU60bFgZCcOkW/6uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507743; c=relaxed/simple;
	bh=ATtRXr12sUyV+sDtMBt9l9EYiWar1IE41ewCHskMi7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/heUvgvHKGgCNx95YYMIl/3TxgZWWv8LlGz3iTg+jVeN2gCUOO3qNmFxC7uRgkd9m5XDDaHRrXK7iHq1sAS4kErW1wNfkZyjUPywIMcJDKrliGfP42fpGzxbu4rri6o1vS0g1+1U4T56h/T+m3NnUq9AspfNT+rGx15VH1mlmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tc3p9qid; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tc3p9qid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507740;
	bh=ATtRXr12sUyV+sDtMBt9l9EYiWar1IE41ewCHskMi7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tc3p9qidsiXaHhlsAsUGqm3+SQOMTEZRuaqOheQEUPJt6Fvxlulo2+thFAfffSk+H
	 GSPK/1kDftqz7aZupyXhZCSDgV5EWiR5H3Viknmo/tbj2eE3lYmel8s4L4LXGAReqE
	 us0CEuWeN+Qusfv4LluTVtkQFVTFBp8OICMsY0joZOx5UKjLUX6eEKs394Y0pBWXwX
	 xcXNWQ5wjti3u7rPKSRfWTcdTbpxBmGhAkUK7aHyugacFfANIO7GjKgc9aV6Xdchf5
	 LNco3G+l5otRYqc43oeNTHKA8CK7xFWTgB0SLsgzURiBmdRFXkkhK+Lropw9w2660F
	 DWXH18BPD2SHA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F126717E02B5;
	Fri, 26 Jun 2026 23:02:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 34D9248006E; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:21 +0200
Subject: [PATCH v8 28/29] phy: rockchip: usbdp: Avoid xHCI SErrors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-28-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ATtRXr12sUyV+sDtMBt9l9EYiWar1IE41ewCHskMi7U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yWvovxnmTaPOJYGGASoYc5MuFqRnbMi1
 fXoFefcK6NKaIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qa/gkP+wflq4C3m7xHPGiW803FGCNtuJN95iT1iNpHOyDsmROeouVXCN/zLL4u8amLogJFbe9
 fwkGtA2Rz8gx3YVnckRheqLh4Cc9PnV5xX1Dz6Y9znzi5pv1BrDV1UnkWalKQW0W2a626b6C5N9
 k1gQLltpHpAa+RqP/VrOxOfa3X6ZeVwCU2p8LSOypozO/bgGdiFV95pUY/408kbBbN+9KzTYAhG
 cHpTlI41BMqtXYMFgbM9KoDBTvZ3FKNJtcWhTYYttq4HE7IwRY6P+Gl8TNHnVNkXWXGlJGjqMTV
 kPOzY/9uDKdFfZq4kQLEfbRRrAUFoPFwe90xCK9NZTqhza7j00UoztYrcm4IhH81BBjQeXuxmh6
 LFOUI/JZ5nhDz/nAYuvHoeau2fzo0p/5SpqP3N46ogg0bK0gAYH7D+Zz4P7uWXVzwHaKO+4Vg2J
 lTSlm4PZnpI7fTPwwDYsCEla/OBQa76TDir75nKM0EDJx1Kjej7T1SRMuCbDHKQ6E4RU22VrkOs
 MSQjX8v++Dugm9kPnukj5GSyakh4b/6Fvjrj5mlokpc1iRI1sfoSJ9OWd3STY60vDA+d5b28x1y
 xgRKJZElbZNBClQgzjacHBKmyl3HjvQ2R/AoL0tkgUtZnzaMxW0GoRN1ZGFRkaY3Mr9KxNWDfex
 s9woDzYYVHyYc4g0TVv4tqw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index dc166392ba19..7c8b9eaaf352 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1033,8 +1033,8 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)

-- 
2.53.0

