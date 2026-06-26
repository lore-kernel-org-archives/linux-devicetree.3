Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD8B3AD510;
	Fri, 26 Jun 2026 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507306; cv=none; b=EMVm+Gv/GzBY6M09ZAvbSrmyyx8ESIWTII1R3J+eXyN7ceeBWSoLu23PAeFV9xwPP5gMy+/f46A7YMMPW3kxd+gLRiTGOHtjrkyPGxOR8B6Ut1GSZfn/14IYl7SnV3sW8aCEV3lcaaBSCjpIKPkiSpafoCDECz83pROxKhW+jNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507306; c=relaxed/simple;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pp+erkRyqRfvcCfWM+mMBbcHKvEZPa0V5O4veCWG91TruyTnFPGlE6noMmdEAy+k3kMXCHX2uoCQzFji7AF5IU2FEobBuGzNWGd4xTnZ7e+9GhBZN17sJs7+sp8hkJWZI7GvzbWCm9K89UGXstF0/5OeKQFEeeL/Qk3ny/gURvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fjKGfUu/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fjKGfUu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fjKGfUu/SgCkMFsLGGOpRa09uW4xKO0KPwoxxOsdMrySTXZhGtoLebulEpBMF0+Rb
	 cVRh0i4fF2wUcr4IAoU4TgQS3Y6J9l0RxIMJxecTQ7q1kro9oCaQ4hDEmEWmdu5eA7
	 5vaBfXd47GhALcpISn2u+cZIJHs/Xi7ML/B11aIK5Hq4ijyYenSJhfqUS7rNh8HM5L
	 1rwXFyF0zCUR7GzBOfjWtHppUtUFIP3fa5QIyCqQaRTW8n0/9tLM/NeHLFigJqqOxU
	 P3o1mStnn8nFSLCCBoclKcJFe/8fJdETd7a7EZMOahG3rg4/WqiyhI3QQxpsgUfQCT
	 44QIYbTn82mtQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EB2B17E0C88;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0DC37480029; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:54:55 +0200
Subject: [PATCH v8 02/29] phy: rockchip: usbdp: Update mode_change after
 error handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-2-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yQ0wncuIq0TqEaIQ0cGZ6hiF3QKJvVIq
 ow3WgHj4ebDaIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuckAAoJENju1/PI
 O/qavPQQAKACkti70G1jJsqhNOAQ8DrvY2FbnT7ygWto0Uj+7VpmMQCYn2My4kR3kvyZ4WqXvFM
 Pxju6kJJ7h03GlK9HNx0vF81yIoekaWAN8rju8ffWUN6VZ9fHiAq7VE/jjbPBtqD+Vv5QCyokHl
 LjUmLGVmKGC+fB4ggvpErEePSnIJ5GCt1ZYvKGp9Q2Tz2TdFxXKtmDNMH735v+2GwWdWUOJBqm2
 i8L3qVMjcSXtWaRNIZk2QuJ81OUGT/TEaXAC6zyl3UHt0lB6dc3gl2I4jooCUWZrsgMcE/aSPnL
 WGv8NXIdK+M6z4k8JCIrNUU+KmyJXR1GCAWpNGgPk9+8qSwuC/i8VkHiq83nUWqWW2SuDZeTdWr
 BzpfviTJuR2ZkFhi7db3tfQkAjA0yz0xQRSmggHCIFJqgnqHYKL1jNhvG4e/yyesCAjBzrPQqNM
 qEdRrUpM6xXxMJGU9z2HafAIgwqJUtSJwMccwD1KJKUXvdc143AnnbPzpkqrMl1SUuvYZp6Lc/t
 sKVhzmkWYAeQ609POJAvxmpcnhwjnuCwLegKFdD5o32HrieyC1IgmAIEI/It4D+mdXRv9wsuD7/
 rYKB6hl114jYSPfMO7I9/8QvkKnpXtHztEtAdZmqJavMAakCHj5P9cyrvsVfWcS2M66kMmaLC3O
 9B0dDM+eS8KmdPbWRQwYo8w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

