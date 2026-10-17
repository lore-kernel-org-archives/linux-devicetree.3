Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E9B38425D
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215889; cv=none; b=PHk6pFi6H2KYjWtfJVHHWYy8spA88CHpjzd983pdwTG4X3aOl3eT/QhRkZJ80DttVGz4oDDJh/rzMIYadsV/u/p/CobltxG1AEqnlfwCEZ1zDq1p0K7Pr2RDxI/jyrkxirVCETTm77IH9W+OAgFtm1GrDPS9HTCwHJ6r9zb51Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215889; c=relaxed/simple;
	bh=K8sJtTy8arsyLPVQc9/n8NVgxkq77Tb09oquQ0e8WBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UL/OzAzBqfRiigA/xz1Lkl5Q8MPPLKdgG3Xwy9R2H5NZHZHrxUfch01WptuXFqsqd9KdK8qsU2fp0F9tlgUblu4KR+FNONcaSLr1/KdLlaSBw68VCUlRML18bchilHQOAcSpHxJYp4TrU4RwA4F3Iez2oxCEXBk8PoRfjw1/8hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+hMYpTg; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+hMYpTg"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso36532a12.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215887; x=1792820687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=V+hMYpTgldr8cdbOIdfZNN5AytQ+MEjGnGlzez8CkjyRWXxo0ONlX3pvkk1fz7p/d3
         iW9L2WssRgblXBqgviIwyIXLnaelVPzUvcsaV1o8AROt9wWwm7YcKDALfeq3jge1YyAL
         YrhlZ5HUAkmuRXEhO294gmHSzrKPHdm4TEstSUk/wV1+PUyJg6wETYtn2+tnYbhOetmL
         +czRyNuJoH0olio5v6jJKe/xa4W5aFSDz/xjTIpJ9/uuRjlGK2/jVF7X4fjq+xMMj+d1
         SdMPiHmypc/PT3YnRlNG/o+PnroPuzRx6IjdJG35JWnOeqlMrtHqyf6QJuI98c2fLW6w
         arTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215887; x=1792820687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2jHQ5uSsWE1tJZ2r8Ki7n0PjxWkIoR+7RH2XBS7AsA=;
        b=lVsIs9XnDFEBpEJ+zjWHoZY5j8Xl+2Sqdxc3ZaXvVL+zA7/wCgcyD4ACX+VhBEck9C
         iTMv/y/zhWgPhvS4T6jElLxpjhZIqIWX+fUqmrbyx/buXIJI23avZkBPsK+oe090NgRa
         tZdrEPwKnC1ij28SpCNHOcPz12Rgn+p3BQi2xXaexU5abNZ762eYGWfXD9we+PtadA1l
         5OXmW4wDXvzs2eJHgHQIbJJg3Ch8iaYD7uFEzlDQ0ribwUoThMfXVAUO/qwWJh9SCS6N
         62QdSHowr363mVK8o8Zqs37v+sIfq292UGxtpCmpHXE1sqeA9AoE2jbLmjbS9OfG4S91
         Totg==
X-Forwarded-Encrypted: i=1; AKwUvByysLaSS5FJJ6iQPECtfI3xwCSUAQr5wKwenFVgB0QX2UpbR6mTvDSkCis5EHiXqcel0Qjgr2bWWs+H@vger.kernel.org
X-Gm-Message-State: AFq9FYI3bw7656zMGpbq00JgK9/kQZGMdt6WdFy7fpbY7ffbYzngNVu5
	v6O4o2hoSeBUitlKD8LzVGnUqH+qGwwqaBuMYI3sIRHTJ64RZFe0tGqn
X-Gm-Gg: AYBFou1N30NbC1OZMTLdKNrB7NvqznMikeGDSJwrse4Xg+7HttL9q0H939p6bsCmzL2
	hFjMa3fR7v4QPY6iutJdp30FcE0Bu+bZoopXL0xbHelm50Cm79CCH0h11SauePCTaNRnNDJAMss
	uG9ltqO93RczIbElyLjUCorxwXtNsX3mkM9CojXpYeii/qsaEqmKt3ShnHEJnrbqt0YjMiqyw3K
	ya7j81o4VZybS/YNyBQ6eb5U6DqTJM46reWsuMVjVLlc5ixeDXIh6j+vKOzP4tE9nACT0q8mcKN
	Q9aBQ5YmRoR2aPxKYBQk5BPLzPAC2X2YJ9XNfJGEXMr9ixHGHCSxuk68TM+jcSDIQz/G29Z3M5j
	fUJGJ9ZQ72bYK7an9Rxf3OYd9pGhKyIuFrsmec0SpnuiBQSm6wk03Zqpew4+6YJ80z4DleDT1ut
	EZUPAIl7bXn31B01DPlgs+ql3igdgt0/7l2Ikyr9yTbyxlltihiI8sn9Q7Ckm0VrAKgSLx7A==
X-Received: by 2002:a05:6a00:3386:b0:89e:fc56:a25e with SMTP id d2e1a72fcca58-8a04cd2efc9mr1245701b3a.41.1792215887340;
        Fri, 16 Oct 2026 22:44:47 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:44:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v12 1/6] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Sat, 17 Oct 2026 13:43:59 +0800
Message-ID: <20261017054406.1828061-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
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
index b415b93d77c15..6466e0ff2a98b 100644
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

