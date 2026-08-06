Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800038332F;
	Thu,  6 Aug 2026 00:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785976759; cv=none; b=QQHyuotuXBnwhKsMkx5iENcEFX7uLMdvechSbvuUn99RK2+8XYBBsJQclknhiOq/aUFWZ8mwW5bDkpvFt5CSFCNCclp/8ijcZJmgDgXiIi81wSoPSA6J1Pq3OzEdz+a7rVdI64LrQ3lsFu0SeKwLHJpdLFLuKNtd3V8HGgxZEpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785976759; c=relaxed/simple;
	bh=MXKziEXcaaAN5ybtaER2wtFJ0oAuG2XANzY2ZyvyAkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xb+IEHY187rG3kHFUeI+3CgUM3B0CpVPhkev01d9euqQ29AyV3mc/2VTyLuu51kdD6Ut03VI5a+E4LDf6cn2puVmwc32n09+hhesP0SI0uWRYenRM/SWwGECa5GKLfCxCp7CBrE2DNMUquOV7WZHakH9i6H0u+eku//RdXojUJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pd0JrudD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pd0JrudD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=MXKziEXcaaAN5ybtaER2wtFJ0oAuG2XANzY2ZyvyAkY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pd0JrudD5AruG37n9hLi6TvmBVyi2CytLsF+1KW/N/+fGmWCabDEYc+GGVRLTH5HX
	 VKRyIH3XoBY2jN8o2w99ihmwynFmuhF8s9lSPu2hBLW1J7jzI8/s9PPGSLgH/accI6
	 wfw7/amWJCS1AQOq/CSGjQcOrVVGTtsbMDmjmoMFbwGG4bM6K/VhhF1lPff9qtnmda
	 Uoik+Lg1LY+7wJYZqOMMiSK3Amd8BsoMJ02FAd7atIGGd/ls2Su6fjFlPQDPdITOKo
	 xwsXU5u/4opT3jdC/rJerQ5DnYXoInOhmzXZAkD8eA+7QyGkwu6Ey0i42X+y5fBe4y
	 vaAp91EFZhpzw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B5AF17E07C2;
	Thu, 06 Aug 2026 02:39:11 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 90E95480038; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:13 +0200
Subject: [PATCH v10 07/21] drm/bridge: synopsys: dw-dp: Fix support for
 short I2C reads
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-7-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
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
 bh=MXKziEXcaaAN5ybtaER2wtFJ0oAuG2XANzY2ZyvyAkY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz162etrcu/cgKVHRD+LGKL9qoeXu0fBeiB
 O2H7LxOJTXW6YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9etAAoJENju1/PI
 O/qaMNIQAItcvqeLuS53smgADmTjbGA4wJK0Ar54lPJk+2fh6p/TRB/tgGTLLt3qj9+Ui7RCDpd
 7nON6eUnKnO2FH1qxXpQPBVJqvazg+S4MO1PGoRK61N2oeauYRTiTLsCLbDJF85dlwwbCxD9nti
 qL/qzV5axKXZ6fWJKK507XK0kEhD3NTQ9QNcppsWVOMv0q5Rq5GZAcKhvSNRr8ImhfPTWCJTVRm
 IEHyb1T3VuDpddXPlor20VGYzxCpdIzLRoVaOn6hhoXil3eabG6oS2PcigIHVrioRmuooMqBaSR
 0Bs8kZIDMYiG8X2rQA4FkKWB4RariHiUvDu4/yBea+hep1U7MhSZopLeDtGzmdHN+k7QUg+14du
 K8QYc4kdwgjGCjgj48Gyqg4fs3zBMY+oypqymG/bEEHUCgiqx6dhpVg5qcBA1UGEiwZoWVnFfSe
 81IY2oEiivWZCj6NfCYR1ajCiaK1IZnRe09W577a7T3LGMfxLrTR/DIDcGKRk9TCe1XBLOW9GhR
 6y7nRRkBS+bNIgSQelfj5PrXJMZEvyS3ZGSdgBJRnYofJAz1vM3bAQlorD69y4JxvWKyz84ZsYB
 3DUhby2J1vxGc1Qy4YYNSYkNTSVFrk/cTWlurKusOztFheEv7viuavavMtu9WyUs51/IH+WqdTU
 8qwPJQB1xuUGRQBA3dgYkOg==
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
index f82330640380..696cdef279fb 100644
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

