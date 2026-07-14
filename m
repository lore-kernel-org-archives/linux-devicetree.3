Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F482418A5A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056465; cv=none; b=WwW23qrLvC3JRAXe+kZVm8Pb3qz3SuzAamyyDl9OK3yommQgv4FmWT/33LFg1UuYHuRD5c8qzBiI1SG7mE00GGk2VBkNMp4joeyYVU+XDLZfD4UOojTMpicKZgRin+kAa3FWB5dx3wZ6ZVwWAN/STg9Deg2E++yw+TY3FqbsKsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056465; c=relaxed/simple;
	bh=nHcX1V/5DxL0obHwJZnlQ0lcWaVMSqhQmwVlvf66epw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOAqFZ1apIlUZbTa5ecEc1k13DPRaxF4EAwASOKCpqaUAvQ6wTjhhhBMNaaKVeqv29oVcrhrZTYcgs+mS8CHjaC3W71WAkC/1df01SCy3GcfhAfYAMeHKygwcY+YcKGXMV7FIZio8Fu/91NV/99dQ3WcnUPCe1YQLnbx47LGyUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEsNjjNY; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEsNjjNY"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so31004925ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056463; x=1784661263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoOE61isMDDd8GP85+DE7oVM8lZchbPwwJGNjzXuY8g=;
        b=QEsNjjNYbWNnl4pK5NLmeDqaFFbwr7Fo/IUyc30X/aa2xyzZQlMNafoC8KuUY2SBnh
         oSpUOLI7drzD96cofUK5qOzhgzk6yAFZMXwzKv/cPWnzs+f1CUe+vtqU5RBj15EvDbvN
         01v+VcWhc3a0UtjmX9gfirusMYQKMi5/diii2CEpMv70BmR2Sca8tNwhlWu3pUEiPpcX
         RhKwLFp8XG82G+p2nwqPmDzjaPHSj4aQ4kWIJhSUSJ71XyIjlsf1D1Gif25dfFqE1wcV
         rElwPMEzXLWpn32q1XcXSZ13/c812IJiqhLo5sa8Ba4E/0oUd3tcK1ywW6bDfeJgg5A6
         DE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056463; x=1784661263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aoOE61isMDDd8GP85+DE7oVM8lZchbPwwJGNjzXuY8g=;
        b=fKD+oJnFr33Q0WSFSMyHwn/aYQDIlySMM/03m+fCQvHrbV1OiKArFh1xASh40/jOsW
         d78msh4XWeQ7u4MEicZ8rF0rjFturLZulGA8HkpJpJrxR2/xwlLvktc5zExFBPlY95Ex
         3//nMgz/mrLFyBQ1Pu0StopuiU9FJrohRNd1+ThBPlXnWXx3aNjLscIxjYQU4HqZTGkI
         JTVURyxgsVMES14WF2fuGLB/fFogk/Wyf3JymoVHVcbPwhvHrDPK6LWjV2MgoPLW62Cs
         QGK+fibrlj9hGs4TeePDOjYSJl+JImeI90MKMM8nFNz2hxDmaGW+xVLuJEz/uyVFt6Xg
         qzOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/e1gRWzwNIejycG7pKp2q/MfxIiYrkdmvz3ZPMcCey257eDT4UreFUlku6+cYwIE3ZGLByY+yvi7p@vger.kernel.org
X-Gm-Message-State: AOJu0YxDhM+fgKvRC2q2KU0hYi8oGaXjJ4z295MQQD7p3igq6ugzTqbt
	UP2gXcsDPZjta5tPlFN4/JUlZp/9Rrp7Mp9aLwjxA1Gjfgdzw3km/4MM
X-Gm-Gg: AfdE7cmtkOAQgPwaPrYBWOGzcYMd2V3PdsGA7GeTejhq7BPmtMqjVpHV4AGFcEb03Q9
	arVUU9TxrOCg8JNljyGSHJR6sYOYb5OYXv4yDtWPPGC6AGo9/m989XWHb1kHvPLSoluI/tJpqrU
	fyAg6a6rR8w0uJDpuNWKGsXDCj7wMM3WZDVeqxUYuD9Fp8erFPNoGuZc6NQQqzBg0icjoDBfF28
	o+JVLlA44MnVg5++T2B7kNuHwl1YZHeC2SVF+k7dW9EEpNj9AHhE0MHettYNihcoix/TflpwEId
	rKwwuaOk3EvUv274PMN3PBCjNWAKWksTUw5yKOcnEGyQBanrqvQmwADma/VGpQEL2PseHLlbule
	MwL5z2/e40LbDdOHwxZZxC0zBep4pWbxlIASJbIXeym5X163ttY5bae7B0cbrfY6357m4YQK1RW
	9P3Kw96d82JNc=
