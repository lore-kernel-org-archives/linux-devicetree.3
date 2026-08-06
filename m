Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3C43783B5;
	Thu,  6 Aug 2026 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785976754; cv=none; b=F0QEoftjMtwtWHvpnAUwqE/z2uHi29snAk67VmwSHNqSn+hL90uzK1zjBMhNnDY+4iBGLBkcNwtB8XJq6GzxlRyVmcIgo5MhKMGRLOQLdv8m60pXFfwWSWoKJLbZxW93j2Csn07zQl+4o1ub85L0UV5GpIsBYlPa04O5jpc9oCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785976754; c=relaxed/simple;
	bh=AP7eZHdio4vr1je90N8ZUEV+jwBf45eOCcTIFRIldAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/BGhZZKFI8bsFUEo2ggtl223PPoLSHEzbbfLsyG7jhEbfm/FkEggN6DK1VjOwUerVSov0DnTlV316sj+r2PmhygCmujjA3zkbAEkWuATSAHu2PH/wTzSp0E1O7UYIr3pj4SC9JKjv2piyQvjlBTqtFbQTKYI6Nj2D+FoO3USkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i0HgLfHC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i0HgLfHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=AP7eZHdio4vr1je90N8ZUEV+jwBf45eOCcTIFRIldAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i0HgLfHCRm7qYesBa3vPxul0ZC8HHSXHfQbJGnHP2v3n7KmbYsjquR0nj8+GcXmwg
	 pnrjl64R7KH7zjskpP0VIvFi+tQbpV4O31oSddeVN6gS/G9KRNJdZBo7OAZVJTZOSf
	 0/vxvMORqygzSEdSHoN2dJgRXGZbGg2T5qcnjD/nkQUukZ0onmEU36AAxdvDBx3FpW
	 gpu9c2TJFd7W+UmNWOA5KTcha9QX8lTJsiwGDHlBgMNYCoXMihVY1WNA7AsbqXKuwC
	 WRf9enJW+xcyGCCUJy0Gq2AVGFT8Hyr9eDQgc+ccj7JpmloKAFupUqwCN4ngZZaCKa
	 qc5y9o74XGrdw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D682017E07B2;
	Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8A08D48002F; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:09 +0200
Subject: [PATCH v10 03/21] drm/bridge: synopsys: dw-dp: Fix error handling
 for DP link enablement
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-3-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AP7eZHdio4vr1je90N8ZUEV+jwBf45eOCcTIFRIldAQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz161UODfVa+7Q+fOqoYnv8CPLiO/f3EaSA
 88OV5aDIwyRTYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9etAAoJENju1/PI
 O/qa/LUP/AjRSyKo+9xZHWecuS69Qf0FQqlO9W4NU0R7iNDWwVvwkfMsSM9xFtqj+1ZZrHMpAem
 yQSd15+PUeKtoo49aVJZ3KMAWFuoCxChdrCchd5/QW6gjDNJV+xKIG0Ikhp+/MCfXR9hEboPgjd
 Nji0lljpQ5Nny/+Vp/Syvwls0FqIThV0GUVWroICEGk8V14bl1ji2okDlQHdKXlTRnFofuNihhk
 GqMIfcb0EjdezOMUf8BqANOh3RnQU3DmoXiR0LQKi/B8N/K4oqEra0O+4aqtDBp1SsrsEBxlrvb
 o8L6t8E4d+Y7YNpLQ2Olntd/yhMJmWCG3NxBqbBt3xdZatul+UCeAMcqINwk7h8Zk9GUy2kgWDX
 y+AKEC4xI2iEyM9CHGV591T9y8zItU8IvG/Udf6dRwatXwWxouvaTvmhHELMi1pOYyZW8JaJtf6
 z1jllC0NMRXX0yIVurAYoBYHQxSF82Ovh9tpuHNAKWh9kXDCiz6Z2A9k2Wjv3YYJpK5OqGPQrWX
 foWjCrNpxB5BhRkNPoVfoTEAKFI/veWTfA+N3ZjAg690jlJ36mAZ7zWYGnVhvi/3BkRrId0X9fl
 QiXRa7uuAgtFHUxvBIyoZJ7LN8lBVyL19VTmJaHFkZlObR8+VFrQa/YlITboGfgAhNeGS4b6qCT
 c6zzL/0kgEkavkN33aYwugw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

dw_dp_link_disable() may be called in atomic mode disable even when
dw_dp_link_enable() (or an earlier step) failed during atomic mode
enable as there is no error tracking. This would result in broken PHY
power state.

This is fixed by introducing a new enabled state in the link structure
to ensure the link disabling only happens if it has been properly
enabled in the first place.

The patch also adds missing error handling in dw_dp_link_enable()
itself to ensure the link enablement becomes an atomic operation.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9ed335244442..9d46927ead4d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -280,6 +280,7 @@ struct dw_dp_link {
 	unsigned char revision;
 	unsigned int rate;
 	unsigned int lanes;
+	bool enabled;
 	u8 sink_count;
 	u8 vsc_sdp_supported;
 	struct dw_dp_link_caps caps;
@@ -1615,6 +1616,9 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 {
 	struct dw_dp_link *link = &dp->link;
 
+	if (!link->enabled)
+		return;
+
 	if (dw_dp_hpd_detect(dp))
 		drm_dp_link_power_down(&dp->aux, dp->link.revision);
 
@@ -1624,6 +1628,7 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 
 	link->train.clock_recovered = false;
 	link->train.channel_equalized = false;
+	link->enabled = false;
 }
 
 static int dw_dp_link_enable(struct dw_dp *dp)
@@ -1636,10 +1641,21 @@ static int dw_dp_link_enable(struct dw_dp *dp)
 
 	ret = drm_dp_link_power_up(&dp->aux, dp->link.revision);
 	if (ret < 0)
-		return ret;
+		goto err_phy_power_off;
 
 	ret = dw_dp_link_train(dp);
+	if (ret < 0)
+		goto err_link_power_down;
+
+	dp->link.enabled = true;
 
+	return 0;
+
+err_link_power_down:
+	drm_dp_link_power_down(&dp->aux, dp->link.revision);
+
+err_phy_power_off:
+	phy_power_off(dp->phy);
 	return ret;
 }
 

-- 
2.53.0

