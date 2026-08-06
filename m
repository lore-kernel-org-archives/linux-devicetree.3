Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD13164B4;
	Thu,  6 Aug 2026 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022259; cv=none; b=Y9d+6hmct5ERaf4kP8gQN8St+niXo0xMqGVbZxpOP2pznYCNdAiX1s51YiP2H1Y60QUBnhP3Fhf/mPGww64nIel8RvphN84gPZzkTbyPrzKYizFz6iubyK4Y7nL4MMrIh2+PFiPP1YyQ5eZfbvwUU37kGis59gEhoS7LZ7zIKaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022259; c=relaxed/simple;
	bh=caIjhG3XoWd4tVHzFK5oN/nmcRDnSQEfRNRQ37jBHm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qrm+gX/Qxo7kdo/qx3fw0zQ6+b3dkl9ILKTxuMyvv7GTQkhUYX2vRRwNQPTf0CviEiyFwtaBILroqBhwqH7xnZpj01YhohsMCFOt3OE+9xRp3pFYu68MR/MIbSP8xdupuVshR1QsgUKJipqXPFe/nOkesLFNenWrzro5OvmTRjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5A76720210F;
	Thu, 06 Aug 2026 15:17:27 +0200 (CEST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wrxyR-000664-0h;
	Thu, 06 Aug 2026 15:17:27 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
	Yi Zhang <zhanyi@qti.qualcomm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
	Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 6/7] drm/bridge: lt9211: use devm_drm_bridge_add and drop lt9211_remove
Date: Thu,  6 Aug 2026 15:17:14 +0200
Message-ID: <20260806131715.508557-7-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806131715.508557-1-p.zabel@pengutronix.de>
References: <20260719-add-lt9211c-bridge-v6-2-e56d22152586@oss.qualcomm.com>
 <20260806131715.508557-1-p.zabel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_drm_bridge_add() and remove the need to call
drm_bridge_remove() manually. Drop the empty lt9211_remove().

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 14afffcb2e4a..c82f7ee7134c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -1456,24 +1456,12 @@ static int lt9211_probe(struct i2c_client *client)
 	if (IS_ERR(ctx->regmap))
 		return PTR_ERR(ctx->regmap);
 
-	dev_set_drvdata(dev, ctx);
-	i2c_set_clientdata(client, ctx);
-
 	ctx->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ctx->bridge);
-
-	ret = lt9211_host_attach(ctx);
+	ret = devm_drm_bridge_add(dev, &ctx->bridge);
 	if (ret)
-		drm_bridge_remove(&ctx->bridge);
+		return ret;
 
-	return ret;
-}
-
-static void lt9211_remove(struct i2c_client *client)
-{
-	struct lt9211 *ctx = i2c_get_clientdata(client);
-
-	drm_bridge_remove(&ctx->bridge);
+	return lt9211_host_attach(ctx);
 }
 
 static const struct i2c_device_id lt9211_id[] = {
@@ -1492,7 +1480,6 @@ MODULE_DEVICE_TABLE(of, lt9211_match_table);
 
 static struct i2c_driver lt9211_driver = {
 	.probe = lt9211_probe,
-	.remove = lt9211_remove,
 	.id_table = lt9211_id,
 	.driver = {
 		.name = "lt9211",
-- 
2.47.3

