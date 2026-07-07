Received: from mail-m19731101.qiye.163.com (mail-m19731101.qiye.163.com [220.197.31.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB938E8BE;
	Tue,  7 Jul 2026 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417826; cv=none; b=ViT5eT/orgTDv+QHyHjQCgv9Nvgrz3LSzc8aSBdfBXThg0Ypjwv5fPff+YtmI52BYcHpZv6xDuFmIjC7/EY9mFSvKsOhf4ZLqwJw7xt7OfTggnGIiF38szztwBA43w5qak7eCrvMPvoozL/8Pb2j3kWDFyRIk8n18PfXV8U4SSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417826; c=relaxed/simple;
	bh=fZY2VfwpUrOebJigA2IRc7ysHmsW/LOXngQD4fE5axk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bYFLXgQPLjO1V78iLVLmnT4R7wK68ps81UHCX67ozTcShXmIWwoYSjEtqPH2Kq8UPOwDr/42ntFu6eZKlSpRuSkGhV8ewVNk9RI2qWsMxDcmxqAc9scIAfLoLqkq6LfnhMSJR5eFwuuG0zszQKDnOD8nNlBDBaztBe1C2FV/d58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=JwntmWVE; arc=none smtp.client-ip=220.197.31.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="JwntmWVE"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 452ef5835;
	Tue, 7 Jul 2026 12:07:21 +0800 (GMT+08:00)
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
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
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
Subject: [PATCH v6 4/5] drm/bridge: analogix_dp: Add validation for samsung,lane-count property
Date: Tue,  7 Jul 2026 12:06:12 +0800
Message-Id: <20260707040613.1992841-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040613.1992841-1-damon.ding@rock-chips.com>
References: <20260707040613.1992841-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f3ac252f803a8kunme8126cdf5bc93
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZShgdVkpNGB1CTR9PGk4eGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JwntmWVEzE0km0fKlwwuBXTmVIBySdS3xIweWHDatGW3zFxSisx9q3RR9d0aAUe+rIQ6X86CzuuI5XqIqGNUhK4ajBncMUH7Hpqc9Ye9ZogsdLUQp674NmB0yNBBRImiiEJx5buqKGkraIyyJ058paMbUdtJOnFz/uP+gNkMXaQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=mLPv+VMsVdg/2ajzDFl3mJXUyg4DWZyAqc2dUZvsmmw=;
	h=date:mime-version:subject:message-id:from;

Add validity check for samsung,lane-count to ensure DT-provided
lane count values are specification-compliant.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v5:
- Apply DRM DP helper API to check the validity of DP lane count.

Changes in v6:
- Rebase after the new commit for restoring mandatory properties
  samsung,link-rate and samsung,lane-count.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5240efcd3861..039e076d2b8a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1270,7 +1270,8 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
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

