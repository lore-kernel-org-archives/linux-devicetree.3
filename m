Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDFA3FF884
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678082; cv=none; b=kZmrGo6oQwS9Zkh4EkUp/Rcx+uS3CNv5x2r8yS1B0+txK1VNLtWCW2/vMPZmkJQ0KtDVqvJcBQW1JAWTXBdkEnRWZbNMutCmOj11Axi6GaNt4Jatsfn/QLlarVczBZ8H7RcHIVxTzQaaMj/L9eJKgKiaJzIEOij7HWL+TgUUpVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678082; c=relaxed/simple;
	bh=k9eLD1ZrXZD1iMizDWP4jTUk+ML36ocfJ7jazjazAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSXH7ISh7Z9fwkYqLiRg542QHmelcwKseSDtrRvM+8G5nettkhtPXQNiyNovvlonJlUDftDSRP1GMcY1FrfFtq317X6y22Vumn2pM+fLcq6MXVJ+EGPm1C7bLlfA5/PL+nlu1YNFqTXWsGJRv6PUOmLcCQejAqVrdRTQjoXUO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZ9qugkI; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZ9qugkI"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so44219a91.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678080; x=1790282880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/eBjsMbUu4KmQPd6dfybXXRKRWzlAuXWPZqO5pNdlA=;
        b=GZ9qugkItfV559YN7ktm7UuIEEoSYtRiFq9uRbqWwXE9tU2vxMkcOG6vdSmj0/diGw
         onIG2ZQW0acpybA6VaJzvcMKEYMzDxXa82RF+6WR5vZg1oADaNXYhlgGCrOuyQhY2SRx
         DxYcTCmJNnar1wDcK3FP0vkDmpIeTe7cpC9I2YwI2NbLx9CFzM+I21Gc6Ovogq3JwR1F
         JomRXtYz3vffWgFSHUCZ726w6XBB6GnMtuEvNncuRvnhWKD097/nCyXZYwDpa0z/qj8h
         KsjgOKAPC9G0DQdDWxEm4E5TUyQTyh6mq6YTdwPsqhsGSNtDyk+L6dNRVR9SJ5yCIurf
         8A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678080; x=1790282880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/eBjsMbUu4KmQPd6dfybXXRKRWzlAuXWPZqO5pNdlA=;
        b=Z8E1sw6I2eqIRLLCcljygylOjzVt4rmU8jNTZBIzEu82JAKeaO6gzx5EdvkonWaxqu
         2ts2g1McxFihhh5L/tUiCo2J8m6IcsbZDuH0KVmEGF6gmdVMdxFyEQofINArmk15srES
         sHxsN73DX32f7p2abSDd7osEqQrPDLnlJS4qSQIKOJRC0lGBK1H30YQIbY29sn8HpaVu
         ACJAelTXreRrc8rYCuqUkkZGXNHtI1csqGmM7djKZJT9YjHDe2xlZvu47m4+I0sFbzVI
         XVskbw4LTpqar56ZNVsDucDUuJo5/oM98kvIt3S5+zVlsFzohGCer29SLRctLhisYuAC
         zAyA==
X-Forwarded-Encrypted: i=1; AKwUvBxtpSFBYTnxVKR6oJupTCwtb7FG5aI0Zgsq727WxEu/Aj9qrOgqSVk0wxt1MfT+4D5p1AZbpxorrkg+@vger.kernel.org
X-Gm-Message-State: AFuF++lG4nqbPOy8dg81hCriu3IUv0XR3JcsimUltkTK+DpresMoybp0
	3Bug+3q45NiwG3TeektdeTOV6tYu7wEksYMVfbunWofC5I/aiVS+C8+W
X-Gm-Gg: AYBFou3TjoVMAcDRLxLqf0btGJE/iuKrnEqhU65qeBQKGS9mLzLcJXK8Uqh/L8Ychl6
	GW0xlvtv3TVKRGq8iw25/7PQ4StlqZribCJyBfh0jy+NVHz5O+ghzD1EyW3yUOTCXANN847dKcw
	z3jhNDNg14DIKdRkII0lUvswERdEjdhbPspIPTkA9nmrB03LivAthZ/QWnJgdxOrL5d9B2XP23C
	BWBTVE44S9MWw2Y2pe1i1Ge3bvKTJFCJWjfIT7skRHkBsKXAV7YiMoYVmePP185l+tQyDfwslRp
	8ZwXMvrc1aBzaAOJVNTBJbeBM7GUCylh7aX/ZeHHkClt4oG2EFiIT8IYsnwMPuX8AUkAs/S7Xdc
	0ghJ9mGyX8Dj2tMZkzTmqm+Zc1PkWcSMkA6kpaePn8Dyucq4JfgvIEv0kwYH4cVIUbc19mz4/kI
	CVWObqGh8WYxWJSkNlC3rtkckpUiTMmcBXLx+V90JhQNYfaosA6jWJwa/hFg3i/esZgbfyILw=
