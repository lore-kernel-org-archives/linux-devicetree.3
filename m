Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F68488DAE;
	Thu,  6 Aug 2026 17:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035761; cv=none; b=F3WxEuJNFXkOdS97BV907VUPgut/rZRzEL/+FyYYtHDlQid5NMHuJL0hhDe5M5HTTxNOMWdTpy4C9uWeM0H/r84KUEpBU6A8MY9X1f1X1Ldoq6iuf0yf2J9j4WVG77+OhR2Hcky9dLH4JnpmnDuls4NQFMWpZiNmtgBfq9sqtd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035761; c=relaxed/simple;
	bh=Wq0t6zadtzVfczUZxnimhZ2697Ml6eWsrsvM4IRkEqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJx1njqtP0H0gJkbUjbcX/dKaQcoF2R6zBWN1AnZN1xGe7GINBWeEajpVznMM5yHd09zMjtgOfy9PDgctMSjDpSsEdbbZXGOw4DCeNXjaa3+p3Tz3l85fcMT/UF60ZoWFqzBtL0brUuf9/y4ntTyOrUt334hwzYVJ2I5B3QdeoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qgdplyni; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qgdplyni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035745;
	bh=Wq0t6zadtzVfczUZxnimhZ2697Ml6eWsrsvM4IRkEqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qgdplyniZWudnlpCHdAe/URJjdKKHgYxho32lI/YBytXc1ZKc9H6k+GnFptr9Vrpo
	 P2LmOHy6JU1EGfXpclK9GTQWX/SV4h5bxHY1OAxQB40e01u687mNHj9uQd0IMhCNRD
	 lyREf8Bq1KvjXHBYC+K3qBB71Rj+WbRtCz99hRh36FB5MHH7GmSef5vHG0VrrqY5CV
	 Se4oW6YzTmuEseH5/jyl4Iyx46JdSx+riKMhvOWTlu/7xvdw/m36bDRFubP7szYHCL
	 TmJDZYn58o7hCqMMgYsvSYoJw45mu1wFDq9+ylD04NTNtGTfVyFj8SbFpl7kygrfJS
	 I4Muez4lNelPg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E41C17E10C0;
	Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 021C5480038; Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:13 +0200
Subject: [PATCH v11 07/21] drm/bridge: synopsys: dw-dp: Fix support for
 short I2C reads
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-7-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Wq0t6zadtzVfczUZxnimhZ2697Ml6eWsrsvM4IRkEqA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viD/SwIKGDa2Ylbx0PCEGnkRYct+Kci6b
 wLO36pEPuNHyIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaK7YQAJFSR2laobDWJ0Eow2zYbYu6d29M/QzqZqMcNS9+CjgbnHsPtHwBhtFnQFAN0jBKysY
 WOO9nBP/bh95lcBz7/Ux5l7Vn4M0GJuuQrFpgDrOPpXsY+oAnhuewtN8BmDWykYjS3G9S/4xA+a
 Hv0kSorH5gm7dnKMAuHwsHHSokViGqSyBnRELPChYnE8kT2YRRcqCzfJvnkdVAXA5w9wQ8x7KFY
 Fwa5GOu+T5HSwC+5vRpYuPLT+Z1jbO37NtBzQLpeMxIArFlAEmUqbvVBS7nzQ05UhslCyxF/chX
 usMrsW51QdDm34Jv3n5BMdt7ALyIh9AbpxqIBCdDldBcDVnLAkKk0H1Sf8c2qHjfCkywVgoLD6C
 AnEiXJc2orQwWbaIv6hToCqhnq6k9Y8a9wll5b+w5vdkqOD9pHS5IOQSdedHEp2i81e1gI2OtzO
 Ups1x1FWo7oQxnOGNVsnUmu6kDfFnHOHsGk0YNBKgswbY/kAXJFb7sltG+KKgVzQw+rkFoti6L+
 k7RgjEaqh7NkXOy14otyhyXKa4DzctWP2Ab6pVKhvO5BjvC+rodAthGP6u6Y644dPSCeeHtRoEU
 LMlxuNIA97pcKZzSIZdCijv5coYtcgTdSCr701xEXnzL1fnK0nQ7fd0C4C54W2KVC3DeiKRyQXn
 Z/Do0WW6s/YaoNMGA/xwjCQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The transfer functions returns the amount of bytes read for
DP_AUX_I2C_READ. By returning -EBUSY for short reads, the caller has
less information available what is going wrong and possibly simply
resends the read request. On sinks not supporting long reads, this will
simply run into the same issue again.

Instead it makes more sense to return the data from the short read with
the length information, which allows drm_dp_i2c_do_msg() to read data in
smaller chunks and succeed in the end.

Due to lack of a sink, which only supports short reads, this change is
effectively untested.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 2573ea2bb574..8ceb139f1a72 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1513,7 +1513,7 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 		if (msg->request & DP_AUX_I2C_READ) {
 			size_t count = FIELD_GET(AUX_BYTES_READ, value) - 1;
 
-			if (count != msg->size)
+			if (!count || count > msg->size)
 				return -EBUSY;
 
 			ret = dw_dp_aux_read_data(dp, msg->buffer, count);

-- 
2.53.0

