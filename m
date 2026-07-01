Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615F4C9565;
	Wed,  1 Jul 2026 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908483; cv=none; b=gKgsCTkQwd7vlxNLVAQH+/isycDVuDEQ73ipt8rbgdoEpJ/58+1VsiYGHE6VTDCeObqmUXcOY/F4DO5RLfHwe0ctDAvp35xuzCMGyd28X8KQkSsbq3jvHfoO89ZaQZCs7D55v6RdJwe2xogmDcolUkZaH0VRN8LX8ue1tEivJy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908483; c=relaxed/simple;
	bh=OryipZnNxhLlRdm+3lpvG6AyEh4fSf3cynz+sCxHUWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDg4bRHpuo6u75AjYyUZ1AO3LtQlDqbxgpihcKw4CaRsIB/Cv6kn0d/M5AHAtvZRAHYN+sByobJic45WK/qkd05hekviDtKf5HgvxwWefgnnwoJIcSiFeKhQrveXK7sVsXQaSPS2G8znIYOuIujANUugoHhiXX8ypCrKAzJet/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d3k+IANN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d3k+IANN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908480;
	bh=OryipZnNxhLlRdm+3lpvG6AyEh4fSf3cynz+sCxHUWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d3k+IANNLCAne8Gd7yxoL5LTjOwfFJDx1bCV6CD6QtRYxbM7o2kwvATbE1QJBl70C
	 aCRACDUW1fI2IrZrnl2PuZSaeftr58GFp3d82bAqSGSDR6W2uYMZKJZqsldspnDTAo
	 bHokN1VLgXKs9Ypl+A9P8tgl3J/tGYJfnn32p9FurZehjWWUiHB4sGVvEzffaJNSdI
	 RXi2CskVXYiaHN+5qX/0w9VrTCtqTWx9C97yXi2AYU7yvkLUa+vYequuiMztXCwRM8
	 wwWrIZUJnJN/3IrwttMiIbXB1SYTD5E4Rn9fjC3B3D8g6XdXCmxYd8kVMGttSmEKMQ
	 JlrQYTBQN2k5A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 21E3317E116D;
	Wed,  1 Jul 2026 14:21:20 +0200 (CEST)
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
Subject: [PATCH 16/42] drm/mediatek: mtk_crtc: Minimize spinlocked time in cmdq callback
Date: Wed,  1 Jul 2026 14:20:31 +0200
Message-ID: <20260701122057.19648-17-angelogioacchino.delregno@collabora.com>
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
index e543fae9c580..35e78ece899a 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -287,6 +287,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_crtc_state *state;
 	unsigned int i;
 	unsigned long flags;
+	bool cfg_updating;
 
 	/* release GCE HW usage and start autosuspend */
 	pm_runtime_mark_last_busy(cmdq_cl->chan->mbox->dev);
@@ -298,7 +299,10 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
-	if (mtk_crtc->config_updating)
+	cfg_updating = mtk_crtc->config_updating;
+	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
+
+	if (cfg_updating)
 		goto ddp_cmdq_cb_out;
 
 	state->pending_config = false;
@@ -328,14 +332,11 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
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

