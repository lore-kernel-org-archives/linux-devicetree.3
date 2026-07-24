Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833BA3672AF;
	Fri, 24 Jul 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784916213; cv=none; b=PI/IofusMruh+11FHgB1sWuXnJN7p9aRcSks+ae2d9RsVhqbE+DoFCLOSy9gplKyjGip0UeAuKRVqabpKwMT2nO0ZiFZRkwQHC25obSbdPOeMGJkWru8bMR39HuIm7SyHL7lsNOMng92tNuCDC7xAwu5bZuKu+OM83IjDBKiOls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784916213; c=relaxed/simple;
	bh=K1Za5bWNUcnyTglAfKgP5KR/CLG+7GCG0v3x3t2iK7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgKdaaIZPgnvNC9/yDhCxFubNdLo7h55z3mRQuPd88WucUaiuZDzRbAOPbtqpbAdz8b5qCab12vF3Dy6SOZdN73aJLOAHuSPunAPT6w3Dkln74rLpiiYECA1Q4RoazshRGTtZ6b7XQII0ah5T/SbOMvuhfT0I+3Vea43aLz6GoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hX15Hf/9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hX15Hf/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916209;
	bh=K1Za5bWNUcnyTglAfKgP5KR/CLG+7GCG0v3x3t2iK7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hX15Hf/9X+CVUa51M+H4hMh87dr+fBVbdDaU47SwjNZgs3Z+btzcSB9nPn0eIkHtw
	 h8YuOeiyGtHfxoMH3YGTPYUyXeIM8+8ppLxxsQzgM3k14tuj0qSgZ8YVbptAKcPFxV
	 HRdLxLD80ItpSMWTzAqKR3O8urZnoA0YbUmL5XAw0CW9NUzvoF6gVmiid+nDqFM7sG
	 RFIDDHArANCMIw+0fp0MIkEt0C6tIZ+5cH0weX8fcC1KwYwWYmHWCOZhV3/aySp5rO
	 O/1TQXxumtIuXGJGQSp3yqev+NcDzUJ+1e67Ykix1N6526n/sNpaUGlzXocPBiRPDL
	 j8eXMKxm6dwcg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3240517E0203;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DEBCE48002F; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:25 +0200
Subject: [PATCH v6 03/16] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-3-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=K1Za5bWNUcnyTglAfKgP5KR/CLG+7GCG0v3x3t2iK7c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPDGJdnZhc59GK1KDLRjF9Jl7LYQ91BvS
 bRWTpG6CuDCD4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qa+9cP/ix24EjhRs9MFdFHjZ82uXi6N6SVX5BFk9ZCHGqhbdwr/XovPynmESWgj4k/gkzOCXv
 W/8kMdEQRAnqpJIj5noQRpCq6akOcdQ6Twl5k67poAjtH7BMMYlvoJAMkYr5nx/dxOIrIp3rcLy
 gV1Hoig4MJE/IFQr9RFb2iR/pqTo4XntvkqNM/cq27jo+hy4mNlCCkXbyzHRntJIIIcwCQGKUPA
 wc1vsJbx/g5aEJ3MF/YmPvMciDkOP5g7MvYtNAntuwIm1NuH7hdOKEkQlFIWRzLmHy0DFKRQV/F
 6e0ZjmjIo2nOawjb2I5Vkcq+k4IVc1nSDPzEg0psT5D0dxaZJb7HpjmO7FeJGulTGgXD7AnImRZ
 Yd2mN15thHUTyVRG9J8WFzHnUPsy7/iFV9JIf0xGUs46XGNi78TTRrmo0chkuk+aETXZMKMMXgk
 zef9bByN+xjIJApPKmCawS0M5r0GsNXyk1bzoGEunR9IRuuzltmLfbebVHO8Rfrf4adtF/QHMfd
 2j0jyIdw0POkFYrBBzS8NsyTbLgVg9RGLw25OdwFd+Jd1feaHCsNQNhUxfo3xISwJVJjOEPWdzS
 SjTeeI9c7zLY456ydEUCZZJRMjZHnPtRTopwhp3q6A8hXYTfheMYFfYaNXNDVmtVn6r0dCR7Byt
 rJMNa5DSX4g8ZayQrltknZQ==
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
index 21bd08571dcf..b28040d69fab 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2031,10 +2031,13 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	dp->pixel_mode = plat_data->pixel_mode;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
-	mutex_init(&dp->irq_lock);
 	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
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

