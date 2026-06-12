Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928291D61B7;
	Fri, 12 Jun 2026 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781287256; cv=none; b=lke1FKVQFKKDsCPQjIdfG45fA3fDThJUCquvKdI1qVu/8wlVokLWyhXv2tEp6jFvQY8XhU2Bre/oeSA85DRkjrpCJcV8kVZ67DBp1PhPFfrr8junQt29D16LgY8iBa/msSoCmdatTwKMquxVYzvuTHNBbS8FO76KQHFpi/292Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781287256; c=relaxed/simple;
	bh=omFKO4EP3ToAvJxa8cmB8JXZlOhJFnubM/2euZVUsQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNgUNImLHkvlXAHXzla29Km2Wc5maa8sqEKPqKCWDRpJNsx17OW5qg8vVRs+lOaIphSW9JZsOi08FjzY5avglNmKhaDMCV4Miq9KfvzpTF5A/E+NbV35tAwEiqoABbJYIArNvcWAiqtHlH+PWHsaoTtPg12HzsS+BjCMyZEj7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jTnNPHmj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jTnNPHmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781287252;
	bh=omFKO4EP3ToAvJxa8cmB8JXZlOhJFnubM/2euZVUsQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jTnNPHmjgKurL8iYKgop38z+EuApKXzKYpVcMtEBFWm/imiWuD71Fis2GkByv8XCZ
	 a9USebMYJ4BcD32a+s4KBKkWDo9cNeCdU8CaPq3Vpf14VVTcc7Q3q/BAq3rx4KsOOb
	 9nVFZ5RphSbV2wbQl3t/XynTBAqQDVt/rG6cXPWqFOCfswjQ+LmNO1rgYKNcizbPfs
	 gprb3Ykt7O2lkL5f+gBHQa40NIW9cVUObYNfEeS5O2k6KXwE2zBcV7dA5/sObDFmQd
	 qL9jDyzcYYptRfFPmBnMqwYg+UIPZofU1LGmiyeGuSz/7XG+rRQqjkdvrDbR3M8OAT
	 J3KoG4pJCfchQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B795417E040C;
	Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7A048480029; Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 20:00:48 +0200
Subject: [PATCH v3 02/10] drm/bridge: synopsys: dw-dp: Support
 MEDIA_BUS_FMT_FIXED
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-synopsys-dw-dp-improvements-v3-2-dc61e6352508@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=omFKO4EP3ToAvJxa8cmB8JXZlOhJFnubM/2euZVUsQI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosSVSDh4EWGtKE+GX79p0vuT1Lhykh22BUQ
 1RPnFyDk/XPYokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLElUAAoJENju1/PI
 O/qaBjkQAKlK6B99B5tae3/4Yf4pTYBrJyN5R92oNxB++rD7yEBXDogdrHCiMz4Ve5htpU2sIUt
 CMSSIx9pCHz13DHpekX/9sHCXei1M27AImROaJXlJRqAVRo7xX3NwfSk7Z9CB5p0Ou+xfG2XT+j
 3ihnLQKWWEDt6S94jJtkmckT/MMgMizxMwoupzGUT+Qu2o7jDDoz9nQqH8HR/Z+WrnauvOCK3SW
 699lg5sqkS5OvuvfNsJOTZmRXIYgbayqjVDgc5YBbtEVLwv3iOKlfjBLEc+DJ+yVC1Sm3kmvNG8
 Yc9ycTZQp6eDvx3ETm5A+8U1bd0X41Dg8QMzoejg6/C1kJoHVz2ePUpPA4GcewC8Pqrrq0Ki9i/
 pFFpzJwJbf6T+/R5zMuliWz0Wqjo6hbAMtpEMTkT5RUoVDqRHZnXN2O0PksdHTfOLGlAp3zeTuX
 HqnJhnuZEFt9ieZ8i+JPOpPoCfRItHD153TWYNapyLIu03Ljm3axPmgsXIVnC1JyqOw7izbhaNA
 fAlqB2toQahqwJP4B1PKW5CNiMRbimShuBzm2RV99sxXjVLXfeKC29jtkYF0aru4J1xh57fuxcU
 vhbl8RU9BW0LjCQg/qCYZy0U49qiiCh81fTu/yrkmstkPkv++UqATQbPB4landLYg9OIQZpEvZS
 vdSTV/LQXFm4sIkcAmvMguw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for MEDIA_BUS_FMT_FIXED, which is e.g. requested for USB-C
DP chains as the last bridge in the chain (aux-hpd-bridge) does not
implement atomic_get_output_bus_fmts(), which results in the generic
drm_atomic_bridge_chain_select_bus_fmts() code using MEDIA_BUS_FMT_FIXED
instead.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 36ee6e027af5..ac7779e42bb2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1528,6 +1528,7 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 				     struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	unsigned int out_bus_format = bridge_state->output_bus_cfg.format;
 	struct dw_dp *dp = bridge_to_dp(bridge);
 	struct dw_dp_bridge_state *state;
 	const struct dw_dp_output_format *fmt;
@@ -1538,7 +1539,10 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	state = to_dw_dp_bridge_state(bridge_state);
 	mode = &state->mode;
 
-	fmt = dw_dp_get_output_format(bridge_state->output_bus_cfg.format);
+	if (out_bus_format == MEDIA_BUS_FMT_FIXED)
+		out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	fmt = dw_dp_get_output_format(out_bus_format);
 	if (!fmt)
 		return -EINVAL;
 

-- 
2.53.0

