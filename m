Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FD3A9632
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822355; cv=none; b=A9igC/faMqIWeFGAtJnv9akJfrDnziLq1gc7GTXhFwZEYj/L3kfpXlARERkMl524euJkNf1spJQZ0yxPjbZ9wctMtbXqvkfAKIs06yA1LrkH0Oz93CSHbuhm7uBtkogGxZyGsjdM1nd28IJnGJvB6ulEn1+f6UvadCRWCsiJhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822355; c=relaxed/simple;
	bh=k9eLD1ZrXZD1iMizDWP4jTUk+ML36ocfJ7jazjazAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XDt9XALuxdkeE+rm986tsrc4J2fuqDEx9tw8P4RUl9sXW1eroC4udUJgmsQERJDfMkQ0trRnpjDoKRVjc7c0hTlZcz0QhApyRdi+SvzGHhUFUtpepZAlpZsjH+WmTTqS+Kvp4BQQUtuFzinT6EXcSQpv3ePjw/jUzoiTsBf2c/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9621wE7; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9621wE7"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-39e0e245eadso664870a91.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 05:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822352; x=1790427152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/eBjsMbUu4KmQPd6dfybXXRKRWzlAuXWPZqO5pNdlA=;
        b=j9621wE7Vw1YGck/1ZiJukjzqTH/MrJ2UJgjnqMmd+t39Q5WVnfZ71Gst8RRYbirfw
         4LEo4ukzI6vF/oz1x9/9UlZ8p9zPi66VUkrChtbudwmkT/kUjVJEWX0sarCE05TjTRF7
         3297QuCW+g42vFSYCIDQ5NLp3OpKN62XWw3pzDvLJYwJs9Qyivk1ErALsTDnYRFEHnmR
         Cwd7ccaBh2ve+u+FJkIBOCzTVqvQGFY2x9m1BAE1O+aEwnqps0Yi1+O8o0Y1ljwBRDWZ
         nUZMACouQ9Y4Xx55vGDAYYVGZekarrgbFuyXr35yzu5y3ZY65VvXZkFVZzuZZtrkh/nD
         Boeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822352; x=1790427152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/eBjsMbUu4KmQPd6dfybXXRKRWzlAuXWPZqO5pNdlA=;
        b=haACgy4/ATo2itdtvt/qBCj76OrJiMUQpWk0YdGO8bYGoMzljB/ilD0RuVrtzpebSP
         9TYp1f0eJBJWxI5zCasvUo6DJo5AztkCQEXIjakx0TotzqAhZr87BJD+qEcNZ/XAS5Ds
         DjlOtd+Jx36v8O+HRbfx1ufGbPldiasbecsc9XvyOqtoH6uTuEUY5aAycNgFyVN4vvvy
         zeN7D2eHuSLd2JCw7mhNiJ2SJrMbNcWXU/AW4h7sn0noKsK83WJ7l3wGHGCn2LLwof3J
         1MM/eWrX2B4ox5kH23sKJK+z8NxQ+OzDNOgBJZXqNCpj2ljY54iBxsXAlqVE94i20Hfh
         RzEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO5qz0zaxdiSGGkauUZ5FqfaelD0gQEZec0nlEnmKZyt9y0HtD91NuQngKh/Eyr4wQQjToyEc8c/af@vger.kernel.org
X-Gm-Message-State: AFuF++mmEJBbPKb6vPFX8fHb2sv9tPBd3bMBImCMr4+IpeXWjcbTwlFf
	OiWh3/Mhp91i5g1skNymgVHsQkTzgTv8RKqZ+qw2vzN55q9LbEN9a7XR
X-Gm-Gg: AYBFou0k61unVck5LrgedInxzMJ7gv4doK/qQMwxxNrZq7mS1sgBoXG7GwQZhZP8WtI
	BYR3ipOZSWrsZuTfyyF6vsfD79W7RmJWPA1uK8BSs45QW2P9UXMIA93iymAV0p0H3x0J38SQnCe
	D1ZhukUbConbxU5AQ8+MfQvTVY+7effqkgsSjpwXFYLuSXm9n4NeWr90Dud7TtTY4ViO+J/yXHy
	Ij7Wm4/Uq1rxh2c1rXPcqZRXKpL74s1nUbqy5IyoygK1ofY+cYjoxe89eeIbAlF6L37aZYKLQk9
	8YDDJwWF0Uq8J6hcVOI37uM6pExH7+8WAuMQyBugvKO0wzP6JFoA9BatHudt4RMAy+pmqso+oHK
	KFxZRsLDhSpGNQvozTj3k4tEH2fyz/q/tq1nAq3NHG3lXJuazLZh3BlqcCrTS7E7kj+WjNXsRn0
	6xMYP/E1W/b/ORB7U9D+gEeoMYK+/XF5YZp46Ej2+qt2pI8+vA2GJVVdb7a8uKcwXnXl9zbg==
X-Received: by 2002:a05:6a00:14d3:b0:878:37e1:aa74 with SMTP id d2e1a72fcca58-87837e1abe3mr1531710b3a.54.1789822352406;
        Sat, 19 Sep 2026 05:52:32 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:52:31 -0700 (PDT)
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
Subject: [PATCH net-next v8 06/11] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Sat, 19 Sep 2026 20:51:13 +0800
Message-ID: <20260919125119.2107089-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
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

