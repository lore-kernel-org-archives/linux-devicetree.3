Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10AD3ED5C9;
	Thu, 25 Jun 2026 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409187; cv=none; b=jFzyF4frRb7yT7L1yDovlFOOl6D/hKqzd3KnJLYOX0HjDh5T0aTlNwrINLixYy7sZsjrT4uqIWzBA+WRMRZJN5DJZG9iHasQpDyn1xSUonOLXuBnLmq2tRv5/FBwLlZ5YI6QGuyFyB91XfnbW2Q9dJwDO9/39yS+AzZRC96CPEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409187; c=relaxed/simple;
	bh=CX6yNn6+XDm6w4SYFDDYmShaWUqfCpkp+4yIyGiYUSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYs+wV7N6QGYGKmudvTm6KhCI8ys8h+xM6kQBHp+xuQmKMqYhOp1bwO2eRhPVLwYt3pLx9Y3FAhIAmbE7Bj6/sIK6V6/tq84QgF1Ks6KQ5yyHIt8EDYxWj9/C1ljtxyyf2HCTyVN9oLqQdONLhmUb1D+F1gk9pUPBmqHowP7fdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KK0yXC+7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KK0yXC+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=CX6yNn6+XDm6w4SYFDDYmShaWUqfCpkp+4yIyGiYUSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KK0yXC+7+PI4hJeIIiTs5Gc/bnXR8un5kLwY8L6L9GGuPh1plJv2m6ygnb6TiOsxC
	 ekeEjEwuNPGJ7Kh3xdy9ZWl1zNwJbViCksdMNDTns3//3fEKlpTyJKH91RSTNWC3yd
	 PVIw60j7gjkA3rnIXMOR0z6tS0bKoD2dcXTEep3nyjl/a2yQZpviH+CALdrdn3BQ/n
	 oc6DGglsMOryytQfuFnDxIIAQ9JnRymzVl2hu2/7veoKE6xi79v73KUV2O5cfwQGK8
	 KJPvbRB/XxuCQ/TWsRyJStt4cxGBEwvRNrhd+KJKT9r4pTslQ7Eq3drTMIAVDMZyxg
	 PK/kDFCNsh+qg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A76117E1164;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 020E1480031; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:33 +0200
Subject: [PATCH v7 06/27] phy: rockchip: usbdp: Drop seamless DP takeover
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-6-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=CX6yNn6+XDm6w4SYFDDYmShaWUqfCpkp+4yIyGiYUSo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9vrj0Ft46lz+xwypywFClpHa6W4BaI+S
 HUnVrpNYiDnX4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaOl8P/R6AubIEOJ9pXnx0wpaMTGM80KIcULUaJn9mmw4palqprfb0El6m/W6qDsxJ7totyJL
 Ikijmmir+O2PEE/FSxBBLIXwe51weT1fyNHUTZt/ZbZArP7afcH1nmHD6+GSm1P1TJPmV0AAeBO
 llXUDTkOplT0RDBL8Ygmueac101NoNpllK2KXKykTTya6YPODUemPRRQJvEUhh/WLp7s3ODwmZu
 eMcRJ3sOD2RlvurGADATv5PaaLeUrVwE4FUPpW2/mVVRG8AJZZr6kqUBxIG+UGI+J1DywaoVHrd
 2FKUqTW5xBIfu4xCb2VBVELRUJbiTs8+O+gTTk4fFbuAXwB9oTGBMJZGTToQtjw0W9DBg12AuUJ
 qPR/mPn2zvFuk3gyoMApX9Bs6IrR68NxxBK5JhZJFn3RT7Q6GMZdeBS/KvicNThcaBOOvRWTIrm
 lUZMhXdF7MIhmDL8Frj8+OgO9lHfRwz10RPPpvYclkm5yPVp+lRLKNK1R7Ga4G4Qzc2p5HU9A9q
 1RGpHzTnGdl4pggS9ep/pWa0eMyDMy8DNtjAumpnDMw7C1FN0skaTfaTQmpczH164U/6v1m+vYy
 51M7xgbngCNz4fofK66QcwgtOxhVwI+3Vb14IjnmPkd/O2gs+SFAjcKK220i7jLNw1Yf5/K5wMt
 UeZWPFavrFoovrd/SWKokMw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If the bootloader already enabled DP, keeping it enabled here means
the DRM stack can do a seamless takeover. Right now the DRM does not
support this and the code will leak clock resources on module removal,
so just drop this feature.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..7fa3cd519577 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -939,9 +939,9 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
 	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
+		dev_dbg(udphy->dev, "Started with DP PHY pre-enabled; seamless takeover unsupported\n");
+
+	rk_udphy_disable(udphy);
 
 	return 0;
 }

-- 
2.53.0

