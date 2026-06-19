Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB73B6340;
	Fri, 19 Jun 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882948; cv=none; b=BBNyE81F3X2tnwF+m8vgP1ZI+o5IS+LwnKo9jBl1cqa2AdXmfmbEAMkJw6qOcYTvw3QCGhLkOHGqdNI2JiwQpV9MIe/wt+wy64Zt/pcYuc40iTSogd2zks7knawGl7eRVF9ebi3bf4R/1akwY2xLcx1dY587A+bKrs4xWtLM/cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882948; c=relaxed/simple;
	bh=gn3ayTGnT+JU8UaQ6hkWMrrwAtC7Qql931Hfq6sCpw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffxyMd8+8R7KUTLt+hwarLJr4ziISNPDZ3GrWSI54tf3Md7vX0k5HGyYFjydI3THb6beCkHTTZM1Tq81CAJPX4wG0XNFtNo0PMmoxeR+Zc7Ya83THDhRBSnMMg9YYspna5QV6W/ilT8f3u1ljUlPLI8p+VhhoC/FbVRWvYC/Nlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kd2EZxqJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kd2EZxqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=gn3ayTGnT+JU8UaQ6hkWMrrwAtC7Qql931Hfq6sCpw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kd2EZxqJyg5hgL+GpmEdVFvZsAPJS2e3hWa8C7qUzSlTyZfGHwcYKajbbDUgwDoO0
	 FIvNjOqf42OxtLBq6japqLtJss3AU1MnUoZF5qnFchfiOddKFYgoFU3aVftuYeYhmm
	 HpK1WKV4ReLsBl9tRtlceiU8GNe/XUCtjlJ3JfqPAQqkp8gDjJgOvuuRwO+sr79xsM
	 FckK94AXznAKn/PcQUdegZdUhl8v5b7h5YyUA/hTFpOFVkIr3lF/JpHp7Av8ea9GHS
	 sCR3mKv6K6vuXkOvKtt++Hky6A4D+Z4wSEhZrVf/kJHXt/pEmsexnKILIWSjkZPohb
	 bMMsPP0PgxhhA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87F2817E15A6;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A1267480061; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:08 +0200
Subject: [PATCH v6 17/23] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-17-3bb1f54b3f35@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gn3ayTGnT+JU8UaQ6hkWMrrwAtC7Qql931Hfq6sCpw4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDmF9N3nCAV9kSDLwDmfmxrx2wdXWdCbc
 G1bWi+GIhpMsokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qaSKUP/0h9Ewjlsm4obFqkI/shoQzwmAvYncuBNljV6jG2L/QtNihfLcTz33UEqnWn6VyQgu7
 kRJD1FI2siFFZKniVDirE6JcudbwsT/9KT+NBZ857HECbIkTSrmd1IaH80GnRphtUXydW5Zqbyq
 6YGnA4vSpXWsd47+bHNKQL1+IGUmjwJiAlKDryJ6I+3/oAlYO/NVTjslfZ5yZAbLsXIC6iBiJsS
 1iibriF0kYWtATJaMRYCCZUFKE1WMpG2/PgLMxeaewg/xVubvXXuI4QIhPAMCQLlZcMQQ8ArQ52
 RcWRHjSRpIiLLOsVojjGZjxLEutAViNxoMzqd4TeUyORDWZAfiVkesOQBq6HVmDl/e/WtLROS7J
 y6Ddc6pQIeVnstyEPPMcUlIJ/EiHpjrHVPZk0qgw2n6aws5qwk4yc42JGpvTDqq6B9Fs/26lZzM
 b+rVbqzkUI/ozanLhXchKO8R+KMiIknX+PzGanTOsf8JEGqI9L+8EzDIUJo19FGgAh0XC2rqfps
 +LdiP7WTRQHAq+kOeHLfaMMc+/Z4+Va694urojpYWKDeGx9mAkJm5nKwpmKWY/wEwLfqhcMNhUk
 yGGyrHSK+DGCjpo0v7pi5C4wdmX9fFwKpnC5XRKRBPx7U32ckl29548ZHmXT0RiNAh5tgE5XPOw
 sLX+yJ2IvtsLPSW+g8XAmSA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 383e68b24506..c210aaeb283a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -580,7 +580,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -975,15 +975,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

