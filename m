Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAF403142;
	Thu, 23 Jul 2026 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845055; cv=none; b=MXphqTpgBZeqwmfKFsYyZU7twNfkE/PdJ6DPD9sdY4VTB3I9uwgmI6dTIlnKT+MFI/7URG7Wz4NT25jQxYyO+jjAM+TAbpXVgaHsvc9aiHo1pbuz3Sz50oudb9yMkHKb6vdm832oboFyKgrKXdmYSI6x48h4i2L/qB3vGZPVZNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845055; c=relaxed/simple;
	bh=nH34yfr9S7kazeeRuKUR7tIplPee2M3/pXl05o/2e/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlVo61e0dAkKhyJWTLyiV3uqsWNpw00RWqRlAxbseUqSeJ+bGPGvPccXQYQsLY1Xnb4nIAYBx3zN+2t1BlZQ+E/NfJZKs+uneZG9bE5x5/xbZyL8+sggJ/xC690GO74eeIgnlOZnZTx5WJ/JjlzKb5rbmBLEwm8Uz2uJiYdMczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pdBvYaHt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pdBvYaHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845042;
	bh=nH34yfr9S7kazeeRuKUR7tIplPee2M3/pXl05o/2e/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pdBvYaHtlN77pVzeekSS2vXkDNxk8kppcISmD2WATueCyhlujVZ6ietXd3ta9eL8s
	 NcjLifXrwFoxNuFby9jYNogpSHpsNL+3pPYy91NH0uKeTEU2nBejD+uaPv2SVjhRPD
	 a+oKxL6fhWhFJ4Wjnl6YI+YVkD1eUM82p7Ku7zUKXZfTUJssuzri87Vj5m7QJvAMbg
	 8I3GF8sblBnbz9krSJNcwABKCgNpTz8Fy8PDrQIFCFosw7uLrX7jTUmYShWQ56XlGk
	 56VhNhxK0Yth6wnv7RQuO40Pnl8WVfxIoZ8sacGPz9k6Ug12tKb1khU35fM/VD/vlg
	 WaHECEsvMVSeA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A658717E388B;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 140C8480035; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:14 +0200
Subject: [PATCH v5 06/15] drm/bridge: synopsys: dw-dp: Add follow-up bridge
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-6-9445c2e87441@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=nH34yfr9S7kazeeRuKUR7tIplPee2M3/pXl05o/2e/g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvG0c7GKMv7872AvqYiLkMvuCFLYFtSh7
 Xr+BjDFf+4LYokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qaa/QQAJX57asEQT2JkuDJxZhVVx0RQoyhHH4Mij3HkwIB2rgjwKy0LOOODmJwT0Ww6nVq69V
 61qP+X7KpHJAutAdM5LNi+wf3/o+Pt70FROoIoSmchEzzIYVLcOyNFL5MUjhywkCdlITGX42XLN
 MlROicfMoTLzCHl/74uTRU6RLBHpdUjLmRHmog28eNJhwIrCyODT9qZb4RlLiT+HwrRU2osxLwz
 gfGkqU+f8qTnz42zID92mGcv9MY3WErFyEo14Zoz1QbrjvA/uAfE8KVy2C7X8nB+yFji+gpM1ZH
 H114lHuzUvTgmSHfElgreVErr1oEVsNAgijH51vqEHkjdSAdeeSTyxmXqesuecPLMmd4kP9Caki
 /S1Xlw9k342ju14K4P0Sybh5t2gvaX1rtRBJkCGsd0y4ZJKgCuyriP+pFuSqFea2E2nDDPiTTwb
 MM/Tden6hd237KchvFiOM5UlCPNJsnmgmjAElZYnfo9/+8QdRo2/nmpGUkfp8ilBKgg6l78bw+x
 qS+mpkF8d0W89PxOpUKvt/6XJwWXRK5daYIp0tXjpp5bnaee5EiBU87nTQ7OaIB1lzcdNoEUxrf
 E5qL46WxEXjAZo16fAlOF5LaQvZYSW1Qjlvf+qoeQVuKFJCTUjV3OOO7e+ETUIq8ln97Cq9VxOU
 +QnU51Ergmml7zRznLeMuBw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

It's fine to fatally error out when there is no follow-up bridge
as the Rockchip Designware Displayport controller is the only
user of the bridge helper and has the port marked as required
in its binding.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 812c67fdfb6b..b9d6dff9e0af 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -329,6 +329,8 @@ struct dw_dp {
 	struct dw_dp_plat_data plat_data;
 	u8 pixel_mode;
 
+	struct drm_bridge *next_bridge;
+
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -2029,18 +2031,35 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 		goto unregister_aux;
 	}
 
+	dp->next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		dev_err_probe(dev, ret, "failed to get follow-up bridge.\n");
+		goto unregister_aux;
+	}
+
+	ret = drm_bridge_attach(encoder, dp->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to attach next bridge\n");
+		goto put_next_bridge;
+	}
+
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);
 	if (ret) {
 		dev_err_probe(dev, ret, "phy init failed\n");
-		goto unregister_aux;
+		goto put_next_bridge;
 	}
 
 	enable_irq(dp->irq);
 
 	return 0;
 
+put_next_bridge:
+	drm_bridge_put(dp->next_bridge);
+
 unregister_aux:
 	drm_dp_aux_unregister(&dp->aux);
 
@@ -2056,6 +2075,7 @@ void dw_dp_unbind(struct dw_dp *dp)
 	disable_irq(dp->irq);
 	cancel_work_sync(&dp->hpd_work);
 	phy_exit(dp->phy);
+	drm_bridge_put(dp->next_bridge);
 	drm_dp_aux_unregister(&dp->aux);
 	drm_bridge_remove(&dp->bridge);
 }

-- 
2.53.0

