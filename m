Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E73BED26;
	Fri, 26 Jun 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507743; cv=none; b=DbGHWv7yjCKbS1SBaEZVGZjjzmAoi33ESHcQkzvoJPzMPaL8I3kbI0pxpDJiC/7PJD9hERRfM3l5qME6GGGjqEKZ90USYUeSTFkN8ZalHjnp0BRJk7gZD3f7t+2dnshQjgpNE6C7+pszTrRPPVU9e6Va1v5P6J2+RtuX2HZFGbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507743; c=relaxed/simple;
	bh=w1EzhJbw1+CWxWELSy/0FMh3qpMPSygun3ROkr+XLhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kieNDIINIKPBvWsQRr6N5fa+MiEE9O+XqZ7vgQlT8w2Gk2AsMr3MVmiXSo1c3NrrLsmIYJFk5mcCcGRDbMPRt1Z9USwIqNOLLeorEiWFWbDoVPvMrL61eVPVTT+D+rpxT/uLPjbRPmuaOdE3F875f2IFrnXgsNCWdHz3TWq++1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WKXx7UF8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WKXx7UF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507740;
	bh=w1EzhJbw1+CWxWELSy/0FMh3qpMPSygun3ROkr+XLhU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WKXx7UF84H4mgAwlSbvrjK7opn9VPbscrBUDlfmB5ko4aBhG3pwxGWm1ghwnGphfH
	 jHZkOPc1o3LJiyeRUjJuksgdTrlgSBMrmLdubSXioDaPAh7p8fJbGPMkjpv16jIDmn
	 5Vlx6V9vnosRWLaaHqA2j4OMZBnT7CE1f0cJNOYNQevGBGldQ7kmKl4I1ut593jBjb
	 +2P/Z+yRo8d1zgsVwta+NHXG9tKKChOSNDAjhFJzVjfOSIh0P9fpt+Lb6/1mo8u18n
	 FLKRfTvUwk7jBKev5oTd2LrQpttAZbVI8QgyaPZi14qsrnljGIKSa+BAoCf9PQ4P9H
	 qTpPTMvgWPSMw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0349D17E0CA9;
	Fri, 26 Jun 2026 23:02:20 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 27375480064; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:12 +0200
Subject: [PATCH v8 19/29] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-19-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=w1EzhJbw1+CWxWELSy/0FMh3qpMPSygun3ROkr+XLhU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUrCOcXxbymT1JUV0lC13AlwplY7Pors
 pKXXDEANT8huYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaS3oP/0PvXXlW8r90mBLY1wQAlxW7TM/hqx5KYsakhMvmK1ipHlhc85TzfYQuOV06LmX2NYi
 dqh8qq+7ZJo9W9zmXQUqDkB21JSKNZ4iUuQXujCiU5NSEC/3nIQz5rVGAhCml/NwL01pO0J7jAi
 /397MAwN8egdMLm/6qxGEhpIJ+l5ZSUw96yvUFKmJe7XNTESyDA/hjOn9yp5z+WrB61rUkG3S4i
 d6HPYPWE6WoaiOTKxxprdtiiaYf3HV5OsKF8YQ1Q3C5XO8pX0ndmF8tzadU7mN9D7NXESYMyty/
 OmQ4G4Icc3G8233Ah+7Jfe2TCQHlAlqG2Fm97vBGd9OGMZMWtn9DnS4iKo8myzH0Q/pnIsCbc+5
 sOiW+X/NVAnf0sdyQl3THgOBkDQVXeK1p4fG1um03C2HAsRLvVasdXc4/7PN9cYuVS9hNbBTPud
 jMQFNW7quaZ/Vq8rv2BxrCN3S5ihk0yQ6L81P+r1wQK82IuswRrCNpMg9QS3Z1tm6aRBs84Q81l
 wvL1c1FfPnRm5WBsC0kz6TeygQFOCO6EijVYcs2paRjpWe5IwatU1BPhP4hJTtp5/pMNgRjRMhm
 +ByPNwsqNB7Fl/vvp0iwnMtwHHYsSsD+kiu3So5YC1GH/XG03v8KaSqQfAPn7sj+Ei1aED1WnZr
 HaWDYTmTMLa2VcWldwI8pRA==
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
index 731e487db57e..1bb22fc18c9f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -172,7 +172,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -584,7 +584,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -985,15 +985,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
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

