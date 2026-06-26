Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBB2241686;
	Fri, 26 Jun 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507742; cv=none; b=lrjE/BhoUHKYpKGF9c1igz9nD7i0w4aVI+aARKyofp1X7Y3suRybSpB5W2wVORWoa12zz/VNCbhnAF96tpyicvp5l5S7nGjlmz4kOayse5aUJdr1cHF3T+VD7I+LMJceH6iuPZytIDP1FueEu0zQued4Y1aedV1BqhWlN6K8jRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507742; c=relaxed/simple;
	bh=++YjUzkdwaT01C2PgsJ3TRzb6swcGz3u8MaqmDZgujk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wn/xetazhyl9V3PPZvoQhqPWj6wAmVjc3OG+yXq9YXsh3S30nhDI3lUVqJi5AYZ2VkAGYe3COKWBYAlP0g2XLVh1Q3AQbYQx+0RKHHD9nfb7/cI8em8I3b+RQWviQVu04NXlmQ8IEbgHpPr2+mTl9EgUOOOB0YyJri/PdT8Mt0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CBdIncpM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CBdIncpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507740;
	bh=++YjUzkdwaT01C2PgsJ3TRzb6swcGz3u8MaqmDZgujk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CBdIncpMFFSyzsTQrCNLO6j83bvuJWIp6BAdq5u181oMcLlkc8VfKlZmVfDi08G7y
	 5GNoXUg1JgjRSoa70l5RL+4dttFFtbvpkFbz/xiY2H5+1jncBiFO7bkQ1MAY0TJCra
	 DGwcyPKZZFxbogEvh7MHlEHLni2ygAx/QHMz+jIXaD6p29cJ7lHiJBrOmCR5lG4beu
	 eT3WA28rFwagD7P1pHOP1bCLpBhYtpi4MJ4C1MfKiKSrAq4FI7xijYepsbwTjdyGsT
	 jC4PLK5jzf3Yjn/EmPbuORZuxT+vYxOgHjqoQqK1fBoiyrQ7vSJ26OL+h4XUdYgU8c
	 TwU5f0JdytqSA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F31A017E02CB;
	Fri, 26 Jun 2026 23:02:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 22B9D480055; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:09 +0200
Subject: [PATCH v8 16/29] phy: rockchip: usbdp: Cleanup DP lane selection
 function
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-16-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=++YjUzkdwaT01C2PgsJ3TRzb6swcGz3u8MaqmDZgujk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVmXZA5phEsEQ9/RHA/jIOXk1IVpXhZu
 kwcYTsHEx1ieYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaFi0P/2VM8Dj3PQSNBPo8qHNP1SwYzkMiBCkci6g4uWyMQoV7Tjgbk/qF991JZtIrrzFYmBe
 K/a0HYhjHMwRJ/WzoBhrsa/MUiKif/7wO7NwWnzhI4UVjSdeuQO9/sKeumnrKU1Sf0CW2Cfo79m
 jP8/XwhXjTtv29CudeQPEaUYyZkiZcMs26BnxIPI/2Zhb9NctXy2rnFAYk4sM70/Jbg8K14Rwo/
 XL+eKsccPUIgqdOpDqS7UOSM+ZCxiswzwtjVuhLa4N7H+bTFdNz3gyN1FW2z9q4+jGDTLAiZznL
 Q28gJXwiWyylAUlmkkgf9ZYYh35uLQADvD9gBi13lUZFtMHXj+XVBZgSwiEiR3Tp7P1PV3zpe5L
 DCHfw8MaOPG7ackbRC/+sfXSkCLXmftTneqMGoVGMq3FjDsATBJfWUzofJaRab/YRdEDUQ//an1
 cObO2GcyVYgoaH46MHMt7umQ2ZrtbCSI99rEMF1na8DZzMFXpax2CIZYTOBIGIlnr+WvOIcoLPc
 OMd5s0ayjqdhKMYb677THDM1ei0BYF/CfKqs1/O6YPHzntBkglNF6vcbYrWbBQZEWHmu6k76Qk7
 yR9WE42IzkA2rkEaOF8gH5cfUYqsbYf0TiT2F53zdUHA5hFCzYbHyzeAW492OGEioKSVj9KAFH1
 1e+toUKdlcyWcz/vpLncnbA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index d8978cd22707..e243d92483e0 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -553,30 +553,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
 static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-	u32 value = 0;
-
-	switch (udphy->dp_lanes) {
-	case 4:
-		value |= 3 << udphy->dp_lane_sel[3] * 2;
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
-		fallthrough;
-
-	case 2:
-		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		fallthrough;
+	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
+	int i;
 
-	case 1:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
-		break;
+	for (i = 0; i < udphy->dp_lanes; i++)
+		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
 
-	default:
-		break;
-	}
+	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
+	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
 
-	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
-		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
-		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
-		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
+	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
 }
 
 static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)

-- 
2.53.0

