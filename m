Received: from mail-m21473.qiye.163.com (mail-m21473.qiye.163.com [117.135.214.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EBF3839A5;
	Mon, 25 May 2026 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713964; cv=none; b=ExgjZ3MGivuSZ8dC8WB/PjX4oJD2ibQDV8V0vDKClB9v73aSdoEL76Q0tztL3tc1oguAEdyK17ZGM8s9Y7V+Tt7Q0nrCMeV/Dypj8A6ZZApQ8qyGt9HyNsn+xa5XhenoKrU62amGQf8CdwUdaosK61UiTQfv4td1oU/7EsvLFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713964; c=relaxed/simple;
	bh=Kl95VgDELILGZAexm15o4Q1yh0faTt4/gB4o8CK6AW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YuefDDdb9RW3SWL7t+Qybc1PwXDf2t9goSxWoxr6QQm6S605ACkGsqAwBC7seb36e9FRUMuyBv7Vz7OPsK/qL6rMjyeEagCwKkBlyxNBF94YnPINqn5ooZoDiT/0IS9K/eyJYn0aGl6R+VplpIc+/R/aUpFT53uU25UG8IkBcqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=cl2Xj43D; arc=none smtp.client-ip=117.135.214.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="cl2Xj43D"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fbb28c57;
	Mon, 25 May 2026 20:54:04 +0800 (GMT+08:00)
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
Subject: [PATCH v8 09/10] drm/bridge: analogix_dp: Add support for RK3576
Date: Mon, 25 May 2026 20:53:30 +0800
Message-Id: <20260525125331.140059-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525125331.140059-1-damon.ding@rock-chips.com>
References: <20260525125331.140059-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5f3318fe03a8kunm7b8971f5af5ce2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEMfVkofQ0lLSEtPSEJJTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=cl2Xj43DghSBtmvqMwE7MYRUxER6hQkaarj/aPV/7IzxM3SXzP1377izBC52k26Pa1HC5lIeZH/gcncfT/sVhMKv2qcoDBJqVta0b9T8DitsqCeU/8G2i8jJL3YujX9e5ATK9OXpkaNDIxMNhJtXJAYDZj3EUgQMAiDEgYKoY8g=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=N7/Kn7Q2/Oe9eNeVqy5zLj4EjgCcXu8JqqWQERIpTXU=;
	h=date:mime-version:subject:message-id:from;

Add RK3576_EDP device type entry and extend Rockchip check
to match existing hardware capabilities shared with RK3588.

Set identical maximum link rate and lane count parameters
for RK3576 eDP controller to reuse existing RK3588 config.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Add Reviewed-by tag.

Changes in v4:
- Modify the commit msg.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1 +
 include/drm/bridge/analogix_dp.h                   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index c2fd5b978fc0..5dc07ff84cd3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1249,6 +1249,7 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 		video_info->max_link_rate = 0x0A;
 		video_info->max_lane_count = 0x04;
 		break;
+	case RK3576_EDP:
 	case RK3588_EDP:
 		video_info->max_link_rate = 0x14;
 		video_info->max_lane_count = 0x04;
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 7b670dd769e9..0e0b87abee59 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -16,6 +16,7 @@ enum analogix_dp_devtype {
 	EXYNOS_DP,
 	RK3288_DP,
 	RK3399_EDP,
+	RK3576_EDP,
 	RK3588_EDP,
 };
 
@@ -24,6 +25,7 @@ static inline bool analogix_dp_is_rockchip(enum analogix_dp_devtype type)
 	switch (type) {
 	case RK3288_DP:
 	case RK3399_EDP:
+	case RK3576_EDP:
 	case RK3588_EDP:
 		return true;
 	default:
-- 
2.34.1

