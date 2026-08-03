Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE41437456;
	Mon,  3 Aug 2026 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780311; cv=none; b=VaJyWy7qadOIKK3xcIH6qWVVrMJ7xuZm7UVyM2LytZWhbHeDcscYvEKUiik/XNurfCsKq6gTiJmjSR9B8/r7fc0839BC1BiqqppqAY1B21GltErpEJeOzn2TehueoaB+t8PHnL3ZhdS7F5c/G3QjheUpRX2v+j31d9fDWm+zwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780311; c=relaxed/simple;
	bh=0v+PxdjpHW4h3oTbY1aMZqJNHKlUwANCX2XcVTK3J3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDDGKt7ccCXJvAmwqrh+MBkUk0UDWyfzE786P692UE850HtZlktD5t26kNXIKWyn0JT/xhw1yDObJtXTCMf2oVGzVcy9uGj6nQPRq6jqP8zARtOAJPGbjqIPoJwf7ZNMWCC0RrTA0TYS0UwIplSDOgoaOaHj+7m6evcDcpQmFY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EGDis56U; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EGDis56U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785780304;
	bh=0v+PxdjpHW4h3oTbY1aMZqJNHKlUwANCX2XcVTK3J3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EGDis56UIC5qyG1cFE4oepqmAt3oPFfKE+y76TNPz0Xvax+Px3N4RMI+MPwTDA8zn
	 7F2fNus2Wbeno5CfnTCcYeO15fiBRssQnvG/ZSTY9VGClZc0TlVq8KZpiO/rLA0DcM
	 aeeI7JXYiXSj4shagp4qF6Aa26oRfINARcEWujWuD0SAAXH1cAQxZyqDpZPyXDqRR7
	 ZOGnr2nluAVFG8+EEBZ0Ogij1Z42JTa4WwOGTrvHZHdrX2uVQV15a8Jyms7AYSI7Ky
	 tI0pIkMTEVXtoWQmTwARZIGlSph1QNRxGJhShAKJZVHQvxHX5doKI0HYhQmqnA+DA5
	 X2B8aLolzD8KQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FE9317E10BC;
	Mon, 03 Aug 2026 20:05:04 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 68EDB480035; Mon, 03 Aug 2026 20:05:03 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 03 Aug 2026 20:05:07 +0200
Subject: [PATCH v9 06/22] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-synopsys-dw-dp-improvements-v9-6-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
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
 bh=0v+PxdjpHW4h3oTbY1aMZqJNHKlUwANCX2XcVTK3J3I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpw2E5UBZDC904i2kVSP/eGlEpm3MrxGSNOY
 X8/9JRzs0Ajz4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqcNhOAAoJENju1/PI
 O/qaMscP/1bWEh7KpG7yuSW61iQTIMqOBJCO8vpY4xiyp/dG9lE8e8ZFZTJkYRjlJsygNJCyT8Z
 zwt+AuS3ZGRQ3WMzbjx3OnChdN/Go2lDOuDhS4As72n+zgx9N36z4fPXvqAejw0X81rnjs8XrZ1
 U4X5F4rON8OzZI2ulwVGY85aLl4vASosRpZ1ItW2W+y3iWzu1QFrtroskJmt3hNtdkSDRkw/KqW
 x3eKprsLfeRRyv4b5TxGBC4vj6Rds7jjTxSuVKZ90efKz4b9dv0EjZpguUFOvP13EPH/JGDR5QD
 TN4tMrf/LUeTfrehLYeZ7WJ3+TzV02VdrAGfW5hzyr74ukEe/3v80jn7y6rjrfuI4cFKoBrcCQd
 ze0FXbxlbZKrooBoSfREUkfHJDqx2jsVKryAnqPFDCv9ekMBkYHzfAdOklZQr8jFc60Kp6sLdbg
 wX14XLkz/tk20hxnpU3zwy9aLyfDAkcJx/FMWEF5vW9flkKQ3OlWNS+7tGzkK/JZ93Jh4fLCdzA
 XSnEedys8OMFWDNrXRnIM0u4h5/GmH6NPmHul9o/rQ0qiH2PB5S4O8uY9ZaUorwLdAG6hQ8BTyA
 ByDl4kK/wqW6YCWh5o43CN5sWyraqWR14tNHeN+9COrPrmLJo1nV/dmJF2iK1mWL50pWSr9ZJ1h
 NLt6xhBqDIE+DfthGh7E5HQ==
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
index facd1c479992..af3fa7886429 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2039,9 +2039,12 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
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

