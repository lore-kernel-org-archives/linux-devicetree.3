Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F92137923;
	Thu,  6 Aug 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022263; cv=none; b=flUsBTOQXT+XhxMfU4j+sUHD03cRVbY+tJaml3IgmfbGG8WAQbkA6dJVsvbPS8gjZVs6FtEhT3bqI4vC/zOPCxmuX91NUSyZ6AVxZx5WeSOA1uGISOZxi+bMDWQH8B5YWCTiaXzz0U3s1yYP02YaVuTW8J//ep193xZazJiEquM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022263; c=relaxed/simple;
	bh=NjoYzYoJpK0n170py9EhMhQQr1rTjRMeYddlAE3lJGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aq4L2va6SX5jeYL1KfIMyb+3N1+PluWcwzBhRmsXbpJOTfNDUbbOdfyHua8szCQeFmx737trCPOs7tYH9jl8Ls0MxdynlmgD5C6+YOIP8MPR8T9XFaqTkRWYBaZ8StXV9h2yD+sRlWouG0Foy4j0rlBXpw8Js0Zc/XZXtYumDnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C25D0200FDB;
	Thu, 06 Aug 2026 15:17:26 +0200 (CEST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wrxyQ-000664-2C;
	Thu, 06 Aug 2026 15:17:26 +0200
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
Subject: [PATCH 5/7] drm/bridge: lt9211: combine equal branches
Date: Thu,  6 Aug 2026 15:17:13 +0200
Message-ID: <20260806131715.508557-6-p.zabel@pengutronix.de>
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

Combine two branches that set the predivider to the same value.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 5e5601551658..14afffcb2e4a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -993,10 +993,7 @@ static int lt9211c_configure_tx(struct lt9211 *ctx, bool jeida, bool bpp24,
 		phy_clk = (u32)(mode->clock * 7);
 
 	/* 0x8231: prediv sel */
-	if (mode->clock < 20000) {
-		val = 0x28;
-		pre_div = 1;
-	} else if (mode->clock < 40000) {
+	if (mode->clock < 40000) {
 		val = 0x28;
 		pre_div = 1;
 	} else if (mode->clock < 80000) {
-- 
2.47.3

