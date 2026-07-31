Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71416437471;
	Fri, 31 Jul 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508940; cv=none; b=Kk/XLIVJzqJ1FKoVjA1iN261ivUpz2KICxGqL3URYWrbMzdP42VMoupHrk+dUokkWT0C3VlXQFL65bRIDcAPG4GByHraMuIOZw5zImLfvdDfpKjGl3WAADFlDCm6ex1YB2Tbqs8lNhTApgP/0r7xg6bCLeR1DyVBT4vmiEeQmMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508940; c=relaxed/simple;
	bh=n3IX51tkpkD21CL9ldfkAQVrSezJGEvz0u6xDi+nsPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8vldu1A8DZCOXdtCo/l6Zqg5uSL+kmsRQUrnC977L/nMf/25v1YEznrPFy/WK4m8VfYAkSxDdqPsDFX4eLDIzG6vye41prlHXrGSQS5U/nUX9TRHcXtYRLRMRZpFy8tx41NpprmrqH2t8dHahD5by97RyzvdTHoB+hea31INio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lHv9n2hw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lHv9n2hw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508930;
	bh=n3IX51tkpkD21CL9ldfkAQVrSezJGEvz0u6xDi+nsPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lHv9n2hwdRdQoN0Bo/tqsTZlMVvMTTSuOQvSSm5wBb03pfBNBnoaKMO09HQs5A8dJ
	 MZ4Les7Rkbre+soRFK+bg1AWo+rszQJLoHS6iNeCAvvXDANITqmv31sB9tbnr7rkwE
	 7MEsarqOOpwsCa5VSDZs1CPGjYzlkpc3Ft2Zsw4G46LShhbpecaywE1MT8RCQwvLkz
	 Iox7f4iK+vAtiFXcBwVJDi2LXuJ+cOo+/BqbJtskeTWYGnVgIRIakUpkY5fceNYvoF
	 m9iGt2iO3An1yHRf+w/zNA596XpotkCV72+NvCq4aPKq0ze5mMEpLoiYnLtQinfHux
	 1xZm7GbWZF1nA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0749117E093E;
	Fri, 31 Jul 2026 16:42:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 18F9F480065; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:24 +0200
Subject: [PATCH v8 19/21] drm/bridge: synopsys: dw-dp: Use regmap_set_bits
 in dw_dp_send_sdp
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-19-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=n3IX51tkpkD21CL9ldfkAQVrSezJGEvz0u6xDi+nsPQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEAmiM7hQO4fCiWUrvhcE6MZZ8yW06xhO
 5kR02XdGvBSKYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qaWB0P+wVbj2Bigh3YaBXj9ndVlegoqd65W527nQuLfIfUk77oZ3boc5IEACZUUyZP6+L2nO2
 24GjPuchJylG4ZD9q14QppCilHy/MmceXAHZlBLMpZpb+wCqXBcdwmHx1VaN9hi2VoYnByLfjmp
 RCz23aH+jH40O6/rTstUUDQupp01043mtnGRm1lezIIiNxfiFtwU6fXjPnAzjxzNzBQJE21xmHO
 ygHpqzahSg4N6Ns2VTp14X0pIOtaGlgHFRnv3ArHJQ1zy0TNjDLkn9x7Ei46FTr9Zamu1wBddUS
 QBg6juVu1iJg8PJ/KNRdwWDBeWNEjVcwWAfW3QfsYqz6mVFR9QoMd3KJ6nNB6p5qGeX4mFDbSKR
 QZnNrV395ncr9sHCO9XTZeXAe0Em+wfro+cmvR+bS5BN6yd+Y8WWSQGEArBvkU5B/jGoe57teAL
 e3x/uyiWxhg735dnSIgjAmK8Mt7HwcMmkynMbNuAU150UOkRC9AMPsMXy/FyXQz5FYnUFqErsK8
 +CI2t4b2zyPdV3VjbBpLDJz2b+xgrBm6prpNhE3Pe+0s095DjHxxKzO9tPeEw1MKE6CIB9981hn
 yJ+z5BHtSHsugxNOnGDmWV3ULZnCLyWJSv4EY3EUN2fyz1qSh+YExoCRTrDzj3nLmEf7sJjesSY
 gayIny0WuzwW26dS+jKE2eA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Simplify dw_dp_send_sdp() a little bit by making use of
regmap_set_bits.

No functional change intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9b9c6d7c8cd2..a39007f13a05 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1070,14 +1070,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 			     FIELD_PREP(SDP_REGS, get_unaligned_le32(payload)));
 
 	if (sdp->flags & DW_DP_SDP_VERTICAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
-				   EN_VERTICAL_SDP << nr,
-				   EN_VERTICAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+				EN_VERTICAL_SDP << nr);
 
 	if (sdp->flags & DW_DP_SDP_HORIZONTAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
-				   EN_HORIZONTAL_SDP << nr,
-				   EN_HORIZONTAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+				EN_HORIZONTAL_SDP << nr);
 
 	return nr;
 }

-- 
2.53.0

