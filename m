Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFB237EFFB;
	Wed, 17 Jun 2026 18:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722334; cv=none; b=bG2SJo5OUtMufXaQixPpjVdG/4BUMpGQ60VVwdRYF+YLkKGvdw5qdmiJFHEUt87ypNJKUdW7+A5S0Y9Gfz/JJa5GjC+k1z9jc16Fb6ODjawoVsQ+0IvSQOFQPNfHrxRriFMhBifLsexOQabO+zU+7F/XjRpIPp6gbEVZkmA86Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722334; c=relaxed/simple;
	bh=SsYb54x0tancRWbNRMe9tudgkZipWAm8nxe1GklgbkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WG3QN729NplVZ69FCzIBWC0OE0++XIhdib6YHueAHjM4mnwk8ayBlXDIB7Rw4WY0CmUxt8x3LG3MesUAKUNHNiCPK9kYYhovfai6rUn0d+TkyHE5A+b00LoOGGYZJ4EXN0Z5YVuo+zdJjJqnkhLneIypgQhsPxq1YnbBli8QBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VRVkRt58; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VRVkRt58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781722325;
	bh=SsYb54x0tancRWbNRMe9tudgkZipWAm8nxe1GklgbkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VRVkRt58jd5iw9GVAiv25VuwgZ/sVL5HEYqLUGCjzCx4HsTnqSazwV/3U38v7DrPL
	 1woS8AcjnthCf7sOx0Gw4WrH41yftJcDRjKz1L0TtBBSiXwXTLyX+ycY/HMP4l9OoU
	 FrqrxyWEp1hAM7p2JPKU0Yi8Sog9ayuL44dCwNAADg7cLzPvGNRtBIp/kXjV5bkPA2
	 PQC5f6Ccw9BGQy1JcamcTsaSN0fRyLWRAi5d3JaBAkVwxDMkWiLSvVwC3yepYhx80k
	 u3EALlTB0T5WpU0JVb3assgNQdXLTbgOKvMMoT7nUy5bjUblOLWSp8kIHPPKK1UU8N
	 2My6o+wKlqy1A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5CF817E120F;
	Wed, 17 Jun 2026 20:52:04 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 17 Jun 2026 21:52:01 +0300
Subject: [PATCH 8/9] drm/rockchip: dw_hdmi_qp: Enable YUV420 output format
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-dw-hdmi-qp-yuv-v1-8-a665cfd06d7d@collabora.com>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
color format, and the required bus-format handling and VOP2 support are
already in place.  Advertise it via the platform supported formats so
the HDMI core can select it.

YUV420 halves the TMDS bandwidth compared to RGB/YUV444, which enables
high-resolution modes such as 4K@60Hz on links that cannot otherwise
carry the full-bandwidth signal.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 3a1c027aa90b..e29522afc6f0 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -612,7 +612,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	plat_data.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
 				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
-				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);

-- 
2.54.0

