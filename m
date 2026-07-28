Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4A73BA222;
	Tue, 28 Jul 2026 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260451; cv=none; b=qZI7L7LYWJylaneMEkUQEwfxu3il6fL2lvliIH/br1cAxXn7TCcTPiIUGPRCDiBqBgtWALuDpmHaQj/Bz5DNWDY4dGi8a+/WL7bq+aUv8SvvrHxU9CoB1B/yLah3C6Kxt0ebuTlOoWlskP0BSiXWSjSGJzY8jtYeYS3ASMVvl5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260451; c=relaxed/simple;
	bh=Sw0eBvl1Fm8R1WcMvoZrOtiF6wxkEL0dY1GQpPPGQ6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfzhU/Gib9Z9rp1aUUmy6cs0vmCJoKIoTsNFvOgu6mj8+mT9GuSy7W8h5DUHMEZzfwyoBMOmdkgUEWzrnBz9Nj5OjIcoC7iiypQXcOhBo6l4veyADDpA3t57Ki+aNKEqv2vW23WKibvIAhpPoa3VDgU/9MyiDRB0Ee2xCS1/3nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k2+kwQrR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k2+kwQrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260446;
	bh=Sw0eBvl1Fm8R1WcMvoZrOtiF6wxkEL0dY1GQpPPGQ6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k2+kwQrRU4hGifXPsYIwKUdcZsj2LpAHMhSfl/Rn1aIJ0tlAv+XH4ESHFqzSFLJhK
	 A/YIYpwqzy1D05EPrQT9wfosHeNONslQMTKa0ObPT9F1dXOylLSQ6gs++txe77N6Ih
	 ew0S02b0gAT//NpS/19SpWPsA+bm5g+7zOEnvo3OsbuHcq6Oem0FTJXNOZsQ2gcc1h
	 F4OjArPdvIxRpYJ7ULCDCwW7Y8ukDnd36ZRD5AoOIA/+eTbcqlQQKxcqOl4eddeGus
	 eKl2JLg3zV8tr+JVmu6YF33wg4sArWJdGDgqj3AyKMRUHbjXzSjB2w35MthhHAiRTy
	 3uCifJymdW30w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A9A017E0726;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F787480030; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:40 +0200
Subject: [PATCH v7 04/18] drm/bridge: synopsys: dw-dp: Add missing
 reinit_completion
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-4-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Sw0eBvl1Fm8R1WcMvoZrOtiF6wxkEL0dY1GQpPPGQ6I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z0DXIdtnlpb2zQk2OemZA9q006AiFoaH
 3Atf2WcSzjuqIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qaGf4P/jSrAQ3f4seld+ntVRbufACqFMWRD3d+x8Q3wJU8TXYmJ+koBu+QjtdxWSmlyCtWlR8
 LlqPfxHYwg98ZXSufGwPfatJyH4lEG9fO9ghydFGN2vQ8Zi3wNKL83OypqY4q1X+eaBdc5OhAeW
 VoU0KPey96d/9WHUMLYpGrzMBSA4qJlSomjMaZzZI6xbfc+0MnH84v2ethqUxEhnRw3blDnH+4f
 pnD6x6733MNj2ALPm1rwvkLUUw/61TI+3wvnPDy8ySk7CrjefgqUJF2bBTNHiS8LOh2uA2L5FP5
 VVtY6LARhp39zEK6JJRbb6QiIaWlkCbZDn0BffSIIn96V9c52ryZaqC4UeSdNB9PoazdIfQsFHM
 UhzJeBmZC9qLkcSa1Zwd7DNhVI5tEY1QtOQ264L+Qu+YAkypx1embMOQuMzRPWmgpXEqcza20N7
 KEvczu66Aw4KAkHZQb41rUka7XeJ9hOAfTb198mg5Yicgo55SqWOwmAcvsEByXficlG01piTvRW
 JAeuXy5017wxLM7XYyJ+hyfbV4jYErt1I2+oe+9cdhWdQPIUb0lCHikQPhg7b5ydSV9cUdAZPvv
 IzqEH2It6yf4qdvnRvjOPMWRU/xWrFYMlCMSpweqEzvn1pLmB3cWorza0dgACnX4PTSsJF6kgq1
 JyVvg8UfO48wnhxbforIs0A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The DP AUX transfer method uses a completion triggered by an interrupt,
which can timeout. If the function runs into the timeout and the
interrupt fires afterwards, the following DP aux transfer completion
would trigger immediately without waiting for the interrupt. This in
turn means the next one would also be broken and so on.

Fix this potential issue by re-initializing the completion before
sending the AUX command.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index ca7ff544d243..951f1e280e47 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	reinit_completion(&dp->complete);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:

-- 
2.53.0

