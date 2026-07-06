Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E77331EA0;
	Mon,  6 Jul 2026 19:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366361; cv=none; b=m2Gpm9bJD0ZB+JrXpyEkCzPznX4xLHJnFRmYEzTuavUR414Z8QfFzP1y6JdCzmjNHFQRzMEKTAdJ4E7N0WbwwNDH0auDtphf/i43T0rQlRAW7doUTOkioXSjNO/I47dRgFpEfsap7xf6Pc7NR/psq/dW1WBIbIawCSFo1GBaNIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366361; c=relaxed/simple;
	bh=zMBYRaRoQJnKqbdcj05z8J8o+OQwvVftsJADyrxmgC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTwNBbbr4oe9A63nSRIZCra6YKYP+y+z7vqJdAnnk1BoUiiwSSjhzuEfHxUdxnfsVA2QED7eQx7jBY8u/mJalvTfsG7PXVV2/wrSI58mkPef7wxJMxPtYC0tfrCxxoVRUwXh+ZOS5Rhra4J04BshKudJq0f+nSpTg7W8Rad1ayI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jnMsm69V; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jnMsm69V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783366357;
	bh=zMBYRaRoQJnKqbdcj05z8J8o+OQwvVftsJADyrxmgC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jnMsm69Vze24MsCwHs1W+sWKiI2imYanl0xl0baVC56Sn3pEfxHMHIopmhs+yq4TH
	 b4cD3L4KossR+flWNWUA/b7WighYyuzpgv4t4t3Y8zXXfMKL6PzjK2uByHEfiFHVTx
	 WtR7/zVJLFLAlhkoTJ5SBUFyha0myfaC5qy6UdHkIk4Fqqu1iELQ6rIZadp6f8wveW
	 +y9VOuRAd2+MPixiQvvLBqYci18PztJRoPMyIyc3SXcGFMd0qliOwhYbTM0XOQTCgz
	 Tj8tkz0cBjinUbihVWo+kROORgbi3opnpRDeYQ7ql+SKH0Yq3Ze+BEfn4XuG2SwfgL
	 /unQBW6IwbiHQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1100817E0432;
	Mon, 06 Jul 2026 21:32:37 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 06 Jul 2026 22:32:17 +0300
Subject: [PATCH v2 05/13] drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE
 overflow on 32-bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dw-hdmi-qp-yuv-v2-5-b91beb33dedf@collabora.com>
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
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

VOP2_MAX_DCLK_RATE is defined as an unsigned long and is used scaled by
the color-depth ratio when computing the maximum DCLK the HDMI PHY PLL
can source.

On architectures where unsigned long is 32-bit, VOP2_MAX_DCLK_RATE * 8
is evaluated in 32-bit arithmetic and overflows: 4800000000 wraps to
505032704 before it is promoted to the 64-bit argument of
DIV_ROUND_CLOSEST_ULL().  At 8 bpc this collapses max_dclk from the
intended 600 MHz down to roughly 63 MHz.

As a result, low-resolution modes (e.g. 640x480 or 720x480, whose pixel
clocks are well under 30 MHz) still pass the clock <= max_dclk check and
are reparented to the HDMI PHY PLL as expected, but higher-resolution
modes such as 1280x720 (~74 MHz), 1920x1080 (~148 MHz) and above are
wrongly rejected and fall back to the system CRU as the DCLK source.

Define the constant as unsigned long long so that every expression using
it is evaluated in 64-bit arithmetic, independent of the width of
unsigned long.  This future-proofs any additional users of the macro as
well.

Fixes: b0362c45c401 ("drm/rockchip: vop2: Check bpc before switching DCLK source")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260623203310.9F8C81F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e966c0a0266e..0799eb0dd29f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -102,7 +102,7 @@ enum vop2_afbc_format {
 	VOP2_AFBC_FMT_INVALID = -1,
 };
 
-#define VOP2_MAX_DCLK_RATE		600000000UL
+#define VOP2_MAX_DCLK_RATE		600000000ULL
 
 /*
  * bus-format types.

-- 
2.54.0

