Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D590640682E;
	Thu, 23 Jul 2026 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845053; cv=none; b=KXn2i1/NtPH7U1sq6G10gxpAvNWivDD+RmlBBCAr0z+Huz17kwA/nkPCKmqrfk/tR7fObizIP3uyrBlJzzapNFau04ZPDquD9JwUHOTmegeXpWQ0EeTXg7XMMcYoyV0o9aGRTCHa0XF9NBxhexPsX+E6rx1T5wNq/ccIL3HklvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845053; c=relaxed/simple;
	bh=LU6QacFikc65qKPeVULOnze9hE0/IyFs6PuADZnhJuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5LIK+gkljCMWBEMSv+JT26SmGLVls4VwZdgjK42+YV+KQbSfYyWcUG/bMysFnN5CwYjYF6UEUj0PmjcMoLQokpcID2vzU2ZGY42oztVFcvBWnKnGsxIMFw2DrLn7A7xni9r/FatW24MqRBX+Zq/D/9cx0eRZ02VKxajlz5fPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aeFN6Nqu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aeFN6Nqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845043;
	bh=LU6QacFikc65qKPeVULOnze9hE0/IyFs6PuADZnhJuw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aeFN6Nqu3hCVWsCEXRrpXWK+wwjpV192F/3J8Yd4lgHE1qy1xPbKPkr99wVz5P0Tm
	 aGHlo/oCFrKmL9ROSvviclv3I9MSlJVg76+KEVD06I2pJBY5SN0ZIIux1HPJG+ozNc
	 scuxQ3gpumAUwLwAnHnX7H/WOROfEEVl42LM1kacsHjTbv+AbVTDRj5LMdpk9KhmYz
	 pFFXNEY39IVhw5rQpeSgqh2IzuSitPAz95PhDEblwa/aHSDbhbiHMKmYPBu6bpK2KJ
	 YAfS2ijK+R8zlfiPLM2EW/MBWYrt5PQIgMwltTHolrlAHSWtNOyUOdbIJm5IxQg840
	 1vJ7zRsblwCyA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CCFCC17E3BAD;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1F4E148004E; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:21 +0200
Subject: [PATCH v5 13/15] drm/bridge: synopsys: dw-dp: Use regmap_set_bits
 in dw_dp_send_sdp
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-13-9445c2e87441@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LU6QacFikc65qKPeVULOnze9hE0/IyFs6PuADZnhJuw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvHqIvnMxStTnQUp4KY7FRiXjlmCH1UkP
 HRpAU55wSWPpokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qaQHAQAJlVHTZUNQFMRt5UIpTYuHUJtTY3OANDc+/SmDp6iPGZJZtgElgrh1Jlc7y4zbXFi6k
 9fNjhfFoMxUa8FuBYlVSVm3g3R5EYbQIcIDiR+lkVRMQSLtMWQwPNyM1dERfDkHv/N9K9nCYyW7
 EmI1Y34VM2/K77RvIC3DQIemh9w6m4rNgJyuoyZwvaZOFoMzliuoYYKE9Etb2R83YCN6xjxfuYS
 fIwzllX1VSsfilYlKLJ4YPr1PHlVHZFo6gM+RwNpk/h14BLOddq2cczE7o+BpJ3+RgND/0optav
 jAGtwcH5cQmIJPq4E3EC4mYwLYD5NbpobAvarrFkgqHULSxnX+ZcOzbTVuZX0vlZMJ1kQeVE4/R
 /M9kogRDt/fYMsKlr9K8vk7iP5FjDk7iwRy1FbSOyP0owZUuPaEMs6rmbeb6m/cQuJWa1rvP034
 vRIg7Aluvhd1WdADXLIEglcxrLkGffB87EBP58mTuPCPbJNgWx99AQMx0tfk/8PvWlA66j75Ric
 dkjEQLsZHSfUpfWOw05zawbaixTYXrW+d2+aC85g4zlXd4YvcQ8OMiEUY0fDcZ0Fo901F6FZP3T
 2gyAU77ooadbZ/7QNE15kCrPbEnPwnObjNxOKe4IyRuJAgdSZHhTY2xmqLM/VPsS45EA+ZYKTR+
 roWFqlCY9pbHbV0bR4ccmoA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Simplify dw_dp_send_sdp() a little bit by making use of
regmap_set_bits.

No functional change intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 435f23fe391e..2bd37e5c36da 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1066,14 +1066,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 			     FIELD_PREP(SDP_REGS, get_unaligned_le32(payload)));
 
 	if (sdp->flags & DW_DP_SDP_VERTICAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
-				   EN_VERTICAL_SDP << nr,
-				   EN_VERTICAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+				EN_VERTICAL_SDP << nr);
 
 	if (sdp->flags & DW_DP_SDP_HORIZONTAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
-				   EN_HORIZONTAL_SDP << nr,
-				   EN_HORIZONTAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+				EN_HORIZONTAL_SDP << nr);
 
 	return 0;
 }

-- 
2.53.0

