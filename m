Received: from mail-m49212.qiye.163.com (mail-m49212.qiye.163.com [45.254.49.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630483F7A87;
	Thu,  4 Jun 2026 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563517; cv=none; b=bPAwuVsAesYwH3DOg2Z+soZ4EfKtopKam8e6YK33QrqqWGy2/n/d6iqWrykuVt7LY/eq63YgDnfQj480lcoo6ecEGgSvGq7l7Um40n95wawQTXWJXSbZcQUxwHsl989IVp/poekIVqXUUjtJWY5Qnd5dnobs7R5e0kCnMgZ7eqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563517; c=relaxed/simple;
	bh=6pUnD1VZFUVIHo2dUlqvjxwiN9CPLJBTFjP0mdEpF98=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NGnV3PGkftuFkYZXdwW/mmfvpv2pmbXdpfRiAV6d+ZmI/xwcy6uKKh+iK9jqzEhzpBC3H5yWS2XeQrHrawGzRv7Kd1LylVx12+GPo8vT0evbxAS+jY8cIyibEfad8z6wFf95pQ8c/JYnOr7JVpfxnQs7K5gzIlKuwvYS6UxPSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ISOkaqn3; arc=none smtp.client-ip=45.254.49.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ISOkaqn3"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 410f6c9da;
	Thu, 4 Jun 2026 16:53:16 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 2/4] drm/dp: Add helper to validate DP lane counts
Date: Thu,  4 Jun 2026 16:52:18 +0800
Message-Id: <20260604085220.2862986-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604085220.2862986-1-damon.ding@rock-chips.com>
References: <20260604085220.2862986-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e91d63bbd03a8kunm52a01cd0409908
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTktCVhkdGh1DGE4YQkoaTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ISOkaqn33xDGR1+G5j0ZVei2/HBuEVAzaVlXIYZNFH8pjcu3U5DesmPqPNH3xI8kRkuc9lksYWo2zhgHIGxFzozvq2/jyGOz45rHazQTFzXJs0heJ4v4QmH9QEv9GZMb08zLj5fMOMQkzCO4W6QdTmohhmv5cMekmME4J1EyPEI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9dIv0NNIoT30XW+12t9f4ox/v0SxbNDGY/P6QADqWYk=;
	h=date:mime-version:subject:message-id:from;

Add a generic helper function drm_dp_lane_count_is_valid() to check
if a DisplayPort lane count is valid. According to the DP specification,
only 1, 2, or 4 lanes are supported.

This helper avoids duplicating DP lane count validation logic across
individual DisplayPort drivers.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 include/drm/display/drm_dp_helper.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8c2d77a032f0..c904cb480d84 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -138,6 +138,12 @@ bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_C
 
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
+static inline bool
+drm_dp_lane_count_is_valid(int lane_count)
+{
+	return lane_count == 1 || lane_count == 2 || lane_count == 4;
+}
+
 static inline int
 drm_dp_max_link_rate(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-- 
2.34.1

