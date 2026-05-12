Received: from mail-m155106.qiye.163.com (mail-m155106.qiye.163.com [101.71.155.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54D4BC001;
	Tue, 12 May 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580762; cv=none; b=DvrPucgqWxOT3k/WNvT87iZ1gUsi5JGXpPmeRTNYFwADWKLdY+90EhExjwQamEp/B1XPlKLlp6D+YQvkJl0P5889zZQ33aFBcSjRVoKCfiNoKSpTL8SDXabMqBVyYloEfhU5Lw2mlAmtAn4iD5RLttYs2/+7zxYE85dWqCTVnCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580762; c=relaxed/simple;
	bh=jIM8REqUrglfXMYe5oLZ5fpHYQNgLu+RWFD02UzChd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IQqISVkr6iO2e8xsg4cLGBQ5BDa5vM97mBR/UPp25up4KdtvCMgHhl3/atAERL/pqBym0fiJs/cY32xx0CVmIeN32qr/OKnqLMxO+GpOW2wLcRuS37jnnK//KbAOXGhq+cf2VaCbr7Qsnso2g+Yk0R1GIiXorki7FRpxBuZAfDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IH4z4M18; arc=none smtp.client-ip=101.71.155.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IH4z4M18"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e1830344;
	Tue, 12 May 2026 17:57:06 +0800 (GMT+08:00)
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
Subject: [PATCH v4 10/10] drm/rockchip: analogix_dp: Add support for RK3576
Date: Tue, 12 May 2026 17:56:44 +0800
Message-Id: <20260512095644.1946084-11-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512095644.1946084-1-damon.ding@rock-chips.com>
References: <20260512095644.1946084-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e1b9e691e03a3kunm05d2ddd61290a9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0odVk1JS09MQ09CT01ISVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=IH4z4M18JGjzFiTAeUaoopq/j2LaXZNBC5fpyr6OfnFyYXNV0mJ6E49DqHfWwaDTUoLyez1uusVjk7QqWLh9yKwKhfSqtkookdaBa7AbcGwGqn464U0kjFX1CNWFhvSHgBKRoFpgGK3PgDW//Qr5R+70UA8SA8CUti/wtZfS75o=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=edZDAKPiDlvqHKvoUwOBwwRUJ9g2BB/RXNhTktgWsfA=;
	h=date:mime-version:subject:message-id:from;

RK3576 integrates Analogix eDP 1.3 TX and Samsung combo PHY
hardware blocks that fully match the proven RK3588 design.

Add dedicated chip data table and device tree matching entry
to bring up basic eDP functionality for the RK3576 platform.

Support is limited to RGB output up to 4K@60Hz for now; audio,
PSR and other advanced eDP 1.3 features remain unvalidated.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- Split out a separate patch to enable the "hclk" clock.
- Add Reviewed-by tag.

Changes in v3:
- Add Reviewed-by tag.

Changes in v4:
- Modify the commit msg.
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index a864bcf8200e..75706a2fdba8 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -522,6 +522,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dp_chip_data rk3576_edp[] = {
+	{
+		.chip_type = RK3576_EDP,
+		.reg = 0x27dc0000,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dp_chip_data rk3588_edp[] = {
 	{
 		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
@@ -539,6 +547,7 @@ static const struct rockchip_dp_chip_data rk3588_edp[] = {
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
+	{.compatible = "rockchip,rk3576-edp", .data = &rk3576_edp },
 	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
 	{}
 };
-- 
2.34.1

