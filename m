Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC64C954E;
	Wed,  1 Jul 2026 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908482; cv=none; b=tWpVWnWeqd26BSXZvFn8Y9hhh/WUwupZWfn9kaQcS+yYnGluB1nGv0PdCCv0kfsLU1sGg4L3ny8ZBn+K2WubnP74G6NXEpWc5QwVDEs1W3fa4GRPErWRw2M3EdTLLjbbsOl57opfHPhMOU43gYFjJr9BH6z9yzRt5JYC7fLCitM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908482; c=relaxed/simple;
	bh=xxtYdKDQGl2oTn57SJAbcDVtVzfSRsM6ZukEjORTD2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBXWXWeqLiTW5f7f9XRSdTkIxtGP22+BzBxS6TblOC0uCcURr77ZH0MqK7Kbp3GTVg7MOut/h38wf8jK4RAfsOA+K5YO4Evs8KGungJhUJ206R2tivUsqd2jLZohgqkpPZ9qWsoCyQtdOG8LhqLqos9LJ24rCfg1RpN0D08CMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OpzQalm+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OpzQalm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908480;
	bh=xxtYdKDQGl2oTn57SJAbcDVtVzfSRsM6ZukEjORTD2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OpzQalm+HgtuqiTekeSmXJgtIfDjjE0YPQtJRzjQcQRc+vNeGnqU03+JFQDjg13C8
	 tfbMW0K/YBPMqBJ96OQfPoa4d27LverVbjI4c4bWQuupmC2+Hk5K3teNBMKdt+MZfe
	 d0n/G9YfLMtfmY3Fi14Uz6LsSjZyMTW3IojRwbKKmlotKUEXKjdt0FUfhcSC7bPiS1
	 ejLMTc7d0Ne1uqGn4S24aZGZLiMF1SeryQPQgqh1Hg6Jgm8f3eiLdrRShY1myKrCue
	 RZTDLgIG48GqTt1SAdsbwXztgvRf/8x6AJdudB+Cpy0ZrhJ3BErbAvVYcgJviEyJz/
	 ATEUz0vaZqiyw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3673917E0FAA;
	Wed,  1 Jul 2026 14:21:19 +0200 (CEST)
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
Subject: [PATCH 15/42] drm/mediatek: mtk_crtc: Complete documentation for struct mtk_crtc
Date: Wed,  1 Jul 2026 14:20:30 +0200
Message-ID: <20260701122057.19648-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
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
index 8656b56618a2..e543fae9c580 100644
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
+ * @ddp_comp:        Array of HW components used in one Display Controller pipeline
+ * @num_conn_routes: Number of alternative connection routes for a pipeline
+ * @conn_routes:     Array of HW components usable as alternative connection route
+ * @hw_lock:         Display HW access mutex lock
+ * @config_updating: Tracks whether an asynchronous config update operation is in progress
+ * @config_lock:     Spinlock to protect config_updating variable
  */
 struct mtk_crtc {
 	struct drm_crtc			base;
@@ -82,10 +95,8 @@ struct mtk_crtc {
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
 
-	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
-	/* lock for config_updating to cmd buffer */
 	spinlock_t			config_lock;
 };
 
-- 
2.54.0

