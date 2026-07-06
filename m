Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D0B32ED24;
	Mon,  6 Jul 2026 19:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366367; cv=none; b=Z6pZ4ByNugMbg7RaFpvp3Zd6BHn9J53moCkFxe94e9WV+BWMDPTArjOp9y5E0ZHIlMJ9bbEWwhGrL7+DeJrEDypdHsjN+N2MNq6cym5j/GeI62iiYRhYrDsG89KchD1dVxpT/nUHpnRtlI9Hboe/RDIv9zj6AU58xt8br2Np+ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366367; c=relaxed/simple;
	bh=bZPRTZpe5ZjtalfVUWXc14ZVW4M11P4U3Z/sdB7xUCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q3Dc1+JCKhVNMC1+sXuA9UvESsEB/xw3twN0WwGLSG2AkfgO38UIOqpXjMDlIi/gb8H+qvXbWWikPduIuhKzpdmH/hyLn5DPgPD6kqoWK+oiXOr8wBd7vny9PsxmkF6FPWY7dGNQsij7fRgOOiZXZ/PT5PBQ34JC/XWp4IjCe0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Uo4ChzK8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Uo4ChzK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783366362;
	bh=bZPRTZpe5ZjtalfVUWXc14ZVW4M11P4U3Z/sdB7xUCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Uo4ChzK8zl1ERgdqLL2FEfCBmjbL055MmNVs3LeLTeETKcBxNnq9WfpJHHhuPlVyV
	 gluVRZn6S3b6OmQd0WJ16JVKj90omXE7/6+S4/T2OEDUM3HjD53S/fHYushqYfwy37
	 4B0l95dppEtVkSl52XS8LZwq5t3QW7/U9pLxt9appkcGXNlpXNsk4oU9CZCNzZO70e
	 +j6K09L3iN2Y54BKfNsKT8sHj45Klve01adG75kvDXXUY5lmH1b8XJJ7MjrJFec0mI
	 sWLPKQ/Al7JEF08LOeDEXSCsO6zJu2E0c7Ad0rx2fPHJcuUbCqOVe8+pDNkTRgyo2l
	 juMXg7Mj9PPng==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BA7017E1515;
	Mon, 06 Jul 2026 21:32:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 06 Jul 2026 22:32:24 +0300
Subject: [PATCH v2 12/13] drm/rockchip: dw_hdmi_qp: Enable YUV420 output
 format
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dw-hdmi-qp-yuv-v2-12-b91beb33dedf@collabora.com>
References: <20260706-dw-hdmi-qp-yuv-v2-0-b91beb33dedf@collabora.com>
In-Reply-To: <20260706-dw-hdmi-qp-yuv-v2-0-b91beb33dedf@collabora.com>
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
index 78473f9a0fce..1af29066a0a3 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -611,7 +611,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	plat_data.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
 				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
-				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);

-- 
2.54.0