X-Received: by 2002:a17:902:da81:b0:2ca:cee0:e172 with SMTP id d9443c01a7336-2cef12fc5a6mr38647055ad.30.1784056463494;
        Tue, 14 Jul 2026 12:14:23 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:22 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state handling for Rockchip RK3568
Date: Wed, 15 Jul 2026 03:08:34 +0800
Message-ID: <20260714191341.690906-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mode")
added support for reading CL37_ANCMPLT_INTR and then reading BMCR for
speed/duplex.  This may work on Wangxun hardware but not on RK3568.

On RK3568, reading BMCR returns a fixed value (HW Reset Value or Write
Manual) instead of the negotiated result, so the correct speed/duplex
must be read from CL37_ANSGM_STS.  Also, when the link is down,
CL37_ANCMPLT_INTR stays set and the PCS does not restart AN automatically
when the PHY link returns, so an explicit AN restart via BMCR_ANRESTART
is needed.

Modify xpcs_get_state_c37_sgmii() to check CL37_ANSGM_STS for link
status first.  If the link is up, report the state.  If AN is complete
(CL37_ANCMPLT_INTR set), clear the interrupt and restart AN for
non-Wangxun platforms.  The original Wangxun-specific path is kept
unchanged unless we confirm it's a bug not a feature.

Also clear CL37 AN complete status in xpcs_config_aneg_c37_sgmii()
before starting AN to ensure a clean initial state.

Fixes: 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mode")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e69fa2f0a0e8d..cf370ba247cac 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -816,6 +816,11 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	if (ret < 0)
 		return ret;
 
+	/* Clear CL37 AN complete status */
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (ret < 0)
+		return ret;
+
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
 				 mdio_ctrl | BMCR_ANENABLE);
@@ -884,7 +889,7 @@ static int xpcs_config_aneg_c37_1000basex(struct dw_xpcs *xpcs,
 
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
 		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-				 mdio_ctrl | BMCR_ANENABLE);
+				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);
 		if (ret < 0)
 			return ret;
 	}
@@ -1058,6 +1063,7 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 
 	/* Reset link_state */
 	state->link = false;
+	state->an_complete = false;
 	state->speed = SPEED_UNKNOWN;
 	state->duplex = DUPLEX_UNKNOWN;
 	state->pause = 0;
@@ -1069,6 +1075,8 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 	if (ret < 0)
 		return ret;
 
+	state->an_complete = ret & DW_VR_MII_AN_STS_C37_ANCMPLT_INTR;
+
 	if (ret & DW_VR_MII_C37_ANSGM_SP_LNKSTS) {
 		int speed_value;
 
@@ -1086,7 +1094,24 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 			state->duplex = DUPLEX_FULL;
 		else
 			state->duplex = DUPLEX_HALF;
-	} else if (ret == DW_VR_MII_AN_STS_C37_ANCMPLT_INTR) {
+
+		return 0;
+	}
+
+	/* Clear AN complete status or interrupt */
+	if (state->an_complete)
+		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+
+	if (xpcs->info.pma != WX_TXGBE_XPCS_PMA_10G_ID) {
+		/* If the link down, restart Auto-Negotiation */
+		if (state->an_complete)
+			xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+				    BMCR_ANRESTART);
+
+		return 0;
+	}
+
+	if (ret == DW_VR_MII_AN_STS_C37_ANCMPLT_INTR) {
 		int speed, duplex;
 
 		state->link = true;
@@ -1112,7 +1137,7 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 		else if (duplex & ADVERTISE_1000XHALF)
 			state->duplex = DUPLEX_HALF;
 
-		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+		return 0;
 	}
 
 	return 0;
-- 
2.47.3

