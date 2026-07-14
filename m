Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0462539B947;
	Tue, 14 Jul 2026 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029496; cv=none; b=LjONvXD7d3V8Q4KsgC1642Jlmo1MvRlgwTkZXrFNxl7T32w8t7SoZgQ0Z237ugHid9omBMmSdn72FIM3OZ4Z4FonkRAXNLoHarq13XPnietZXTNTdgvZ7ZA7fML5UAUuz9mZuOXhN7NC2QEiyPy3x4FegWV+eYxxfHgW7vC6iZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029496; c=relaxed/simple;
	bh=OmKruBuMwOuM/jqTHcrOt10988D6GNY5qNqd/zM9TCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KI12eZSApG5BQmdn+rF1VaE90QxcnDZVVu9+oGMXoVwncNhiVpH/1twW4Ho6RhzCeRKGgRwZIcnOjtUTS2it/hPvCXkda63WAq2NxmS6eJZegM2N4xHM+RLQs8HnKg3+GIBw/Gh5kqmiKrqYrD+LxA0PMbckGrKRe9qQyZuf0hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XQ5w0jng; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XQ5w0jng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029492;
	bh=OmKruBuMwOuM/jqTHcrOt10988D6GNY5qNqd/zM9TCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XQ5w0jngNb6D1U5uNMeKYsXPWUjUWjb4vJjC740GFMQ17Mw1vGctmrs4+ctsBvwXE
	 A4RECSeal47P84Z6MSxKjenDeTaRm8uYTis1kznDHkUn2wIFGv9+iy95sogiTtzFKT
	 t+xHVJ+0ca1MbafoKFkCUXfP6RWFjAp9X+Plz8lCBtfyZe8rXW0y0c2sTOzvGctI6G
	 uWBGtVzOvibucycFutQIUJ2dh9nGiuMklFTnKombycKUWR66VD0Vch1FWCOzCLCy21
	 aCDhcxFCJnHBq9HrD5yQotJUQwLskJmFyIRGR5EJ1dBudOdoZ5khNd63NnQ2S7jja+
	 HdnRUgtT/m1SQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C21B17E010F;
	Tue, 14 Jul 2026 13:44:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 18/46] drm/mediatek: mtk_crtc: Complete documentation for struct mtk_crtc
Date: Tue, 14 Jul 2026 13:43:46 +0200
Message-ID: <20260714114414.184512-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mtk_crtc structure was missing many member descriptions, for
which reason, a while ago it was demoted from kerneldoc to code
comment.

Add documentation for all of the missing structure members and
promote it back to kerneldoc.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 33 +++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 28c0269c3424..e74f6244606f 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -41,18 +41,31 @@ struct mtk_crtc_hw_layer {
 	u8 layer_stages_nr;
 };
 
-/*
+/**
  * struct mtk_crtc - MediaTek specific crtc structure.
- * @base: crtc object.
- * @enabled: records whether crtc_enable succeeded
+ * @base:            CRTC object
+ * @enabled:         Records whether crtc_enable succeeded
+ * @pending_needs_vblank: Records whether pending config operation needs a VBlank to finish
+ * @event:           VBlank event to signal upon completion of state update
  * @hwlayers:        Array of mtk_crtc_hw_layer structures, one for each overlay plane
  * @hwlayer_nr:      Number of hwlayers
- * @mmsys_dev: pointer to the mmsys device for configuration registers
- * @mutex: handle to one of the ten disp_mutex streams
- * @ddp_comp_nr: number of components in ddp_comp
- * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
- *
- * TODO: Needs update: this header is missing a bunch of member descriptions.
+ * @pending_planes:  Planes pending atomic configuration operation
+ * @pending_async_planes: Planes pending asynchronous configuration operation
+ * @cmdq_client:     CMDQ Mailbox Client structure
+ * @cmdq_handle:     Handle to CMDQ Packet structure, used to send a packet
+ * @cmdq_event:      Bitmask of GCE Events that CMDQ listens to (to send packets on event)
+ * @cmdq_vblank_cnt: Number of VBlanks after which CMDQ packet sending operation times out
+ * @cb_blocking_queue: Wait queue for sending blocking command packet through CMDQ Mailbox
+ * @mmsys_dev:       Pointer to the MMSYS device for configuration registers
+ * @dma_dev:         Pointer to the DMA device (usually linked to an IOMMU)
+ * @mutex:           Pointer to the MediaTek MuteX device for HW triggers mute/unmuting
+ * @ddp_comp_nr:     Number of HW components in ddp_comp structure
+ * @num_conn_routes: Number of alternative connection routes for a pipeline
+ * @conn_routes:     Array of HW components usable as alternative connection route
+ * @hw_lock:         Display HW access mutex lock
+ * @config_updating: Tracks whether an asynchronous config update operation is in progress
+ * @config_lock:     Spinlock to protect config_updating variable
+ * @ddp_comp:        Array of HW components used in one Display Controller pipeline
  */
 struct mtk_crtc {
 	struct drm_crtc			base;
@@ -81,10 +94,8 @@ struct mtk_crtc {
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
 
-	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
-	/* lock for config_updating to cmd buffer */
 	spinlock_t			config_lock;
 
 	struct mtk_ddp_comp		*ddp_comp[];
-- 
2.54.0

