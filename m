Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18C432E8D;
	Fri, 31 Jul 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508936; cv=none; b=UHjYGSko1PMW6DwcJsHGG3xYSNZdccS55+dcEv3cuAX/Vj8W5dockUCpHA8CzeJBjRkZ0N79g27o29qOLAGs/SSYzlrlyBOtlF4ObJgIodVY75ja1NY6WXkoDNt/7PyFNljqXRqGCOwT3jh4l583s/dDkcFMILmvkkiHR5WBgCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508936; c=relaxed/simple;
	bh=HDp7nK6Q5ULqvUMHN4amMM3wrIPnRYnDAFvGiKrp42s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdpXTe7CJ4rHSvPzCSUNUCQVF3U5ecI/aEYHxvdcIMoes3D14HU5iFLSd2LGDcl5Q3pf19WeKZ2FqRZPso0DKx1jEb2u3jKl3XqknDp6si5/xPs/ssnG7omTI3LngGV+OgP+TmSw1VIggQUmDST1YpCjMXqgWDnXtsOurBrNlTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=e2aehKyE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="e2aehKyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508929;
	bh=HDp7nK6Q5ULqvUMHN4amMM3wrIPnRYnDAFvGiKrp42s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e2aehKyEQY+4Pa1UgvmiWPKcLp4256XZKpKB0paebi6pC/DcRla2osyTHxKR9jHQB
	 TOQaaoEOrNJAiN6pTAzFuqJvyLCPwwdEwRkpI7ztCEfkZiwZw1n1Faf6IFOQF9BlzI
	 jFeWUsP5g8FlLNJ62lZbxZlX3zzybwTKl1+KYX2PaKxugjLR6F/ft8zkvSyhpKB290
	 yGEhxIw/Lovd5icy2XSCO0VIHzuKAAh+QtqcuQqbjpTgpwDxe51IjPAdgRjbS/olHo
	 Eif4EbzbutUUWSjb0uXQh1Gb1ko6FjtBfvHmLvm+MPqH5SGfbbzcOehyjcAkyAnQ6b
	 ZBoXmhJwvCy/w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96BD817E08F7;
	Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 03481480031; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:10 +0200
Subject: [PATCH v8 05/21] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-5-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HDp7nK6Q5ULqvUMHN4amMM3wrIPnRYnDAFvGiKrp42s=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEDr/fxLc89mjUc98AaCNJ+R3wFwdbd1g
 5YktnJKiGPykokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qaLZkQAJF3b9OgbX6/HNQnij3d5sKUhgT+KGEksimXz70PoXQclAtTFt3QnRhLps/UPkvOPDF
 0gDVfuK6jbzfhuyfYC0dQYwJUbEchXBdJTbfk4nhnZMYzS1hb24e6+eyhJvMIwUQQNtmIqT4X+3
 3DRM7QkA8o0qq3YNbfgTSJIPLpTeVqJzQmlMtnmiF26yP4tifuWCLvylBq/DBv11Mb7onHUdOFr
 bHTvKdAoA5bOlMX5N4ErPMEdNVl4WZe+zzsN5M1mqMpHRCmoDwB3ZrPahLPMuGKS+w0cEAsGZN3
 gDfoZqCWVrb7rBrsaN4i9e1QYQ5Nr6x6jKWIN5o9pCkhJ9AaPKALJ2ytF0BdtjA/4Q9wsOYhM39
 IzA0uPhELX+WLr53L7BgIIN8cPZi8Wr6N5puxkQqe9WJALTZ9Rb9omsMCboyUdZndG6HV9CIX1P
 SwpuYoeRuavkWvC1YMNWvv6U3yTRKPMCTvpl2ayxSYvBFo1yTVVYpGXprRwCDgKDozheO2N/Uxq
 ZdIavjoAMmToUGhEBWdt1OCz46JGE4oI29VAqip2gH+eSUoSOXZ1rYi09Pt+2RnalIJFSdEa3rH
 6xlWluXORSh90Bo+Ch3xzJisamG3ozH3Vn0/aKNRcQM/8nX2iCB7iihpX6hXg+vdOgkDiGeKW2C
 3JU2D6EMDR80+H4nrlsglBg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index a8ae13cf91d6..f373643a9cc1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2027,9 +2027,12 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	dp->pixel_mode = plat_data->pixel_mode;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
-	mutex_init(&dp->irq_lock);
 	init_completion(&dp->complete);
 
+	ret = devm_mutex_init(dev, &dp->irq_lock);
+	if (ret)
+		return ERR_PTR(ret);
+
 	res = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(res))
 		return ERR_CAST(res);

-- 
2.53.0

