Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E6381B15;
	Thu, 30 Apr 2026 22:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777587640; cv=none; b=qJp7F+sAhA2RwiFwD/uNI1v4D0+YSDJkXy38Jb6eW4qMW3mWqf9aMehDFlpbp5k2KS/dZkBfGvESAxPW94UicYusU+nOZ5jcRqfXijnktsHYKI49Aaoohts7zV9fDQWAs6EouFX0WImC8vKGZsAwMAqsgwmvyvAvix1+cG1QdEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777587640; c=relaxed/simple;
	bh=QomGHZW/FC7YCeotchHbkL/EFXCUs9zAs3hd5qwXqtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oi5vJOSOfLY9MtcG9QRZlWkX9JivVxZtfOw6cbRD/T9jflRIi382gF15wDEQQRcaBjAExUz7i0xmimUTD3uhKmIUaeqIZykY7qIxHuA2fJAhUG0w7DEzE9sx+1ND01ESbmXNz5IrHzpYgG0LLWvJIT+3ZOp0DTFXtWqwctZZqDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RkVlz76T; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RkVlz76T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777587637;
	bh=QomGHZW/FC7YCeotchHbkL/EFXCUs9zAs3hd5qwXqtQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RkVlz76TQCd63Q/kYuDZJmnC5zcRuCcE+azDTmdvUPejn4aYSVm/Nhqm79f40jM+p
	 YvHUDYoQkv8J+9u+vc4fDTf/QCHKIxB9NzXSU00UKLQXYvLY77mtEDNQdvuiEwIU9o
	 cgAGfN3iSCYXBcxhrVEHbFPY+GgpS+9ztFEkDbUN0N3tCdO2saG1qoG8TAzZeKxM+b
	 dFkt2o+HURE7ye+3d/xSLDy4YmGUQW0Fez10SJL0sMwvA5pVrwT70K2F+GG3OUf0GZ
	 AV07dhe8Bbl7K46iBiu/dW9NYOSOdyczBGF093nncoDo9kPiPNTThyA94shGIHisKT
	 NGSMyEI1iSuuQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60F6117E1553;
	Fri,  1 May 2026 00:20:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 102A4480028; Fri, 01 May 2026 00:20:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 01 May 2026 00:20:28 +0200
Subject: [PATCH v2 01/12] drm/bridge: synopsys: dw-dp: Support
 unregistering the AUX channel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-synopsys-dw-dp-improvements-v2-1-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KVUbP2LF4Dc5Xhc4nsxpqOt5dErAkqqa5xyn+yU/zfo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnz1bRnotRIY9hREv+0yv/5f+Lswm3R1y4d8
 mtgBfnzaP96FokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp89W0AAoJENju1/PI
 O/qaepQP/RWTLlgpZfq76hDL4H/eEZXNlxQNDKF8YsgAn5XQstqOOCanyoUlYmgs3VgqboNAOSN
 nBsz0+PfwLbvBAic/64V9OUJb6mH1bi7QvRwh9lZgiOPGs7ISQSeY8mG8a+uQC7kvfM6fxjbcHh
 9WtvpGJ+WXOpnBQFXYwtjDfh5hoEegJ8/47Tayj0HCv56Dalb+R10NdBqpPHq8TclURtH2jlEy7
 VwxW4nk9YnRtZsQbZUXD1w4tpjyOAcr3zrCdN+gkyWuPC5e5YlE5fzhRkmOxFQjOsMdRE0tWJ0f
 rRJkLmmqySaJ/bw6h92MbMZ8hdj2s9FGTocnpdi1djB5jaEUbsXoZ7+VM0rMbkDa2bItmvcniDv
 8J1k7wxARNQrxS+ZrzfBuG2Fds+1ErLLoEy3tgO61tl96ovtty8SFf3INPIhz+aV/vq6D/qjzav
 xeNYmvF5ARBv191IHQ6BDHd3kl8ws8j8w+tLNpQZxLm97ziJTbwIR3ULefAMXW4SAWq5OMJ6/ju
 hjaOK36YhAF4hAFI+nurGUK5uKIs6OYVxU7LOd//yiROYEQSTlaEAaWyjVBfe+8i33GaMcnXs6q
 XGni3/Nzs1ba6bFrLVC+oRkPYyMwCVVNKayJLi9OI04VazygdzWdvdlkda8bhNcc3kyijeljUuj
 MqfsSWKa6f1NHlna492c3hw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

The DisplayPort AUX channel gets initialized and registered during
dw_dp_bind(), but it is never unregistered, which may lead to resource
leaks and/or use-after-free.

Add the missing dw_dp_unbind() function to allow the users of the
library to handle the required cleanup, i.e. unregister the AUX adapter.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 6 ++++++
 include/drm/bridge/dw_dp.h              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 3f4530c117c7..6211ba6ba7bd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2093,6 +2093,12 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 }
 EXPORT_SYMBOL_GPL(dw_dp_bind);
 
+void dw_dp_unbind(struct dw_dp *dp)
+{
+	drm_dp_aux_unregister(&dp->aux);
+}
+EXPORT_SYMBOL_GPL(dw_dp_unbind);
+
 MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
 MODULE_DESCRIPTION("DW DP Core Library");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index 25363541e69d..22105c3e8e4d 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -24,4 +24,5 @@ struct dw_dp_plat_data {
 
 struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 			 const struct dw_dp_plat_data *plat_data);
+void dw_dp_unbind(struct dw_dp *dp);
 #endif /* __DW_DP__ */

-- 
2.53.0

