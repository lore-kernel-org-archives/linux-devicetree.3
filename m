Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1DB3FC5AE;
	Wed,  8 Jul 2026 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547877; cv=none; b=lR4ybbM8URD/tUorIfCAOZKDbdX5n7A+zxmzVzvuAWaF0w11TTnzEI2qMMjrSC5c9Oh02tk6kjrQZk3ZdzNrNT6gFe4TiITp9s8mymf03SPC9AescjQmd4pPY74V/AdSOf91epOOjgIGnmWgynta1EbsWlglKXcApEcPO5N+MIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547877; c=relaxed/simple;
	bh=1lxL6iZj9jod6SaADPf3z3MD+LcfeBUp8hGTnd0MHzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oIrrfyW+1f3I9Gxq01Fstyi2sBFfjgedeWss6mgvwDksP8d+i6aHcxSWgFMU+HMvXJTS2hnxZwrJAYQSLGuzqb4Gy6+LET+xxCvWuriK4gcrJb9zh+Z8n9vx1uB8AulR7sAgAwYHm9twJn7jT5Gvfshhm6JZJ7vMdnIWNoc8ZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y7DSDi1f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y7DSDi1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783547874;
	bh=1lxL6iZj9jod6SaADPf3z3MD+LcfeBUp8hGTnd0MHzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y7DSDi1fkQNsCADtB3pxe5jxw6CpJNLb0/9SV3vEFJylYMo9JrKXujHmcT2pvfglB
	 ID8gnmqTsn6fj0I5sMEbp6qfibzKyHA/cusY5Z314alYRuWT2YLuDJoMTmO6TA7dQa
	 D+i9MH2zU1aTrrRMOu5zbiaP8Sxruasosn8CYtIEsC4vV9XHv2kqr8sof0wq3S1Hat
	 heYDLuk89AApa66fWHqlu3Vw0/xHqsxPRYfPaI9ujTZomGpA9rnP+uzZObzx3F0x//
	 Zlrf5EF0/17qJhI7XRcRjPF7eQOVK/WzYFDOuXu/1YypAmTtw0KP7m5qUjuLBflte6
	 3VJWCU0M7XtRA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D66BA17E0D33;
	Wed, 08 Jul 2026 23:57:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 09 Jul 2026 00:57:26 +0300
Subject: [PATCH v3 04/14] drm/rockchip: vop2: Send pending event when
 atomic_enable() fails
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dw-hdmi-qp-yuv-v3-4-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

vop2_crtc_atomic_flush() stashes the CRTC completion event in vp->event
and relies on the frame start interrupt (VP_INT_FS_FIELD) to deliver it
later via drm_crtc_send_vblank_event().  Since atomic_enable() runs
before atomic_flush(), bailing on an error path makes it skip
drm_crtc_vblank_on() and leave the video port disabled.  atomic_flush()
still traps the event in vp->event, but since the port never scans out,
the frame start interrupt does not fire and the event is not delivered.
Userspace waiting for the flip completion then blocks indefinitely.

Note the event cannot be flushed from atomic_disable(), as userspace
waits for the completion before committing the next state, so the
disable does not arrive and draining it there would deadlock.

Use the newly added vp->enabled flag to detect this in atomic_flush()
and send the event immediately when the port did not come up, rather
than deferring it to an interrupt that will never occur.  This also
avoids the spurious drm_crtc_vblank_get() WARN previously hit on the
failed enable path, where the vblank is not on.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260706194935.AC7601F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 271c3cba6fb4..4bb1985b8726 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2083,8 +2083,19 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 	spin_lock_irq(&crtc->dev->event_lock);
 
 	if (crtc->state->event) {
-		WARN_ON(drm_crtc_vblank_get(crtc));
-		vp->event = crtc->state->event;
+		/*
+		 * A failed atomic_enable() leaves the video port disabled with
+		 * no scanout, so the frame start interrupt that normally
+		 * delivers vp->event never fires. Send the event right away in
+		 * that case to avoid stalling the flip completion.
+		 */
+		if (vp->enabled) {
+			WARN_ON(drm_crtc_vblank_get(crtc));
+			vp->event = crtc->state->event;
+		} else {
+			drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		}
+
 		crtc->state->event = NULL;
 	}
 

-- 
2.54.0

