Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D6B3B42D4;
	Fri, 19 Jun 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882945; cv=none; b=i+9Mmu/NFOhPav21gSxkOb5jCdTn69NdHJnFcjxidPMuyq+W10aVeeeZyYKHXxl6iNbRYF9fwBpxptxoxgMhB+TcKT4AscIZmjJMEidT395nJvAmG0mh0ceNx+h5jGcULyqfMXwnzOLoMdlUfwQNS2rV5UPWNOfUDth/YkpyzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882945; c=relaxed/simple;
	bh=s14hSsNP0osKXinr4iWclYN6vFiEnD9Nkat0LfmjKmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNBe19wME3GITPoR0onfD0s92JvzQkZGb3/Q73wzviq5MQQaxT96k7b5KYWGL6chMt6CMl2t7cXfhBjvrzIai9sZqNkBvV5e58RUaMw20WOr3ZRl/1iqLkuaioCa8jwY/o9BDObuuwQq0Y9mFtPbfjrBo07jTAEcT3RI4FD5iuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AKtsY2Qf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AKtsY2Qf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=s14hSsNP0osKXinr4iWclYN6vFiEnD9Nkat0LfmjKmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AKtsY2QfVidBtS3hDXI89Ds6yYCEqriwWsyOSJeiRCpgWuUxwY7M0ejB9D/9JiXfW
	 t837T3CbeAuNQ6x6JrR+/hqDYu4zxc6ie3nzYdA3WcN/wNx5pyUwWNPfc0goj4B7b+
	 f243Wnw9KW6lVfOGpkGh/Px2TObRVFBWWRWzFpHvd0LryPasOnTB3qD5Dey22Ao0Qk
	 PjWLtmErbZHiVg+FBLRIKXpDdPXHTc2UR5NWvAaacZQ47wnnqZe+2Y3b9/C3lhQi86
	 cUBP0qTupqCIMKB67rTsqOxecxsXzmBUvK7ryl5Ob6G6BGtebj8km+M4qg21MT1n2S
	 JImIInZZeCaOw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6215A17E1583;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9C5C548004E; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:05 +0200
Subject: [PATCH v6 14/23] phy: rockchip: usbdp: Cleanup DP lane selection
 function
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-14-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
 bh=s14hSsNP0osKXinr4iWclYN6vFiEnD9Nkat0LfmjKmk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDlkvRhbTNBO8GgHHW802Yj3ZgKZMs5s2
 5LmBa1xc7zVY4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qaHsUQAJ6++/xOar/VpxBQbPBS6noAFVkLTkWW6mesZg8RcqtqO/EldrQw3HmopvKccp0TFn2
 T3WaTdr7BURmovEuAHLRNXk16CGZDCnRRUaOorrWir+w5PbisIbciYcr9Ha87ejJ71PTNb3mn+i
 woCzwheRP+xiHdHjO81SyLyAbZXtQA8Ra/vCEVxQThdYEpLvCfdcnV0yKupbsyD0zkJaRZ8Crpw
 HipfOkQqcIKzWZXayA0MxNnA6FcfWjezUsk5hAa+oroKZ3yx1I6cLgFHFbz4r7PQv4MIlUm0laV
 p+M2M3KZWAnm1znWLEIkwcpLxYb2Z9vtjrPJ3QCVYn2V5L+SV7Juj8dFp3TuY6PdP4dEkQaWEai
 GnEeR5Wy9baTLC9u+jes3sWpC3g3fYvv7qTjseyDCIFnRpL2CgJznZEKd8U5V6HU1aJlAvW1bMq
 HYvPWfMxxdDglsGBZe4JwihMcvRCkANt96f6xR510UqZpkLotOkt/zgj0hfETH47h6lX/dRXs2v
 rDLrUapGPLTKnOPS3bGGgzU24BvkIAWjVWHxdmhDYrxGdAvPEa39avzlSCHv2dCWRI7SXpBGBPb
 pnGCG9tw5OOraclhPojMqcNl9vIFc7gA4/bZeDI5McRSm+Pzh74ukUm7Lj/yTj/5SJf1wZre9Dk
 rae1kNiqVrqv0Gwjapkgu5g==
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
index ceaf091b9101..da769790df98 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,30 +550,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
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

