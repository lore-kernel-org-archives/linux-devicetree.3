Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D5837F8C2;
	Wed, 17 Jun 2026 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722334; cv=none; b=pNVAzQp4WnQbUix2+uAAH7ITRk8IGaaN1VQQZeXhmAbioCPcaJ0xyP74IJFiMuB2OchdPpNsW2AzESY6f/pSQKD19pVpzRMWMnloPJeRf7+hsVmYx2txqCtgraKX5kUuPzJHA0fqnFd9gw04EaG6E6hHRU/iZ1SoeNp+XWd6T0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722334; c=relaxed/simple;
	bh=JH1vTgjVkIdJAE1r7RblhvR/FnaEHviWfsVAbDTzpzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9zOaLrk/TFWQYVyVTO3mxYWqlsSrGzXEW7XNgRen6mOd8kPQ3pU5YxJXQ5BsRxJ3icfRAs2klaRVDmftwEIEvgOacsKNqyzjXSHJIUS9GWK6R/6MmPgp9WZnf9f+VgMYfZQreEy39oM/jja0APHWtuQMYAwLCwCGhUfrGtbdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RK7GLsUG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RK7GLsUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781722324;
	bh=JH1vTgjVkIdJAE1r7RblhvR/FnaEHviWfsVAbDTzpzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RK7GLsUGjMBUNNBx6aVGWy8nHM2gjt5W1b01zVfNSX+rupWW7YPt5hrxWuckq0CKe
	 7pTFY34EatpiVtMlKqjxhIuzCDgAf4GBTrac5renWFP4gNK8yufxGlqwF9/yTEoB/n
	 MxZVJU6PBtdwO4hnnd/OQmc5NrOA8Fg6dgjxQKXRQdHvTfsRItN9M30k426UP7XtWW
	 UNqh30J7ZkE2zT9DiUC3itHBi0sjVzCqZsmkgPE89MviihFoNbsUDg2uxvCBl81kGB
	 S/noXvOeGKcVMtgg+jEV/7efqSjStNGxpZpD4ln08KEa8VsBATc3YmIHovptWddLlQ
	 oEGIM67C368Iw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1753117E1024;
	Wed, 17 Jun 2026 20:52:04 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 17 Jun 2026 21:52:00 +0300
Subject: [PATCH 7/9] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output
 format
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-dw-hdmi-qp-yuv-v1-7-a665cfd06d7d@collabora.com>
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

Rockchip DW HDMI QP encoder supports YUV 4:2:2 output through
ROCKCHIP_OUT_MODE_YUV422, but was limited to 8-bit depth via
MEDIA_BUS_FMT_UYVY8_1X16.  Add support for its 10-bit counterpart
MEDIA_BUS_FMT_UYVY10_1X20, which carries two 10-bit components per clock
cycle on a 20-bit wide bus.

YUV 4:2:2 always transmits two 12-bit components per pixel, regardless
of the color depth.  From a clock-rate perspective this is equivalent to
three 8-bit RGB components, so configure the HDMI PHY with 8 bpc when
YUV 4:2:2 is in use to keep its output clock aligned with the TMDS
character rate.  Otherwise the PHY PLL output would be scaled by bpc/8
for higher color depths, producing a clock rate that confuses downstream
consumers such as the VOP2 display controller.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 815f9ea7bcbe..3a1c027aa90b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -216,6 +216,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
 		s->output_mode = ROCKCHIP_OUT_MODE_YUV422;
 		break;
 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
@@ -227,7 +228,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	}
 
 	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
-	phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
+	/*
+	 * YUV422 always transmits two 12-bit components per clock cycle,
+	 * regardless of the color depth, which from a rate perspective is
+	 * equivalent to three 8-bit RGB components.  Force 8 bpc here to
+	 * keep the PHY PLL output aligned with the TMDS character rate.
+	 */
+	phy_cfg.hdmi.bpc = (s->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
+				8 : conn_state->hdmi.output_bpc);
 
 	ret = phy_configure(hdmi->phy, &phy_cfg);
 	if (!ret) {

-- 
2.54.0

