Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C8A3BFE4A;
	Fri, 26 Jun 2026 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507309; cv=none; b=g9a7OgsnFiIT4j0te1b5dxL0KG8yhYkNy3iWs0HHJNOP8e2rOEce6m3UDPd2H7Ew2kuciz8ZO76G78vwHh8cy+4me4NOcDM7D0AaanHAagdmfiMaTctrXQ339UBjUG8MFya/RH0nNHT9BOxQMq2xa6Ciefaa21vLBRz9kjdWe+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507309; c=relaxed/simple;
	bh=wIdm6WAvSCnmDVmjn0d4nzjlUVyQK7d9rbn5XLogh8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOSvKquCkVrWqB9woHxcOwLJllqiot2iEhhfUW1rwoeVARXjSYl6pXdp7Rc2ExCytPR/bYOJIB6gM79FWnuMxEXDhIZpWkS9RODmSKz4Ib1nrZ4zL1yB98R4MLEe0RnBlVOLM9PQngqLuJwBMSR9rBFj47/p48BOZHbPz4xK0QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iqYVbMDh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iqYVbMDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=wIdm6WAvSCnmDVmjn0d4nzjlUVyQK7d9rbn5XLogh8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iqYVbMDhwwrTVKiaXVZ6eBKE5tbmln5Mp4Ahy1GfBKnui0PLjte3v11igZmrCPUPA
	 2QvrjmOS5zXqBogYNNo0E7bac1uNUjVYoK+yHYYMAYs6BsrI+C/vYaJ/qWwmgVeLwu
	 YnutpULYGVo47VheQjke3klDNP2nowPz6eBk4WHgpuKSnKmUbukRIGeQn3JG4ByWxe
	 s9U0aKjJCA4iPr2FDC/fh4UarrIUl2loo7bSSeJ+L3u4mQ90KvnSMHnFhjtsUZj+Hi
	 zPVQRXDQSAwyYUHwegFLy8qW3rlBG7oAEFbd2FPDlPyAyIW4RWs+e+T0HNbqE4zGwA
	 MANh4Zyyz327w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7D4317E140E;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 158E6480035; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:00 +0200
Subject: [PATCH v8 07/29] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert_all errors in init check
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-7-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=wIdm6WAvSCnmDVmjn0d4nzjlUVyQK7d9rbn5XLogh8M=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yWbE39BAB+33EfKvnPIrrl2F4e82Rhpy
 Fhj2WG76sGY/IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qabkEP/0fQDfGFBdE3Qjyi91pEFGDFfdMbowO1VMEMn2LpVopP514hAJkGol9ABBk4/YCYzPh
 q9PPGL8kM4g313JuDwpHTl+VyYlZrxGE4ht26BytKRwZDRkycwqs6tcgFk60VGqCR4eXizWOVlo
 kKgu29ASRVKy1uZr5sTFOZdCjA/6CQKFNiRrrOCD6pnO+5ZV5g7f9tadHbu4YHLyfLrwmf0qj9X
 kM2K3lIEaei4Nk+hkcNd028WUu+YLyFlEs4xtUxLyhR9QHBdGTcPwYkjg3e95HfYmOtrHNbLY3r
 XlYRx6v4xG0qDRvRVS/BByNozkusfG19tVqjPkx2s3l5jrpzJMr8acapRQ4Ky2XtxEUIoxjZ20R
 TOAsO+/BfWnOjfQgOwZj0xbJnOV1gC2L0519nFktLxgur65Ogu3rW1lS7YQTi40rSA2qhnA6VQy
 VSbaI68fvsMBkZLhDdCrH0rMXyz1IoDtIxOf4VekbgvOphuEdJplWXg1l+7ToAdZJVZNs2cB/Id
 6Fw2mW6GwEN6BgLJikjuOLLaEVxkKvBQXnhU3KJqWwmUIOjID69Frbc6fuwD5lGZyIV+8B3jsTY
 A2EuwGX3giuGG3SK8nFVGXwChvvnG1lSPgKiVDAIxXg41Jht/w4i1mbX+Fyxrc/DUCUwfguJkug
 scDllP0rFCxDrY4iU38YlwQ==
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
index f7ff55f03b7c..b8de0a47a616 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -936,7 +936,9 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		return ret;
 	}
 
-	rk_udphy_reset_deassert_all(udphy);
+	ret = rk_udphy_reset_deassert_all(udphy);
+	if (ret)
+		goto exit;
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
 	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value)) {
@@ -944,9 +946,10 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, false);
 	}
 
+exit:
 	rk_udphy_disable(udphy);
 
-	return 0;
+	return ret;
 }
 
 static int rk_udphy_parse_dt(struct rk_udphy *udphy)

-- 
2.53.0

