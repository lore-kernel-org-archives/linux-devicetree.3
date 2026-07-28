Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F553B8BD8;
	Tue, 28 Jul 2026 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260450; cv=none; b=h2ITQm3DAglB5LGEdG5Z8O16GqHiGS0LFP0U5ZIAeh+Yp3KGRS1PGeQcXR0Fhzr+wP4Gvxpxea+VzG0qsTZbetooWItpX/bg0qBXb106O/kidYCwo4T0j+3gXaJspxZfZ+F0uIbrjnY4Duc/1XRbgFdWejQc7o5osmUuBxUgIkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260450; c=relaxed/simple;
	bh=OX2jzq6LTYnokROmR6vmx/MpA8RbT9nBSteYSjgWJCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RCuTeI9rjZSaomqjfTSk/mmRdbMUr5/q3DoiKjWw/MVQ1l5xkxfLs8UDIH2uRaqijyuijKNq/FqdX0ybCxKraYCk9v1RnJWCMLh16sH/0xlZjc97/3b8G5Yj5/9K9MQHqBUC1R0Z4jxwA0k1Hrj1aVA6BHwDpwj8v54UuDJE6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LFMOwsmd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LFMOwsmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260446;
	bh=OX2jzq6LTYnokROmR6vmx/MpA8RbT9nBSteYSjgWJCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LFMOwsmd39+wWTlz+v6wCu/Lej0zYyHG3YrCC8M0Eqp73au6KCZkqkwKCNM1gpzYr
	 yJqRnahWrlSRT5DiA+guRfZu6h227BV8we67ZcQ7fRYxANScaQ0BmK0TiNdzni9kYK
	 /Li3AfC9EcO7/UbC3cHTAb7f9yRm8rYq8o8L5oCGCRSzQNSMlpXcgMEAdf4SI4+BB3
	 amZy1JLO3trxl40/JccYv7tNweiEjjPsNFpxf299gdxLdmqQKuZoiSw5U9sU7GOAaI
	 RDNAaFQmY9UIHJG0l9Ki+adz+VB57TVs/9kvrJriG7JfuQ5ZjYT95Ky6ElQzgoQRPV
	 n9qRHGBT08KJA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 595D817E0700;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0DD8D48002F; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:39 +0200
Subject: [PATCH v7 03/18] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-3-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=OX2jzq6LTYnokROmR6vmx/MpA8RbT9nBSteYSjgWJCo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z2y8w1RsJUyogyHJbaoJrOfzo3yR401n
 PSoGUh9lAwyc4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qaeqEQAJgknaElleOGsDqJmWaIXJEPj9svC1LU2hxOm9WKUiesqZvc0//DWXo0fPwwI0JLyhN
 51fuaZuTP6fDvXx68aqILDpNT9wKBpxstX1MCQrnRlIcDEOF+mz1WVd5UgMwl4TOxbrY9316IZd
 yE+Vn0aV2is8X7SDVudZliS+7TXdwaaYKs5TPE1nnPKu9RkqZBtm15zwrInStf1aGrD/eCpUeEw
 lFlzSA5xGATHeyWbTS12reQ08AYdTT2DNb4ziZsxjqaU1fnc41M9q+QMTNnBPMpuDQLRZyhQvJ2
 rR+zRifG+3NuB/AKTUtMjVCMBxqesDS9zgI2hBg3YRGMdQfaHSD78yi0OlWTNnmM+vYTdR645US
 IDOr2nxc4a3t7m4+hl8uVNffpcuwh611SYpaGIG9HQ05t9MeYUrs8Soyv3WldE1fgs1RM8kPmux
 SYoLxNvAbhCeAsbwLGvnoDP0cq6PqFpLBvISOAJnPYJzhQzK5j5LIiSSVjEZsumudcz2bX/fPKs
 nAGZ7cX9/VffcvZzuNSs7d3zRxAoG+vwXOxOmYwQ7fSLpY6MoXALjPJc8KhE8qp4FFZ1QTHrlSy
 oY9IFriJyx1BZNY1ojz7C6k3ijo2ZPGkBVcxJcNeyh6tL3SdwIELuQJg159GU9QU1gUoqjjkVcM
 oDlO6+cRTJ7TBmaZkZ+As3Q==
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
index 8393f9c9b0f0..ca7ff544d243 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2028,10 +2028,13 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	if (ret)
 		return ERR_PTR(ret);
 
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

