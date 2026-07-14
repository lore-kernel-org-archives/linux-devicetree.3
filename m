Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D233A1E92;
	Tue, 14 Jul 2026 11:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029498; cv=none; b=R45DU7kvwKp+YcgdL3EnvHaGJCMNmn3sDKBUlDBHtapVcecDnDK414sh2ObpNzkaR314DtvTVjgm2y2PqnFy6Cq/iwbs2+P3p8oIpMNom8nUyXZLVjzfgiregYYNDLvA9wWrU3yB2jQrFyvUfv5jtTOAWm5+NqEvzP+beT8PurE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029498; c=relaxed/simple;
	bh=LUjdZsQs2qIO1Y/KnpDsKJbv2zc671Web0q/OCaOqOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tWSK6ir/uSC0SQFyoIUPQosjLI6JM8zTic5t14oFSdWHVOP7QFI0tQItIlJ+X8pfvKHMJAUMl9qiFPIDVgVzcPBQPfvs48QmwoRZur+F42Scggh0AzzXfVFWnr/aKcCdO/N8VNDRLWVWfatzZfVZ9DyH/kvFJmcc8PEkOOUB9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KzwuEUOJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KzwuEUOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029493;
	bh=LUjdZsQs2qIO1Y/KnpDsKJbv2zc671Web0q/OCaOqOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzwuEUOJtszQPam36u4Mdb27vYjSy5+Ol4f8ikN4/uQQdg+yznaA7JNIkAo6cMmRj
	 GX/6cJxWL8DL80xRCY2qrIzgDIlauS71rT48nAdiDav4R8SevPQQftDX0Wuf1jp5a7
	 Aj34E4dbZGh9YdwX8hZ1KrUYEniFD9ftMYHYpo0k7S/6Uzmus8RPZ1Uadyiv3SEk1U
	 jQlCVh7gAcCMz69a/qo+cGUpuFmT7uu/rl0Rz1dGUzeQg0k8BWAc5IQu7d9wxvsDig
	 F2E0oOw1ze56By+Ee8LB93Z2GJ7WoQQaeH8tQHQhlzODNcs9kl9qvYK/h1d0ZqsbZI
	 ZXpUtuxzzmsIQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 606AC17E0857;
	Tue, 14 Jul 2026 13:44:52 +0200 (CEST)
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
Subject: [PATCH v2 19/46] drm/mediatek: mtk_crtc: Minimize spinlocked time in cmdq callback
Date: Tue, 14 Jul 2026 13:43:47 +0200
Message-ID: <20260714114414.184512-20-angelogioacchino.delregno@collabora.com>
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

In ddp_cmdq_cb (the CMDQ mailbox callback), the config_lock spin
lock is being locked to read the config_updating variable in the
mtk_crtc structure, as, if configuration is updating, the callback
function shall not run (or shall run at a later time).

It is therefore unnecessary to keep the spinlock until the end of
the function, in case pending config, planes, or async planes
bools need to be updated.

Though the cmdq callback is not a performance path in this case,
this may be running for each frame that is pushed to the display,
so from 30 (or less) up to 144 times (or more) per second.

Add a temporary "cfg_updating" variable to aid with readability,
and unlock the spinlock as soon as the config_updating variable
read operation is done as a micro-optimization.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index e74f6244606f..2cdf28a0e2ff 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -288,6 +288,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_crtc_state *state;
 	unsigned int i;
 	unsigned long flags;
+	bool cfg_updating;
 
 	/* release GCE HW usage and start autosuspend */
 	pm_runtime_mark_last_busy(cmdq_cl->chan->mbox->dev);
@@ -299,7 +300,10 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
-	if (mtk_crtc->config_updating)
+	cfg_updating = mtk_crtc->config_updating;
+	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
+
+	if (cfg_updating)
 		goto ddp_cmdq_cb_out;
 
 	state->pending_config = false;
@@ -329,14 +333,11 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	}
 
 ddp_cmdq_cb_out:
-
 	if (mtk_crtc->pending_needs_vblank) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
 
-	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
-
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	wake_up(&mtk_crtc->cb_blocking_queue);
 }
-- 
2.54.0

