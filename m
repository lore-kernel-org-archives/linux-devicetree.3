Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE87428840;
	Thu, 26 Mar 2026 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546313; cv=none; b=Z/DTBzyNhnHB6gSu8NNswK27qFnaoy9hhQgeEKndLWMfwZvvQx3m0kTv1LiB082v2ZIG15mzWuej1zZy2IDGvMxeTKru7W2opDvE1OgenB2OrKraInr1TiyzR546aFj7ipcsw6mRZxWF2t/Z4pR3OPOW4yFAriFFQOuaD++Xe2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546313; c=relaxed/simple;
	bh=Cc/hsE27RhzeShv1G95aL+9ZQZFkIaFrEmCWFQE08M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZF9lYyH2MjN4R4hBWVEpqXz4s/i4wBFFGdLX+B8ou2tstJ4Y7ICmXJjYIJny53U4A0BLjYjDqxsAbp5oSeomKZosY/pvqDtZTXztwJHCKShi83P9s0+BRR/nUrsiuj0QrxlkiMwG8n8xWy4mnHWGBipLGqoRj99PW/++PC+tvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kKMSbr4+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kKMSbr4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774546299;
	bh=Cc/hsE27RhzeShv1G95aL+9ZQZFkIaFrEmCWFQE08M0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kKMSbr4+2ODo+Rtfv32nwMmdqlqG1VLNXRQ75PG8XA3TvpfVG3vnNhXCRKyMdGTkJ
	 lZhWARAyvWznXFBOyvGkD/3oGAJwL0CZSuWqP2toKtKx4lSAmoYbJxCPLPTlmKimx6
	 YCl3BC+T/0wQViDGeIdc/lnbEOi4FnIjgxN4ZtEcSHlMDoU3WaYRDA26TyJaq1vGtn
	 Ay5EeoTWalqXZyISsfmFtNNnxh/bfXTr8/o1mdkY1JN9CmGc54l3k9LZ2HWC2o+gUq
	 XzGPRkcQZJv7LUzBaz0QGhO8kwdnPUz8ArdEeazXEI4Nu2Op0RkYNyNETn2m2Nfkhu
	 +6mF9nz6toh6g==
Received: from jupiter.universe (dyndsl-091-248-208-149.ewe-ip-backbone.de [91.248.208.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01EDF17E6196;
	Thu, 26 Mar 2026 18:31:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 48240480031; Thu, 26 Mar 2026 18:31:38 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Mar 2026 18:31:31 +0100
Subject: [PATCH 07/10] drm/bridge: synopsys: dw-dp: Add Runtime PM support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-synopsys-dw-dp-improvements-v1-7-501849162290@collabora.com>
References: <20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com>
In-Reply-To: <20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com>
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
 Conor Dooley <conor+dt@kernel.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3017;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Cc/hsE27RhzeShv1G95aL+9ZQZFkIaFrEmCWFQE08M0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnFbXq20wXgacG8r8YAcir/+b19fw2zDTf/H
 3txgWvXsne7bYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpxW16AAoJENju1/PI
 O/qa5AQQAIcAjV/ywr3p/SPXBeOqCkYyHh0KXePSvx5bZhJnU0J78RfBgTWznpDQA0odvWFTDpm
 +hKyHMqRXVu0lX5NoSLNOGVXGUJQgCn1PPRO5ddBBm4hnCj7cc5F4ecm5F4RytGNYAsubHAQYuD
 FBPaxWH9Of8BjZikrs6kmZHwqXSy/hdr0hzkWgKZJtEfAicbbKx9dbXC4L4KgQXAJyw1nPNYHga
 DtTvBkyMNbaSE4OBp7lc1KINB2BuxAfGF/M05x/WoA9VPNDxId7YrRTaXyQ09UBdHsGc0YgeFZa
 g2ynBTAucekIXvP0NznzEm7TkkhGAuvav5PHgewhDXSzVfHO7Or5vA7zRoZ2usSuEw1RfSUMaB7
 QtEgbqnFPxq9mJYuWWZoPjbvpP9TOt5VvfuvxAIpM0+GO1VCJUeszmYPbOks+QHpFaCaec8g3xl
 VU5xB0yYLCS8U4ysHNs6F6B1F4q58sB0XA0U/Q28u3+sglNpB613A3K3iLmfP0wf6T3j083HYav
 aS5OEFVzqXjL9FO/q3bJQ4SuSSn8soh0lZ8/CAzuNN8Xse1bhWdaxqBoAW3LME6sy4Nn3C8EQN/
 r2SFdttjU0duTm7zSMPRjfJMCalEqUvLRy8W8UNoVoNMWZZgqbx4nEGbF3QjmbpPm9Hkv2E1MI+
 vZUxmij3e1yltmQxw/OwlGQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add runtime PM stubs to the Synopsys DesignWare DisplayPort bridge
driver. Support is not enabled automatically and must be hooked up
in the vendor specific glue code.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 27 +++++++++++++++++++++++++++
 include/drm/bridge/dw_dp.h              |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index df2d629287fd..9ee9e3b9d912 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:
@@ -1655,6 +1657,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	int ret;
 
+	pm_runtime_get_sync(dp->dev);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	if (!connector) {
 		dev_err(dp->dev, "failed to get connector\n");
@@ -1709,6 +1713,7 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	dw_dp_link_disable(dp);
 	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
+	pm_runtime_put_autosuspend(dp->dev);
 }
 
 static bool dw_dp_hpd_detect_link(struct dw_dp *dp, struct drm_connector *connector)
@@ -1729,6 +1734,8 @@ static enum drm_connector_status dw_dp_bridge_detect(struct drm_bridge *bridge,
 {
 	struct dw_dp *dp = bridge_to_dp(bridge);
 
+	ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
+
 	if (!dw_dp_hpd_detect(dp))
 		return connector_status_disconnected;
 
@@ -2155,6 +2162,26 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 }
 EXPORT_SYMBOL_GPL(dw_dp_bind);
 
+int dw_dp_runtime_suspend(struct dw_dp *dp)
+{
+	clk_disable_unprepare(dp->aux_clk);
+	clk_disable_unprepare(dp->apb_clk);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dw_dp_runtime_suspend);
+
+int dw_dp_runtime_resume(struct dw_dp *dp)
+{
+	clk_prepare_enable(dp->apb_clk);
+	clk_prepare_enable(dp->aux_clk);
+
+	dw_dp_init_hw(dp);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dw_dp_runtime_resume);
+
 MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
 MODULE_DESCRIPTION("DW DP Core Library");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index 4aacd0e56f50..8377f4be8e9e 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -27,4 +27,7 @@ struct dw_dp_plat_data {
 
 struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 			 const struct dw_dp_plat_data *plat_data);
+
+int dw_dp_runtime_suspend(struct dw_dp *dp);
+int dw_dp_runtime_resume(struct dw_dp *dp);
 #endif /* __DW_DP__ */

-- 
2.53.0

