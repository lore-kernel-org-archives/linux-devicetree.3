Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD2133B6F6;
	Mon,  6 Jul 2026 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366362; cv=none; b=KTu4mbjKQIGG7gN9omwAgLaCkIQFAZXdcpIEJXvLjh1jsAVF/pU8FKA+J/Ot4zkCJHR7Ua+YhPjSFMpMqVoPXjftATProYx7k59jm0SBrOBYat+kbWMz1qK912JRBvJtqX2C1HqbGtdpKlt4nc1CPKi205aihd9hVPUUdV9Iv3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366362; c=relaxed/simple;
	bh=dNykNXp+viPq2bT1wMCanGz1rE4qmNwHhygjR8A9FK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSpIQNAOcClhRuKXXSFo5lk6WpS+9uU9AyRuaWk1unH4UnrwkX1FvwFV9I/7WFwe++KYnRufRWJo8JiKvvI2YJmblGNSpd6nhMWtyfW3q/eduRjsHEqnUqpzgID3OgjQ1zBWVC8x5rcWh1V1RiMTnqmcIdWy1qscCoyxOK0wAjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BKWOXHW0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BKWOXHW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783366358;
	bh=dNykNXp+viPq2bT1wMCanGz1rE4qmNwHhygjR8A9FK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BKWOXHW0keYIuOcNKygN3t0UcbTzSjw4bkWcrL+UXg+9yddwumnUzbdIYNgj7yjBN
	 fQvhLTjbN/jWDG3QAfqht1/ztQf3EEA3Ip+UJPM+75rBuxfKSArQZz+WLWQRnVEP5P
	 Avz2fLZGGs3QPKiL8OQkLg/Kfv+jKrk7tPfD7/79cRklf+gCOCjqY6YSjxJPcyYx8e
	 abq1ybCXdftRNuzmdGKaZQptTd7Gv1T/gJEJyrWCgiMaIYlYLS89uBNVfiqB4Z+kzQ
	 Reh+MMsKB2ZKfvly59/8OMtnjbDNaO6+RCuF3LM56g095PHXz2WGa1OVHeW0Dm43W9
	 pSBmfbL0ZAq1A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72A5017E0D6B;
	Mon, 06 Jul 2026 21:32:38 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 06 Jul 2026 22:32:19 +0300
Subject: [PATCH v2 07/13] drm/rockchip: vop2: Avoid DCLK source switch for
 10-bit YUV422 output
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dw-hdmi-qp-yuv-v2-7-b91beb33dedf@collabora.com>
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

Currently the color depth is always factored into the DCLK source
decision for HDMI output, which can break certain modes when operating
with depths greater than 8 bpc.

When the required transmission rate exceeds the 600 MHz limit of the
HDMI PHY PLL, e.g. for 4K@60Hz 10-bit RGB output, VOP2 will normally
fall back to using the less accurate system CRU as a DCLK source,
assuming HDMI 2.1 FRL is supported by the pipeline, otherwise the mode
will be rejected.  For YUV420 output format this never happens, as it
uses half of the RGB bandwidth, hence the rate remains within the PHY
PLL limits.

On the other hand, YUV422 always transmits two 12-bit components per
clock cycle, regardless of the color depth, which from a clock-rate
perspective is equivalent to three 8-bit RGB components.  For example,
4K@60Hz 10-bit YUV422 requires the same bandwidth as 4K@60Hz 8-bit RGB,
typically 594 MHz.  However, VOP2 wrongly assumes it needs 742.5 MHz
(594 * 10 / 8) and ends up switching the DCLK source.

As a consequence, the modes requiring uncommon pixel clocks, such as
those corresponding to fractional refresh rates, will fail.  An example
is 3840x2160@59.94Hz, which would likely rely on the 593.407 MHz clock
rate unsupported by the system CRU.

Note this only affects YUV422 with color depths greater than 8 bpc; for
8-bit YUV422 the 8/bpc factor is unity and the bandwidth check is
already correct.

Prevent the incorrect switches of DCLK source to system CRU for YUV422
output format by forcing 8 bpc when checking the bandwidth.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 036cdcc59e51..8e49997e8cac 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1943,7 +1943,15 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
 	 */
 	if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
-		unsigned int bpc = vcstate->output_bpc ?: 8;
+		/*
+		 * YUV422 always transmits two 12-bit components per clock
+		 * cycle, regardless of the color depth, which from a rate
+		 * perspective is equivalent to three 8-bit RGB components.
+		 * Force 8 bpc here so the bandwidth check reflects the actual
+		 * TMDS rate and avoids an unnecessary DCLK source switch.
+		 */
+		unsigned int bpc = vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
+					8 : (vcstate->output_bpc ?: 8);
 		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8, bpc);
 
 		if (clock <= max_dclk) {

-- 
2.54.0

