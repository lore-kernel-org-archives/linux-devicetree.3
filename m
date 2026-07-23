Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE39E30F548;
	Thu, 23 Jul 2026 22:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845051; cv=none; b=uMtH5SC9SXsGTO9lpaDL6iKqY2AWoSzyLgi0apizdJ7Bl1vTZBEZxrED0RrjUzk79N4ez+lBn7JJRjO7wvZYCzR6nr8c5QIi4/6NNteRcxhjBEXcPfRf7W322tNv+CfP6L3ipevHdINIIbrwBEVpocbhQqUCKq/hhtAzqakm/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845051; c=relaxed/simple;
	bh=jeWM9ZuBdRXow1lN7QNQeJneeNo//Es7iVqVebEQ8cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fk2PQjYL2GEgO4ngaAh+EUkeYE/DLW95JBOZus9SQ/crRJl1H32T/0bBWDqfaIbMw0r67FfxTwH0CO7aWfCJKYNEh1QR5eIayE17qapAyr07NzRn1HEnM80Dg2R0vFD60/puPFpmb5G/MlloCIm9nq59GaLevtTiTP2wSUQ51aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y6Gk2N2D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y6Gk2N2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845042;
	bh=jeWM9ZuBdRXow1lN7QNQeJneeNo//Es7iVqVebEQ8cY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y6Gk2N2DhPm3iVoNYPd0oLeFx9xS0LNf8zl27rJnjzfhGmSUKscV6dcvriXUzj9q+
	 smmi8L2GL6M0XrN+9UoxdUXOXGtsg+NmxToiBj0NaonCalKR9CRGyAQ5FYZ6pSiXtB
	 yQkucpGO8H5zr+ITAyLZkVODa0yB3zrX/tweygu8k6NwlJtLf4RlUilU//zeoyHxjI
	 KLecxqE7b5Umunl8wgjS4scHF5+zEMWBb5sIv+Kxbw5vnjMTktJb7tBAr1oF5EWIaC
	 ULEBcbSFCikjVoBEwFORRh1PfoV3LmG94b8Y2636J3U7ULW0ZKFCafKSXhPNoSkaeL
	 D9+NsMxk342zw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 585F517E374A;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F1B648002F; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:11 +0200
Subject: [PATCH v5 03/15] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-3-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jeWM9ZuBdRXow1lN7QNQeJneeNo//Es7iVqVebEQ8cY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvFPvo2ZIkJ8uLZPCJzc6vi15qDRM98JN
 iMUI5MxtaDdt4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qar94QAKMabvQ5SACPBz3BeZ0iSQQz1+2BImnHCxL1/Kf9RiEwR2QnECLvik1LtYn2YQMgD+8
 FAGhQL/gAPGYIx89JG44TPUoSh5vHl900v7Hn7V72i/3zwVDWyHh4zFHAwsYpEANk6f4Ujfjtcx
 JCsfioCAV16caRPUpJWEVF6wj+zEDbtJgTjrb1k8olPyj+SrWJDkwn61xygba/iN0sUM8Mh7TEx
 p4JMm8ySXG6XiewPNspApp+S66n3JvVzYZiROroiqVWQSkr5BcgEfIdVfz3qFi2GvAfqJDNt96j
 UPtpW2S2p6VKsi6kxXdBQGjSikJsofxKf6/nVPMorAGFi475y8Q8sU+46CxjnCoMSD9pf4ZownV
 I5g6Lwp92s2JulvH0VGdtU2QxXYvnpheuCKVcAh1dxUhbJ7DNH+W53mx/KkcP24l6NDeCvotXhi
 vzDkCvJtHNmiTXxwwGu1yiBgCz7Yvru7xF272J3aOmzwHI1w9gkNeILFBk+OvWouB9D0wVtcB9c
 orXHOMzmTDTPspAFNPD6TgT+vVAgBfJGlBpnno+Mrk3r1UBZH57tPKmyhXxM6Ym0PqFglCO431X
 TPmqqJCXxGoTUJEEgnHIbFdUrRAAs2ea4jj8m41GTEHrzDeFN6+0UZJeOvWC0nXs2ihdVWzVizr
 iXAa/Ov6gVFzheGCDdPkvOg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up. This is only relevant when CONFIG_DEBUG_MUTEXES
is set, so not worth a Fixes tag.

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

