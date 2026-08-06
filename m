Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CF02771B;
	Thu,  6 Aug 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022255; cv=none; b=qEQ6c5AN4zzoEgoE4JAidumketz2590o43WRUgDtMIhvCp4qLi6Q25/KLUoCN+w4bQq9SFQ50eElFCNine2hZbcVVD/OMZmig++bUHcExKzq1/coX2vYq+AjiDWSlJWCtYRUZMT+Qepo45JLzVOHGP1tGS5rCBhwrBBCQblhX5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022255; c=relaxed/simple;
	bh=2TcSVgyPH4BkkLioijpjMsxIn3KEVym25m9jq5fylk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utEAqcIrL42QVOvwtVj7NCPV6vnqMK0f77ptdqPtyxkUVoIVGxo4o6ZfuWOt+vI1LSS2Y5L6+9/IGHmcOfnM2D9w0+n+NWiitDqrs+0HD34ET86m/1pqkwY4uplRcaAN8JVbGfALmDzQ1bxm1ZAgR2RBPkh2vRAhM9Wvv8DgScs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 155262020FE;
	Thu, 06 Aug 2026 15:17:24 +0200 (CEST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wrxyO-000664-00;
	Thu, 06 Aug 2026 15:17:24 +0200
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
Subject: [PATCH 2/7] drm/bridge: lt9211: fix regmap_write error handling
Date: Thu,  6 Aug 2026 15:17:10 +0200
Message-ID: <20260806131715.508557-3-p.zabel@pengutronix.de>
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

Do not try to accumulate error return values with bitwise OR.

Fixes the remaining issue flagged by sashiko as low priority [1].

[1] https://sashiko.dev/#/patchset/20260719-add-lt9211c-bridge-v6-0-e56d22152586%40oss.qualcomm.com

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 1b5cb601adde..bf72d1bcdb48 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -755,6 +755,7 @@ static int lt9211c_configure_plls(struct lt9211 *ctx,
 	};
 
 	unsigned int pval;
+	unsigned int val;
 	int ret;
 	u8 div;
 	u32 pcr_m;
@@ -774,7 +775,9 @@ static int lt9211c_configure_plls(struct lt9211 *ctx,
 
 	if (mode->clock < 22000) {
 		ret = regmap_write(ctx->regmap, 0x822f, 0x07);
-		ret |= regmap_write(ctx->regmap, 0x822c, 0x01);
+		if (ret)
+			return ret;
+		ret = regmap_write(ctx->regmap, 0x822c, 0x01);
 		div = 16;
 	} else if (mode->clock < 44000) {
 		ret = regmap_write(ctx->regmap, 0x822f, 0x07);
@@ -844,15 +847,17 @@ static int lt9211c_configure_plls(struct lt9211 *ctx,
 	if (ret)
 		return ret;
 
-	if (mode->clock < 44000) {
-		ret = regmap_write(ctx->regmap, 0xd00c, 0x60);
-		ret |= regmap_write(ctx->regmap, 0xd01b, 0x00);
-		ret |= regmap_write(ctx->regmap, 0xd01c, 0x60);
-	} else {
-		ret = regmap_write(ctx->regmap, 0xd00c, 0x40);
-		ret |= regmap_write(ctx->regmap, 0xd01b, 0x00);
-		ret |= regmap_write(ctx->regmap, 0xd01c, 0x40);
-	}
+	if (mode->clock < 44000)
+		val = 0x60;
+	else
+		val = 0x40;
+	ret = regmap_write(ctx->regmap, 0xd00c, val);
+	if (ret)
+		return ret;
+	ret = regmap_write(ctx->regmap, 0xd01b, 0x00);
+	if (ret)
+		return ret;
+	ret = regmap_write(ctx->regmap, 0xd01c, val);
 	if (ret)
 		return ret;
 
-- 
2.47.3

