Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D23B3C08;
	Fri, 19 Jun 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882945; cv=none; b=q1KTGad4VvjD4bka3HWuvUn1TFS5yg0IIxAN5jnODDYHSWpQTf0ZKsqOV9m1TdMlK661ySNNdSN0ZVEB7OjjLM3fAIaX8spAikkZuDzTfQrcKkmgeI5xOc5St6+cdFNTuurrYwkOBk/+IEYhDHnznZyERh4XQ6TB8//cjcuqZts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882945; c=relaxed/simple;
	bh=8fwJQNAWVdvQQ5leZl2N4n7wGKmaRAjfyHU/ZtF14xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2l6pW8apaapJNP8zaLhe0s7ox2Jsfr+g2bmzBvp+YQqX3HAPdi7Hz/4HYjNX0yLcy8fJI0t9mG68d8goCdS/om7Nv8tushrMGN+pgRJHxgt291zM1VYL7B20IDXAE4W2oNtk3bRDL12MEvZ5y05mhHBL7ilhMR+cgn1eJy73+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B5zqK5FM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B5zqK5FM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=8fwJQNAWVdvQQ5leZl2N4n7wGKmaRAjfyHU/ZtF14xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B5zqK5FM1ghrXXfgzKqngW/lAZVtDMHXFDTCNzj/M+nPexDnU9i1igIOghx5hwQTZ
	 wkh74HdIJ1dZXaHNNI1AVNfgg6a0H5tCYBPSUPrUMvyWkR8j90uVG1t2VWV8hANapr
	 ygvfC4wvP7wa+F+XhI8wiu669Sef8m+e5fT8hVew+3IbN/MeaX5fQTEI2gLueEwfki
	 /i+w/xF0s3m4SdvxBY/bz0VUwkc5ob3DjVf1fyG9NqZauki/O+agBvdnkGqb2PMjAn
	 0nDJt84MnpzVWlz+Em/FsqiuY27ad+1n/nqwRY3jvfAsZibLuv0g8G6s1oJoaB99pd
	 g1tfRIVKmsD9g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A18617E1531;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 95F8848003D; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:01 +0200
Subject: [PATCH v6 10/23] phy: rockchip: usbdp: Add missing mode_change
 update
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-10-3bb1f54b3f35@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8fwJQNAWVdvQQ5leZl2N4n7wGKmaRAjfyHU/ZtF14xw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDjkHf+p27fxWhrBQvBa0cCWXiR1Bfip9
 ZYVvSlxSoePtYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaWjkQAJdHeTiDokwNUEFCbirLcWa2uk3W20hskVyyecYyanibdHtXbSvcIuCcdZNV1OkqOQ7
 pfmpbWcZTD3T9lCyJcjd8i0oJV0RW3OppprheMpxJkFqaeA8Gqfpc8R4VYJpbSW8Lzf+2/Pd3Bt
 JVwFJ4zTNfWW/382KtLppuYmxjXu5sCTDVz8UBwadjw2sO0CpC2dzYMaWtauGz6mfJn1vV3fArz
 ZuzsKPR8k3+L+tkCnE6K8wmojsQRADjEwlIHxNYT89hGeS3GM0wmf5vw84QciYh8ARwzK4kOsNr
 3DeF5S6G1RQi8UON+1VfNE1NkXMVRpvs2JoM5xrKtOCUTvGepHcny+keU4ZXFWOck39hWwW+ap3
 ld1DVo6hIqT9Qt5yI/rmOI1DNrAcayJjWfRwLgE94wKdijkwgBcvNWjavcY0UZ3k3nHglZ+sQo3
 tjdo8sG2/DamoBuxKszY7CR0VW+tl7cMSWieRvl+NGeIemxDtjquNKwlI2XnFqNJxo70L9bAscM
 w5LD74DAisFDPjAxnJh1vjeQGTTCFV+C9CvLttrVceXC9c8R6z+FXPtAhzMGOL7BDucPIQUscjq
 WiA7q9DW8fb/E+ciAu6wBJcgWNkSab9a9foDFLo4euOejYZF/Ptr7QFiFgbA8315tEZ1E4UtMD+
 8nzdshDS2QqvlNfx0u5YnNg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7ed539d8c791..2ff05ef6eeac 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -619,6 +619,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -649,7 +658,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1388,10 +1397,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0

