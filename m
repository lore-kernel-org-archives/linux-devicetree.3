Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4613783C3;
	Thu,  6 Aug 2026 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785976754; cv=none; b=J2l8M9SrfAiOLCUJ4mNBL9J0DBcmqfQaZBIg/P06+CK4k/C5WJKbexml8F0Sz1TfeAcxB++w6+8aEqfjh00iUyE4TScrk+0r5LyY/2xGeuhnNAajNPsSgIkl+nT97/rOqocmpI09dqTzHP2kFJ32yFprswZOAx4RY4rVJk7LQzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785976754; c=relaxed/simple;
	bh=kXoRBBebvYIox0oNXN0VuZO24XXYD428JSoKN6soJ4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bigJJWqFwJn+cXFom45v4BWHZbvObBxQJosvbvWFfPUSYnUpMpzBnfsq6Od2CBWDeek0L6DW8PSCXRcPIL1Ud/YiyBZ6O4Marv6p4ixBi/w8cr1feMrPWW6ZLvI7ZnzNdPoWp/SbjC+3QvbmAlF1eexDHcoh+/lXqkLmY0ygLbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mP10COIA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mP10COIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=kXoRBBebvYIox0oNXN0VuZO24XXYD428JSoKN6soJ4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mP10COIAyj2NaBjzWj0e8vDOj22SHY2533M6Sub5SGaEDvu2nFJLyxIpJlFzXu1GJ
	 TB7LILix/vRTxTrbr3N6hsCLU46UdHQR8ES7WvyE/cvGEEjtLQYUYbG5waJmpATE3o
	 k/Er67OCfFnzajAZd5swowTSIKRPU1qBKf/3AgvVhgqbIwcpz7HM1Ut23/ZN27xsLe
	 S3jSFbujTQV5L9xGmcq77MAmE4Z20Tx/RV56U9SGbJ1mWJ0pOR0veg3a5oWAUmgkxS
	 BXOFGJI+9M8PR0PtHVHXZ6Rs+50FheyQI7hSLEr1q8lx97UJtuqcg7QA94NjryfYfU
	 6CHOFmkSaCG1Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D7D0717E07B5;
	Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8BB6F480030; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:10 +0200
Subject: [PATCH v10 04/21] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-4-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kXoRBBebvYIox0oNXN0VuZO24XXYD428JSoKN6soJ4A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz1611MdQU6XuU4EOBdIMThZhdenvp6Xc6q
 d60Ul5IMtG6aIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9etAAoJENju1/PI
 O/qa9X4P/3z14InEcW0zDYd450FemoZtBW2eH6iMu7XxXhuvVKcZgYEo9YBahsTiWhaO1z6Mw65
 KEeLiTKLilF0fpyqd/KiFB7jsckouq3SPm4NgnIj2O56ZijRRlzQXpdH+YcWmg/hty1VqU4e/Ds
 hy8yIQNd5f4KnDzqLovAFuTASkBwbAmwstIwCbBaIRB9KkI7JkXcANWZuLp35CnXgi2GvSzSLfw
 OIMZxIQi/3S/zjgwVmTKpZjFRvZ3/+B/h5S59ovbprlSzXcI/dqjTa9XuI1qtPsv5wQBabrZ/e/
 3o2YZTXwsguFCiyWl5oLcAkWTgCQW2WrZUxMRCG4ECmo8zy+/ZerbjMVFhQt3VmKeFX9R0A+/NR
 72J0hbj8vgxEK1vTFC/4zt5ASXl2BG/EMoW3zCnNHVIq+PNzal5n5pMRyfD9MptRA7A99utGJBa
 KMaigXgX06aTI5dtmXd6Xwnsm0O2Sl0fci3qowztr+GlCR6NOb6ZnPtamAyvooEri8iZOV4/NvB
 rIsTSsbWAGQkQAUfTw0Vt6UlD4y5L4D0hQU3YzY+YyMaMa/Sk4TIeRZ2QK9gax7PWGZQcAzc+WU
 T8VxpDCTEiBHNKF94HJbdYrQYTqrSbFjnSxx+6ToDTsAPGAJn8kFUhERzeYfG3UfId+ZQDIOzdm
 6EIPhUtI94FVgqGcXEJYsRg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If the driver uses devm_reset_control_get_exclusive_deasserted() instead
of devm_reset_control_get() and thus automatically deasserts during
probe, the SoC will hang when the device is unbound.

This does not happen, when runtime PM is being used (not yet supported
in mainline), which suggests the power-domain involved requires this reset
line to be deasserted.

Even with runtime PM there is no gurantee that the power-domain is
disabled as it is shared. Considering the power-domain does not have
the reset dependency described in DT, document the problem but leave
things in the current state until a better solution is found as the
reset line is deasserted by default on all supported platforms.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9d46927ead4d..d3f93e9ba60a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2094,6 +2094,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 		return ERR_CAST(dp->hdcp_clk);
 	}
 
+	/*
+	 * This reset line is deasserted by default; asserting it hangs the SoC if the
+	 * related power-domain is still active.
+	 */
 	dp->rstc = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(dp->rstc)) {
 		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");

-- 
2.53.0

