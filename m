Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D153BFE4C;
	Fri, 26 Jun 2026 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507309; cv=none; b=VBYXHjL9Tl55My3h6VXTdAN2mq1jIituSj01MwbS9lojQNWfUdh5pLn2rIu5J2Hf2Iz+82N9pJBiKxEfRrrk5w6DLuLlDYAHRYmwnM7j7r4LaaVYeAJIzXR1U160moyQUNa8FYopLoGfg6ytHCDfxAYtkvyWG8Mj/H2CACpSrJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507309; c=relaxed/simple;
	bh=1nHF1vrjaNXH6VxWJ8xbYUrny3B+6HOnTbC9UsQPiUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CX1ZenVhOMNdhU3vy+shnwGb6FSGcvqRqN7QrsG7cQdB6lF4iriZ52MixALqVrKI24f9ojRa/5b2DAwfhsFwj+Bvs/VzBAksi1g15gxJyw/jhzswKlIgLpINTEp+72Z+umBo9EAPbMgzaf8yoFPA2zj/CukiZWEi6XC46aeULqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kNLaLxuO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kNLaLxuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=1nHF1vrjaNXH6VxWJ8xbYUrny3B+6HOnTbC9UsQPiUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kNLaLxuOFDahf/RD0A7UG+SZrqlNJu9EKRGOAAVZaaFDOZt+byKPdXaxGSqGcpZ4h
	 SpS5qtqB3h2m1N8tN/yl2LUjsIomJq3Q2BqzQBgrw08rI9i89ZeQ7CurPAd5bTF9bu
	 QBT9LpEuVwI4wIx0Nxygpu9onus2YPMdaBTxBeqaqXaBdmiMnOe02KbZlOLG4ddBPQ
	 bD7rtXofqNgbH3XQ5oIq0QFNIFgthViWjNqoX4eUKeJWO6I4s2yrKGnLNbdSiWkpcQ
	 7DIyTIeA+V6lvVuxknBFG5cwChZTPXsg9xlvlgN6a5k8rdAnidq+4sshYf2kB97e1d
	 uPMSRIhCZpUwg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFD7D17E1270;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 13EBC480031; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:54:59 +0200
Subject: [PATCH v8 06/29] phy: rockchip: usbdp: Drop seamless DP takeover
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-6-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1nHF1vrjaNXH6VxWJ8xbYUrny3B+6HOnTbC9UsQPiUA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVrcDd9pGLx40GIcnPMFQdfjYzZAJukZ
 oEs5fq1+0WHRokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qakkMQAJsmLpk5yiZKcUP5L+SHN9M/nrx1QT+6PnzKk0T1s7CltqMrycoE81zZw0W/r+Dn7cI
 wfbCHUHnrJHhWWu3FCROZcmuhdo+eushp9DTctYIeAB1FIY/peYhZLi5GKkN5Od+pYNr4Xhp8si
 LnklzD2/cXdwPrXu3tIPpY3HiHy0QYwmw47Rbu03P0Y0AM8Uwn9GE6UXCm+d0mkvXQJKx27LyRj
 32DgVpmySh7bZRRPMp7FMyC+ztePV8wBwdXaTiWmHxQM/RMDWEoKQEQrVb15747YlvnhnQ4pLrD
 uQWPeJ1gObDgC0DvlMbYdAzoFXQ3ekYUdVVo6FmPUy6sjF+hS4ODo/E5HU0fTNep+u4JiolvR8w
 PfbTTFOqxrBVIIJkWqMn2MHqJz0VZd346t738e7Agn4ZLaOj9xClj8C1lw2d37JXXGzSB0qzS+F
 yxmEvd+WngwPpiVDgf8hZ1lMQ0JUnkzTAiT+CJksif7da3cIZYIg7BAdNA143gMK6lN2uoF8Znr
 UqRgA4W0mu2DM0sSd5vCelgc+GMoE6MnrmR/3ggIt9TStxwEcIvFa3nItAC3nXFPC2Q4z+U5BGj
 bn8AxYrGfX0eD3RWVTmQ06m7RmTKEjpKsZHgxU81hYxBzRUZIeQ4WaKuJwXUvVgEzrO8vDN1LCp
 fljNRnd08BOVT4vvJUt8trw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the DRM drivers do not support seamless DP takeover and I'm
I'm not aware of any bootloader implementing this feature either.

In any case this feature would be limited to boards using the USBDP PHY
for a DP or eDP connection instead of the more commonly USB-C connector.
With USB-C's DP AltMode a seamless DP takeover requires handing over the
state of the TCPM state machine from the bootloader to the kernel. This
in turn requires a huge amount of work to keep the state machine
implementations synchronized. It's very unlikely we will see somebody
implementing that in the foreseeable future.

As the current code is obviously buggy and untested, let's simply drop
support for seamless DP takeover. It can be re-implemented cleanly once
somebody adds all missing bits.

Technically the VOP side should be disabled first to avoid data being
send to an unpowered PHY from the running pipeline. As a workaround this
force disables HPD. I'm not sure if this would be good enough, but cannot
test as there is no support in the bootloaders known to me and my test
boards route USBDP to USB-C connectors.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..f7ff55f03b7c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -926,6 +926,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 
 static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 {
+	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 	u32 value;
 
@@ -938,10 +939,12 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 	rk_udphy_reset_deassert_all(udphy);
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
-	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
+	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value)) {
+		dev_info(udphy->dev, "Started with DP PHY pre-enabled; seamless takeover unsupported\n");
+		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, false);
+	}
+
+	rk_udphy_disable(udphy);
 
 	return 0;
 }

-- 
2.53.0

