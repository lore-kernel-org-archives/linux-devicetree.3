Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD123A4F36;
	Fri, 26 Jun 2026 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507305; cv=none; b=GOozPuBlpO/cgpE8xG9+6FYdacznCMbMSM1L4jWbkuBbN9CG6x91RhekKD+W6JATWq/AXkqzTrdKeuOQLgjm7lXoRz4K8HJqTHGWD9HfqMqyZl+apsYlvjxoc7MIjwy0hxgNuJBPfxYyozdEwJaz91CYkVHM/Ay/sI58bKUTq90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507305; c=relaxed/simple;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otTFqtRsblIryKIZMdLt0PEmHgygNhImBQiKtuoSq6CrmqwH9rSQfxhzH8oWFRKbHkeAvWTboj3mTcSQEMO5YVOFyXQ0bTXtPDTZJONDdwe6u6PDFFzTETpzWYXGTf7nEdcn4rvsPl9Bbjv73werrdZTu0SR9pxFTCYge8S2Jjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FVLw8TEf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FVLw8TEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FVLw8TEfA2/GO+0mSqYLCn2JUSzjy34nv7Eslu6XvT8TvKNregRGrfETK87r+Ij+y
	 HopzGlQW/KkQExB7TI9S0ISpuIvHQFH+Ll5tfJhlC1d/PdZUkiD/YLj3YCKfjrRYp8
	 Bcx4KlxJuN9A3lq2guiOl3rOtKAKhMzC3yh3Mg6IVrqdNz+ut4Y7cycQZHfnkHIUYL
	 QnMyx/BPTH9S7h9ozKKRUqB9Vtf1iJkwxLYX0zijMXPUMw1UMu0SOFbjZd3QxkG0RO
	 sWC55xtnaOTE5TabF3Mu5s699Dh6OAP6Mx5k73RgC4xOcDTJeOw1Itei6Ao8I6iA+q
	 ZoCMu6QhBwX+g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 605BA17E0F8B;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F3C948002C; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:54:56 +0200
Subject: [PATCH v8 03/29] phy: rockchip: usbdp: Do not lose USB3 PHY status
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-3-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yQRGjoRlPXJDj760LCK2u91AEzVkeGyS
 3cklfNcIyyQA4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuckAAoJENju1/PI
 O/qaFR4P+wRjLQCTZ8Ekv3tgd7cqyGq+ldnASQ9tmKQf5gK7MN6BwY7WGn2TLhiziKgBSi9b9sT
 T74w0J+pEb69mPAFBhczjjTVZ4Vb44HzmyEH75iukyptoMTL5ppJhGInNEpIUrLqEJ02XF9L+s1
 3NpDfRndmSRLwu7DbcMuQHfq2nZmAlgM9uwdNL3tfwep7QvvUgDEkQO7Y/TiGrjruyoNDQswmUu
 9N/uDUMAa/TXMoofb0lx7k/6OYqtnScwD5xtXgWUMRSUO4mL1iwJGi+2UGa76RTgTxaxdS2o/fv
 QVnNFGoX4DPdr0lHqkeQeVG6bp8Jhqsc2cm756C+XAid2IGAX4N6CvUqNHc6g9XLjIEAkfGQfKB
 RDaI2usQfssZyQ1kx5o1MJRpT1EI1IN0Nd3O2JLzrun7Ub+YA1rS8fyGJiNwnyxZ9/2AsN3coMO
 ox5u0IcC+Vna/9qmd2wyp3m2/Et9OpXaWBwhNnLjod3OHYTQir4NGfPe8F7d/QMiZP13y6pNJ/b
 4VipKPdmP/La5yjVaiNXx8gEFZTLNDsDx8PoBMgn7I7aYu7YV1xojTssBMHzMnQ09fiKkqRDqfh
 FDsPVtjo8ChKkVr6Mai7n63tlhThuclkfzve9VCgVgxkBfYCE5VBfXIVyBy32D/dhB6ZF8VCYaE
 CZTxK6GoVgtT0Joaol94whw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a5ffdf7a6e76..12dfdd470a78 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->mode_change = false;
 	} else if (udphy->mode_change) {
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0

