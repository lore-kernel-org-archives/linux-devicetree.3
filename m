Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2053B14CD;
	Fri, 19 Jun 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882940; cv=none; b=MccWIm6QIYC6rakWg9RryZoG63pf6R8rVsHXFDaf7ab95uzPi6wuKw/HnJP/72jlG72cKQ2E9utgKwmYWWm/wrmXviaplarfJwmtz7v3iAq3vs2FQVdi/Za1ZMve4Fp1QA0LlAW2llO7uznES7FJttaF3ZnNfFA+aQw6Fl9P/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882940; c=relaxed/simple;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqhOOzwzMKQzPjA8GvUiWBBfXRxB1HY1c/va6F8kbmnJ0DV8zYyp45xKFWS2yuMF6M7//en6pK4Yjxs/k6ehUkn8h9NfOw2pu4TJnQDNSDqQBDRh76DYdoXTtDlMdfHZBkydsNovR0uDr8QCsEejB9RxuwPm/vmtmA6YAxA2TNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ISJkw/2i; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ISJkw/2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ISJkw/2i8/V22cz30IYLktemiVh/lIdt+07YNmPsRT1XFtHRiQziFxfZtyIBOrZ85
	 mNRtrYgRGBEr1nIdFWUCuaNHDn4ShW88fjWGwW69d2SMaXE7a6npUGt5gy2hBljmKH
	 36JVAPipcb6LfzyeKNmWtUTYlEUKS+VpkvBKOI+gq1iuJVrXpUpvxEN3XtJLsgno37
	 YPVYd6cKM/fn6MTnOFECUk49m6UaF5kaIsfq0zQ++/uTiTuaeMRuleMVZeRCcX4FNo
	 /DfxpVlIbiENLQ6cNddJAX2k8CBDSuMn1pH98P2qx4YT8dFvYxgvxRKsLDO7nWAIqg
	 K7tcz0EB5KuIA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5EA417E0EA6;
	Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8C56348002F; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:55 +0200
Subject: [PATCH v6 04/23] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-4-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDiSkvukIugyLwMSi+X/R9INJ8nFQOwFk
 0HPu0jP7EkMiokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaj3YQAJYQgd4cE0FIT0/9dAfmhFulFhODHLdkQD6bSoLFvyCkuLq7jfiHU+V1W9+7OI0bvTt
 FCstjRgSakEyEQArlF3hJVHOGlx2puK1wkS5D1YLDRFWRIdYXtfe7b/ucu/yXU2ngG27id4ruQW
 FxITqsxsqZgmgtIZ3pwJYirjJVwecxKc7ODQlk2rEqcqw584gzu+raCUJ+JZFqr6YeyDeufyk+3
 g0Qhzc0CQ121ZO13Obwr0IUSlOZRLQDCSKZ5/tV2+QZEGDLEOtBZm9y9ZCXnFS2KcevMmf9B1C2
 yF2DPQW98lyxwWVPTkUDvpJ/pHy62GdVfGbMMtl/qimxilca6vDI87xqduVuqzGodoqoqvLUS+H
 1cT8b4P1aqnoCsa0hjj4jk8nSjB+51gk8vA1Wybv2EQeOuBFJdC1SficO+tr5G75pf7MbX7Udlq
 sk+s71T/s74z1GCrtWshBgAZC+lHXYfpscyLsZ1FqHO7aH2SlWJEi3mz9inurlVOu79CXzFn4zn
 DY8Ryg7Ym9iet/7cdSbkyi2xgC27yu44nsdTWzI61PaX23dSZ+r/JMmJ047uENS8OLQZZs6AIjz
 bvglupTJU4hMi3Ym7WQsfEJ71UVGDXA0m+3oGFSEgQ/RvesJj5WHewN1pH4LRAjsQdhWSxMK5I7
 Xi5Jfa0ZohEyS5J6XVDApfg==
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

