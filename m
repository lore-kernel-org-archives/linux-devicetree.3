Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E5330652;
	Fri, 12 Jun 2026 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781287256; cv=none; b=TxYgKh0D8Dd1y23l9vPwg1aO4/QAbcP8oV2sdp7HoxvPJMqP+pwqjINoHzyMIJ4S36QbzIHpBoxkDjIbM3+8URyvT1YFMTb79z0fYS6weYyzhsbH8BbIrnh4SAIKq81Eawh5knio4pfVN7W3yU2DXcbWNhltMbvnRgW8KT00T3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781287256; c=relaxed/simple;
	bh=/D1KN3oWC9criX1aCdLuZegAStVy2nhqzSwDf7l/Nvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kajOMPM2XJCfO8RUe1/rHEYoeuLwCduuLb8sCtIa242QAvXWrkJ/5oeQoGTFt7RktLNgwgX7OP2gVQCe8AYLzvRGrNlq90ePMHcew8mk/K+vvTCbvrPpqk5TxKii9K6kWKzjHb4PWiwXbB8QvONxJgqBZ0mAePEkLlSuz2QQvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f8Swmx4o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f8Swmx4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781287253;
	bh=/D1KN3oWC9criX1aCdLuZegAStVy2nhqzSwDf7l/Nvk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f8Swmx4o7g/FvFgcmAFsTlJgyEojmhI1U3HoA+i9XW1gm5p50F0OcMY/Ojr/HMrwQ
	 9VJeoKN25DBfM7eFcTtiZlIXfOg4kVJdEPJ26Jlw1KqfZlcqQ116dO3FsvRx5JYLqR
	 i4DRCWYPtH4qxJhuE3655Txalb/yykf+hXtoFIJbZNLIYdAcG10Kr/pUVOYybOFAbQ
	 udlbUtLeAN5XCoNm0/A3Oyaj2V3nD6pZzQyiE6WiD5PNP5kFr4C5W2su6jGd4VVouc
	 szKFaYPRtxo/S+0FPETgUo/knpZxLrKi4zjz0bZmKfYZ5RDQdxs0vC+/jTYennt0wi
	 9haJa47ZWiOCw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BAA6017E0CD4;
	Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7B96548002C; Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 20:00:49 +0200
Subject: [PATCH v3 03/10] drm/bridge: synopsys: dw-dp: Add follow-up bridge
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-synopsys-dw-dp-improvements-v3-3-dc61e6352508@collabora.com>
References: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
In-Reply-To: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
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
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/D1KN3oWC9criX1aCdLuZegAStVy2nhqzSwDf7l/Nvk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosSVSAJAYKQHR/fLueDkRvq3aXI2zVmxPNu
 XDv2pcU/zzxcYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLElUAAoJENju1/PI
 O/qaz48QAILXZe4MPvVhYOnlnDi3Sj9Qje32AOoEA9X364HakRtMKit7ypzAh2I42XHo2hIVWg6
 R5+DK10AA6nT6YwD06/ASuDSN7osh9tGSw+0ptUekjwf0VAsuD2n83PqiJl9YpCdzJ9tw3GMZMq
 6TJifAMcqGpKoQqGR6LEnXKCciCyS0lwNtDfZ1QbvKqu//683fHf53y0KfDRnHdYJ7oEQFXx2or
 S0vy2zRL/CYoAeQ9eVeyOPrqvaHiKg0Z8bRRKyUlRYAxF4Qm5ORf4SQAr4zPi8W3YnbZYmDQTMt
 8JF+iMVrM2cZEGIB0e2/IgRSIFnz7DzR3NC9zVvIEN1CK+trhjb4Lw1lsYjQJtOBh/8EYugmaFb
 Obm281xIBKsVAkuj1SmLLx1mEFkX99d0aTBl5RFTBr1ZpTpitj4R3RiRSJhmd5E7eq81eVHLLvn
 Q16EUDVDGzK86wSqHvusZvaK0hLcc9PPyEvUQQkmsyrXM1cwHBA1QWhClppMoT04eTdS/Z5fS8o
 TL3a+V1L/9KgcEk1ZU+5sqH0jKpOZEXLwoBqJ2sHnRI8YdXkMRXH1wKyiCAT8csSFkN8XcL7fzR
 3n66hyBkCC049+pxu5E3Rj2GyD2tSTTYpFawShZ7dZ/O3cdOVmYSQSOuIgUFGOLUYeeArvkRteL
 i7FM6GeDtbGc4L3hGETAptQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index ac7779e42bb2..98cff435dfb8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1970,7 +1970,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dw_dp *dp;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge, *next_bridge;
 	void __iomem *res;
 	int ret;
 
@@ -2064,6 +2064,20 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 		goto unregister_aux;
 	}
 
+	next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(next_bridge)) {
+		ret = PTR_ERR(next_bridge);
+		dev_err_probe(dev, ret, "failed to get follow-up bridge.\n");
+		goto unregister_aux;
+	}
+
+	ret = drm_bridge_attach(encoder, next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to attach next bridge\n");
+		goto unregister_aux;
+	}
+
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);

-- 
2.53.0

