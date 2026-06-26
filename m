Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC64358D37;
	Fri, 26 Jun 2026 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507307; cv=none; b=VaW2rA/UpdororSRkXSOkvzcbUe7tTa1YCYZS4pBPQdsLYE/nNJx0tPKIyUTcRxwwm2yKvgxNhxDOL5B+nWSU1QwtqDEyhwVfCQf4+5pIm70bSVmBGL24ROMQehLF9pYIzccU8mnsH0z+cP0tMoj8Y8VivFx8gmRsF5vsPxO5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507307; c=relaxed/simple;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJ79Rw2xxDd0mZNabDwR6sZmCm0dMSuwbomBNf5gJtzqe0zM++cpyAYYcg0dBu4t5RX5YEBSYr6CTxnavIyuoFbP1q0bvCACe7h7NVeWkq1K/ClvvNINdis9AU0UGem2AfCSsNga+sNsjPZ0rjYMTiwMtgl6WRjNo2/v0r+w88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VZuKZqjh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VZuKZqjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZuKZqjhOL41NXJS7+mvK3jLcBagzwdRffZc5kQR/23F2YzzOX1oodnU6gbWwzlWU
	 PuptQ5mb+YU0fZ17xMc/5TozVxyE7En9/tROJ9LLS1UgRJGu+YQM4yqUpI7jjtqwx0
	 M3zx8dQ8jjaJfh7iNkXa0Os+E30p6CGaRaSOGan9iqdTIoRUdtszXQ9Zz+ewtMcg3H
	 P8lI9lV17fiKkroCXG9/WwIrkehpiV0hjqyjv2emawx7ZbS7Es3w6NkikqaATnmsoq
	 UPeNAWWIJiZvBqxiqQW94cYDeAYjvvZy3/uAFbvwbyYHWf/YHqLKGNmYdw6KVWSQ8L
	 fKRrC5ft3iIsg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 619E017E10FC;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 10CB448002F; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:54:57 +0200
Subject: [PATCH v8 04/29] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-4-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5ySEnnXwnLhwf6pGkZ15z8g1ku8DZG7rN
 Wy/PaCZj4EKVIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuckAAoJENju1/PI
 O/qaaYwP/R+sPnWBMhanQqGENnxS93mEur+v+/3r6apGQ0wkHHe0+GjLHuAmy1fHPQYpsinpK+6
 nUqNTOaC0bOrnLHaTBZNJx2POjcJrztmbppFGgAqTSWwd9vHguYK0ZAQjo4rNOHlAcEO++2Q8EL
 VZD+XV+QbRibpgZDhApb3cZh5RCE7Ddi2+EaH7m0sj3oRXXZUh8FCP4UXSLJByOowRmIwo+HOJx
 rR6daYGfUgeWP9kP0vwCe2MGYTMsyPdS0JhPayPvn4Q7uNjtd9osdtFmrD66HmryAIwkQLOPb8z
 AaTcIHaspS/px9+vMMgBXggX5Q5JosoDI2ETg76DtNTPnxEoaTQF1IOruECeJeXKTPH5EFZf12u
 HkHzi6zp7XFBkD600rOI4ALWyvOcHN3XebvN+jKQMh2DOZUtm1ypSFzh2aiD22sxP626FxoJaWq
 Xh1xcjJH23PkNnyekPKtxi2/9Hzab3X7un5tO4KANvLD7rx65p8WDXiaX+UO84vCECuNPAHp1D0
 Ksf0TfSWZwA3Uewl9PKEK0ZsqYaw1RreHYVi5mdZkThWFQlFcwbeBKEa9lQQ72AZbZPAj6rPmgo
 9VGoDphSiu7qraSR4mXL4nShiPt+yJiP9Id9Hm0myMfcZ+tUN6rqAxX47g5QZHwOKU87jOpHcIc
 lYdqe3vqJCsMjuIlt3Agx2g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
-ENODEV, permanently failing the driver probe instead of allowing it to
defer. Avoid masking the error code to fix the issue.

This effectively drops returning -ENODEV in case no clocks are being
described in DT. This special case will now be handled by the follow-up
check searching for "refclk" and exit with -EINVAL.

None of this will be hit in practice, since the driver is only used by
RK3588 and RK3576 - on these platforms the DT is validated to contain
the clocks and the clock driver is force probed early. Thus there is
no need to backport this.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 12dfdd470a78..2845a012eafc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -427,8 +427,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 	int i;
 
 	udphy->num_clks = devm_clk_bulk_get_all(dev, &udphy->clks);
-	if (udphy->num_clks < 1)
-		return -ENODEV;
+	if (udphy->num_clks < 0)
+		return udphy->num_clks;
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {

-- 
2.53.0