X-Received: by 2002:a17:90b:3147:b0:39d:eda6:8a0b with SMTP id 98e67ed59e1d1-39e54c9ccdemr697045a91.21.1789678079561;
        Thu, 17 Sep 2026 13:47:59 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:47:58 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v7 06/11] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Fri, 18 Sep 2026 04:46:17 +0800
Message-ID: <20260917204624.2427486-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC side
SGMII), the PCS does not automatically restart auto-negotiation when the
link goes down and comes back up. Without an explicit ANRESTART, the link
stays down forever.

Add BMCR_ANRESTART in two places:
1. In xpcs_config_aneg_c37_sgmii(), when starting AN, set ANRESTART
   alongside ANENABLE to initiate a fresh negotiation.
2. In xpcs_get_state_c37_sgmii(), when link is down and AN completion is
   detected, clear the interrupt and trigger ANRESTART to restart the
   negotiation process. Propagate the return value of the restart so
   errors are not silently ignored.

The restart cannot go through the .pcs_an_restart op: phylink only
calls it for 802.3z interfaces, and SGMII is not one. Changing hardware
state from pcs_get_state() is already done elsewhere in this driver
(xpcs_get_state_c73() calls xpcs_soft_reset() and xpcs_do_config()),
so the same pattern is used here.

The latch is cleared before issuing the restart, not after: clearing it
afterwards would discard a freshly latched ANCMPLT from the new
negotiation. If an MDIO access fails at this point, it indicates an
unrecoverable hardware condition until reset.

Also clear DW_VR_MII_AN_INTR_STS in xpcs_config_aneg_c37_sgmii() before
starting AN, matching what xpcs_config_aneg_c37_1000basex() already does.
On the non-inband path the function now returns the result of that write
instead of the DIG_CTRL1 modify.

Update the comment in xpcs_config_aneg_c37_sgmii() to note that although
the DesignWare databook says AN restart is not needed for MAC side SGMII,
some implementations (e.g. Rockchip RK3568) require it to recover the
link after a disconnect.

This is not a fix for an existing mainline platform: the affected
platform (RK3568 XPCS) is introduced later in the same series.

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0337e2bcc0125..8c3875b6985b9 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -761,7 +761,9 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	 *    DW xPCS used with DW EQoS MAC is always MAC side SGMII.
 	 * 4) VR_MII_DIG_CTRL1 Bit(9) [MAC_AUTO_SW] = 1b (Automatic
 	 *    speed/duplex mode change by HW after SGMII AN complete)
-	 * 5) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
+	 * 5) VR_MII_AN_INTR_STS = 0x0 (Clear CL37 AN complete status)
+	 * 6) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 1b (Enable SGMII AN)
+	 *    VR_MII_MMD_CTRL Bit(9) [AN_RESTART] = 1b (Restart SGMII AN)
 	 *
 	 * Note that VR_MII_MMD_CTRL is MII_BMCR.
 	 *
@@ -769,7 +771,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	 *	 SR_MII_AN_ADV. MAC side SGMII receives AN Tx Config from
 	 *	 PHY about the link state change after C28 AN is completed
 	 *	 between PHY and Link Partner. There is also no need to
-	 *	 trigger AN restart for MAC-side SGMII.
+	 *	 trigger AN restart for MAC-side SGMII on most devices.
+	 *
+	 * Note: While the DesignWare databook states that AN restart is
+	 *	 not needed for MAC side SGMII, some implementations (e.g.
+	 *	 Rockchip RK3568) exhibit a timing quirk when integrated with
+	 *	 phylink and do not restart AN automatically when the link
+	 *	 comes back up. An explicit AN restart is required on those
+	 *	 parts to recover the link after a disconnect.
 	 */
 	mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
 	if (mdio_ctrl < 0)
@@ -816,9 +825,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	if (ret < 0)
 		return ret;
 
+	/* Clear CL37 AN complete status */
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (ret < 0)
+		return ret;
+
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-				 mdio_ctrl | BMCR_ANENABLE);
+				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);
 
 	return ret;
 }
@@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 		return 0;
 	}
 
-	/* Clear AN complete status or interrupt */
-	if (state->an_complete)
-		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (state->an_complete) {
+		/* Clear AN complete status or interrupt */
+		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+		if (ret < 0)
+			return ret;
+
+		/* Initiate the next round of AN */
+		ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+				  BMCR_ANRESTART);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.47.3

