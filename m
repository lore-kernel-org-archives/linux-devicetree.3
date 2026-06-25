Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8C3ED5C7;
	Thu, 25 Jun 2026 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409186; cv=none; b=G6+3ktFiDlqWrpcfsCsKgM7P/mehUwuEoP9EjLKLLBZysNoNBp2QexQlUlJ8v5+dSGiXPZJmEfsAknzByXVsIWVwNHs+RvTA3V3Fcp7GmAE0cUyf8waTgkipeeC3/FuZt/Qy7Hga9miJ1r6Pw72U+NJfsg6ErwjGeTXin57mHBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409186; c=relaxed/simple;
	bh=GddMKGozg9gwmZ5S+Q3mmfUg3GzcQJNKOpZTsWGf7kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtK99psTpkxF5PgYzCuePNwWenjnQpThI9TMSq5uoo6DwKws6zG0OH+cDEZwFK02bBd5/5D6LEzsXIe6nqP+S5Cy+XXmFfl3fkLSm37axRuMQZZ9Mi8PHMtc3uO5Ob8BsmTfigvL6nnP7/4s4gbHxlcQmnHiBDg7Vfz1C2aYeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qzsD2AMr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qzsD2AMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=GddMKGozg9gwmZ5S+Q3mmfUg3GzcQJNKOpZTsWGf7kM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qzsD2AMrjRZOCIrAhap+0Bxu5YKa+aVqR0nz93cBMGHPdugsswcbdKW/RZ9jyC/el
	 lyMYvNi7X2rntpvziUy2sFqB9avfVRJkVFO8+OAfTXqomwCapHC4DMDV0zox5yjOoE
	 aDVumBj/mUjdy+uGEmV5cOaZDse+9GG0KTFMPGopJTYaR6uAEJ79rGyBYXBVO5/0A5
	 bgvqhXrX5cxsIBxWpU4uGVesK33WJIFcyP0cRNoxCBnkGiwzsVEZi2SNEA9e13LiNR
	 tvQpN2mQLh26o6N0OVWdRffZXUg470A4dggQlZUVWrru/j9KyTrE/QGzAlyZ7tPQ7v
	 WE27oZSCQavrw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A43D217E120F;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 03906480035; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:34 +0200
Subject: [PATCH v7 07/27] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert_all errors in init check
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-7-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GddMKGozg9gwmZ5S+Q3mmfUg3GzcQJNKOpZTsWGf7kM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9tbEOmsLqXmD84ICXbdkCNDeviYBp6rB
 JAVGokozVj2k4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaOgUP/jWwehlH0XXSCqRCqRXJXm3ri3zYUrawrNoLFIEsOfkvMbQEZ/8WLcNjam4+1YCVcaR
 y9ksf8zLEPjTLXXg2Lzs5QSijanHBJUqFlE26sIrcC9vQSH5iBc+ZTwY1yyMWDUFBrdWKsEfWtc
 lIeTC32MWV3H/IpgGWjuHW9RhpbckmIfXptxjYX0Vj2Nq7N0hpfOPteBHbb2Oi76sQ+7cAUgsYZ
 w5PGlAxZdABJYFsf9mNK7bvCQ021BC20pvgZ/9JHvwl/I/jISoOWF34HrsDavwRK67cGKybKD+8
 yegeyV1OlMGrznzkczZRXyQaTRJd6xNXOXVt1Ft1lvMlXAegiE6XvsV2iBd6YPj6bi9EUHvxjNo
 +U/sJKog4ac/yvHnLmnRMBsjnD5ivkLz19GRA62SPC+EZrhS5fku/80kk4IoUcvn0xc56Orddv5
 2E+/KDf6VDBA3BVvvLBop21XBEXj2Fx+8jGZ0hd8Q54vUfAOsslDtmhFum6ke4C4QU7a+Hw+n0q
 P3xqUlBMUFFhBSX5a5TCnj74ECdAmTTXG4p08///gtnEPGcXFZL6/39q0toQJfih5XS4LovllN7
 6dAX6E8mUDPNriFnZ9l60q95MY1bwgnnrq/kjSyYbyhNmWs2FHWMVo8SqTb46+CK41E0A5+ZwOy
 jmcRDd1FyNGqDb22EuXEslQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Fix theoretical issue, that failure to deassert the reset lines would
result in an SError in follow-up register access. Note, that this cannot
happen with current code, since the Rockchip reset driver never returns
any errors for (de)asserting reset lines.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154903.2225A1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7fa3cd519577..121dd78d8c16 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -935,15 +935,18 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		return ret;
 	}
 
-	rk_udphy_reset_deassert_all(udphy);
+	ret = rk_udphy_reset_deassert_all(udphy);
+	if (ret)
+		goto exit;
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
 	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
 		dev_dbg(udphy->dev, "Started with DP PHY pre-enabled; seamless takeover unsupported\n");
 
+exit:
 	rk_udphy_disable(udphy);
 
-	return 0;
+	return ret;
 }
 
 static int rk_udphy_parse_dt(struct rk_udphy *udphy)

-- 
2.53.0

