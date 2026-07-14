Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604C238F654;
	Tue, 14 Jul 2026 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029493; cv=none; b=fya7/E9f4p2zFFDym9G5JtCaZwREoafi8BwTrHGGBWuuKL7b++w/e+8z39T3j9Ok63FTz9jhpT2Tyhe1OexXWkSvmHnWbHlB8iXei2Dciv2DnBYTuGIdHKNLhG1Z8qhYSKd4UAfhQpnt0FtEdeA35vGbmV1UUb+mnnmO4nJ+Hg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029493; c=relaxed/simple;
	bh=ydoTSNpvbYYrQu7+7L4wOkYZ6e235H5lyowps7msh+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hi1S2AHEzQRz3q6oKa4rr3zDw6Lw1ensNuyrjHt2k/7Q8RSIMZOA+KzgN3mZ12CbI2VoMOMcaPl6j03VlXqhsQgMcPnkiwf4Ch5sW3yUmQjfNKSRvpoVzTyzct84MFJdsftm4Y0ebnUp9ULkDY1HScA+uGywzGwXexGwRh+Mieo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=agqwkmL0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="agqwkmL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029489;
	bh=ydoTSNpvbYYrQu7+7L4wOkYZ6e235H5lyowps7msh+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agqwkmL0ZbtE/MF6tJ+RYet4e7DMhoyxhLJWbwJCrFR45hQOVv0jcvSD2PwPNglx7
	 FR6RNYivoo6sVQ9+RoAyo6UUPoD60l+bgufTlxv5nryf2pN6bWfRrqGFbFV3O80NQi
	 wqzBkVBnX9OeXuCpuUThnqon8Koo2b5p5raJlu2ZnZlI25zJ6gULig42tYXIJV0zDY
	 xsdByrT3pSA+X/VB8oWSSlnTwj84dXyUAVAzMbxnHMX+zR3HkKLnsvEQJiDnvA0x0A
	 khQWg75rckOUjQ0Oke7UtGmYgrLMxstrgGHclRLiJGiBP5jzA75/PvFJIQsLvezbB0
	 KcHp4LHU6Fcvw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C848817E0E6C;
	Tue, 14 Jul 2026 13:44:48 +0200 (CEST)
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
Subject: [PATCH v2 16/46] drm/mediatek: mtk_hdmi_v2: Don't warn on RPM active during detach
Date: Tue, 14 Jul 2026 13:43:44 +0200
Message-ID: <20260714114414.184512-17-angelogioacchino.delregno@collabora.com>
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

The Runtime PM may be active during bridge .detach() and this
happens especially at boot, when probe deferrals in the display
controller driver happen.

Even though it looks safe to assume that RPM has to be inactive
at that time, this happens to be true only if the DDC was to be
handled internally (like before .hpd_{en,dis}able() existed).

At this point in time, this driver uses HPD callbacks, and for
HPD to actually work it is necessary to raise the RPM refcount
to wake up the entire HDMI IP: since it's not granted that the
HPD or other children of the HDMI node are disabled during the
display controller probe sequence, the WARN at bridge .detach()
time may trigger (and will do that when mediatek-drm defers),
unnecessarily bloating the kernel log, as the RPM refcount will
be decreased anyway when removing the driver.

This is why the WARN(pm_runtime_active()) check during detach
is simply a development stage leftover: remove it!

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index d9316d30fd5f..b4c09a70c427 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -995,8 +995,6 @@ static void mtk_hdmi_v2_bridge_detach(struct drm_bridge *bridge)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
-	WARN_ON(pm_runtime_active(hdmi->dev));
-
 	/* The controller is already powered off, just disable irq here */
 	disable_irq(hdmi->irq);
 }
-- 
2.54.0

