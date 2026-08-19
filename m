Received: from mail-m49247.qiye.163.com (mail-m49247.qiye.163.com [45.254.49.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4F3890F1;
	Wed, 19 Aug 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128124; cv=none; b=WL5ZVP1b3DaKXLZ01mbE4ySVj0mj7TG7E6xGKWc/15RFTxP5EfvqRpRfLAzAyZWkRxoYe1OuzPDK6kh9ylX9JVkHe9TeYhrfz+MCejGBFjE/6D+pFRzaH3tKIhRV5N30nMApbEKf90Q7G0hO55nUNU2NwY4nBE3hgizijvmrrPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128124; c=relaxed/simple;
	bh=EGc2jTS3oA/w9O5c/npYY+tNjKBHzGb7vkKuG05Wbbc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X3tlcKQ27g+YYLRKxSMxYsBCz8iiMwmiMjTg+Z1u4jSMh10L16LsyvD3Ny3ZhclQBom8HtLxyX92j8I+Q+i1RVFL4GWEcu19RZHsXOovi/mHrWmyHNwGZGsFtCDRn9+Ud3yVFot0/k6I2YuuxbeE8eZytGlYmyj7PcSkLBOOmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=HzCKaOW9; arc=none smtp.client-ip=45.254.49.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="HzCKaOW9"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a893479b;
	Wed, 19 Aug 2026 15:53:02 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 4/5] drm/bridge: analogix_dp: Add validation for samsung,lane-count property
Date: Wed, 19 Aug 2026 15:52:37 +0800
Message-Id: <20260819075238.3007087-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819075238.3007087-1-damon.ding@rock-chips.com>
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa01902646003a8kunmf3c4117e328bca
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSR5NVkNDGUhISkhKSEpMHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HzCKaOW9WVbpPe+w4/1hzHZaG4ieDLwJ6pMO+fx2kpJA/wpP6czM6EbZpbGY0HaqGzRkdjMdMmXkhGyqBYajk4WZV4bnan9DveUsgx/ztdJ0EDE6RwzeLVi9T0qLy8z4yieZQDO3IdlkRXr2KJoKFO5zc7LgY0qZ09tjJj4ChtU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=sufZXYFvhqt99gCkQ0mCK5s0oy3fyCr/7BG8YjyOEgU=;
	h=date:mime-version:subject:message-id:from;

Add validity check for samsung,lane-count to ensure DT-provided
lane count values are specification-compliant.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v5:
- Apply DRM DP helper API to check the validity of DP lane count.

Changes in v6:
- Rebase after the new commit for restoring mandatory properties
  samsung,link-rate and samsung,lane-count.

Changes in v7:
- Add Reviewed-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ddb15d6de05f..a74c855936b2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1274,7 +1274,8 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 			return dev_err_probe(dp->dev, -EINVAL,
 					     "Failed to get samsung,link-rate\n");
 		video_info->max_link_rate = val;
-		if (of_property_read_u32(dp_node, "samsung,lane-count", &val))
+		if (of_property_read_u32(dp_node, "samsung,lane-count", &val) ||
+		    !drm_dp_lane_count_is_valid(val))
 			return dev_err_probe(dp->dev, -EINVAL,
 					     "Failed to get samsung,lane-count\n");
 		video_info->max_lane_count = val;
-- 
2.34.1

