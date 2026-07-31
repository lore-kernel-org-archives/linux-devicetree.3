Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEC042F6ED;
	Fri, 31 Jul 2026 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508934; cv=none; b=CNeWJQ/o+zeYcweEEHQqPsGyvM/6/Uuka0ta4OLgG/ogr4AO6+yoS+nKqO3MU4ayZEVW2glO2FvAeeMtP6vvaznnwrzTcJS1FbvzvsuVsWcI/ilFJP8FMERx744UA1rxbYX1FErR/oVIx9HGk2HnpFxguSGSZiW1XDQI0/+rFxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508934; c=relaxed/simple;
	bh=67aod2y/NN3Z0/tR+63bhBBILIefJK85gRwCSfTU17o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9Ez6BU/ZgblN9r5EviDlSRcOKvj+r1MtNXctLproF+KKcdb5KaxajBnJBHSMQQ4BUvyaUUPq7nx3gG7hF7I0coEdTG7B+55V5E2OpLPlagfnJYUmxWRAOJ5TYiXcf2dq5G+15jcLJO011C2E5YVZIa4j9TDkCrEwF/CUxFmL24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lCZ8Q7sI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lCZ8Q7sI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508929;
	bh=67aod2y/NN3Z0/tR+63bhBBILIefJK85gRwCSfTU17o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lCZ8Q7sIO6icNPa1zc1qNzM8EBaOkmXd1Hhw6YsHpN1kFpzWNtehuXU7SVdXsi3Zl
	 /H7T/DMe1gz9+mHNZXTSgZmkMRFABqORMMTjqH7Dg8Mk/qwmQ4dtsDdJbGAlI+k6f9
	 n9meeF642LcNnAB9GkofSECWnnacz50qVXqd3cVrpyiqNy4O/cPICzvt+m4HxhkfNV
	 iNU1PPsPogL0bzLvS35wJ9+Y5ceLnVrOiOODoc3Y9yVJAhrG0D92vbGu/4KBtKLNwl
	 RUONywN5wKlRDIadZol1xX1NNGDiwLw7WFOtackLY/suT8uorvZd30HhiQLQca0wPS
	 mqw/TFs9U1teg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4991217E08EB;
	Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 01AF1480030; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:09 +0200
Subject: [PATCH v8 04/21] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-4-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
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
 bh=67aod2y/NN3Z0/tR+63bhBBILIefJK85gRwCSfTU17o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEAiiDNAYe6ydxJrk23XOS90RTpqdTZAV
 3w6vGf3yhnmhokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qaESEP/RGU/Si0lmndkxUhc6ydkA6dgLRS1ot5p+2zBwW0Tz/CtyF+vPWVasjkkQAq7BNnP2B
 8GfsS8dwfx808J3IUFhnGQku/4wClW9Lz5vhOfUrKDV0KIS9IUiC5K0jandniEzH5j/F3BJCWrP
 Dm8LrSiSO+9xseV4ziLz5cOTVL7HbwaA4PJvZWcVE81jRuuTNq/b/sZ+ablD/FQKWl8iW69ykOs
 0KJC4M+RU5tD8yxyfsjC9KzxtFdeT1bJNG5LwS8286ueiqzMmxZi3TQ9DRyblBAVs6stJdIvjEk
 ulsKS/U5kBpuNqf4+nUFZCtOUot1V08Mdqm1wUFiy3s+EfdS+DtNpThwnoVFoHan376/9XyA2yZ
 AL8Ii0d6aek9tyXk3qgKdKav+HArBeqbnj/9vQkzEMNQsTQCKpGM1AL2cfttwSxt5rs8WIMi4xX
 QS+9E0WYuqtxylHq9PMIEmh//sDWIqFLgmxcjbCHu/2H/8V0zxuQ3ypUycYOzeKVaF28JLdcsj/
 a5o14hD/IA/peyOcw3qSwYg/fTceEoWuZ/lPdz5ryavs6XZfPOXIHb5OJKyKi0UFDqKDG6kVpLq
 bBA1qgd4ZYldfO/cRsP2ES/7G2t25lSFL6S+mTt3TlpoFKw+ygZfAbFDAb1XIdF1p5t0OksYN/Q
 dC5bkNt3Hu+vOu5RBvHcpRw==
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
index 6289ed06e231..a8ae13cf91d6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2076,6 +2076,10 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
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

