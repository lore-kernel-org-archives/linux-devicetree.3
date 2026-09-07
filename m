Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF1950AC39
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795568; cv=none; b=mQL03iktduqgVi9+X22JliZ8KoFzZQgeIZWcKglwHXLmISTvR1RU3eNz303daxVguaywf/zP3VRqfMF90Eh96kCkOhIwznzL+VMhanW4ULlo1RagDjBVXh5HMTY+WCJbtI6AA4Bd9qkJqyLlj7xbahKRyJVSkP/OlT3FTqeslqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795568; c=relaxed/simple;
	bh=iCQafZpFqsdcijM7wQ/VBsqWEiby6qk8Gp6Xz65rtD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZmda6YnlBlguKPpTTQFpx4NLJovMJ+U/0Ewwe/PzAaZBR7uHln65F4+cH7TYfjsB0lCzkj9qh2VA5N5u8ibP0iBIHDnoTbwBnU3WBNWb2NYPqIpRZk/XLH9UqQa2Sr5PkPJK1xenjBlWBpzXohm+1beHGLTN9MCNAtFzQZeUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nq3peZFv; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nq3peZFv"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2d6fff25530so11805145ad.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795563; x=1789400363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=;
        b=nq3peZFvmzK87LoeWIpAIpyGBN4zVxHSK9kgopmCrgyEeldFt3bSk8VWcWHZva4G+M
         SVGiyKBEPm4Ir3PYejzyUpBa7ZBSbA5yNPUPaAMjPACDzgWDEnQIy1t2NsARUl4fWpVD
         UYLj3SOR+U4AExfQ9i66C9rrPsh4hs6RmYTT8/2kt7cggshcb6LcB5l5nrSSEB/xkFdn
         Uuy3weqqrUSWxSFFFxDXvdd/EQQWFOvePMqmu0h5R3gUltD73wuNl4S3MBY9DyKHw4KO
         PEkYUQAUrmNcVuVDfKhqp9isRC9/mALt3xVq0gJr+0YY5P4NSE06gIAxPJDBOv2gweYa
         MnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795563; x=1789400363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=;
        b=M3Z3j8OyL/qNkQg9ADV3cX4t0XJh/AO1/2BjdTUgO+7zKJXE72Jvp+8ulKc3ObMyps
         nh1dpncIvuRZxJ29rNBZu3QUFGVG0f1K6t+uSjiP6Mmyr0sN9RPYZplQ243EBgKnXx0d
         HhtQXUcMGajokZ1shS9+POCUnyD7zxCKtPoZmbu98lBcCqptt7RjU9Yr3GtztezffozX
         Pem4EeyA1wzJ+rIBXpjfyiV3gZou9QnIx5EQYGl0g23sJ8VW5xYk6EuFWTx60DvAd8BR
         0FLwnDy6ojc25gpeghaFTbUJlBVRM+2hJ3Mc1gVRAZRyJDWr0Kznh20QnhESmdHdZUjQ
         3rXA==
X-Forwarded-Encrypted: i=1; AKwUvBwq8pNx9pBGJt5IdhyqybaEV7cTs8K5gsmFvMfjbqfG2CioTlkBO+TAyIXuzAqKuJafaF7b/aFyIDYC@vger.kernel.org
X-Gm-Message-State: AFuF++lDDcp/0WJSn1Nk4LyItpcE6BBvpUSDIom78QZwPqD3a+gJQ7Dp
	bXnf7bc8Q56u2jzDuRBf2GI9gdOf6KVLTA6y2iiwxnDlefCVhrYBOEIQ
X-Gm-Gg: AYBFou2Vzq7YK5VPZE/+nwdnpNsMoU3UGP92VKXiooeXCeIYIj10Pg2MpdI66JENHvk
	NuZWP4QyDHEOymzrCIjpt8yWo8XUsgNDdB/O2rdSwSL3LrvxLLJeup5pRg+TzoHDjPSVGcTQMMA
	z9Dn5aJXpK4p5ERqwJQyHjivhtnXIzdvuz6MXhnNk/mQHp8WeihWj/aRfffqqR5gM3uMTBzkmKB
	OM9Dwj/GT7s6Zlauof7Ww3iJg+XCDGdYQM88dKzaEYgtN5EqYfCKkEgc1A0uE4LdPNLxKYHBE6r
	ckezzROISfYsO7AeA2U5C1bnIq1ptD5gEg0vu3neOI9F09EFC6xcyIXwjQjAl5KtW0vZYaALTku
	xIpkF3h8B5YZ9m6SICMyViJqs03x6L5G/fBcAC0HSdCy79GHq/dS0NgxQxSyDZaeLCm3Mp1r+cx
	Ac7Okm19vwFJYdaX9plIcaaH2rtoG7kccRW7B6f+eDSdL26p1YKZHyYR1ZRgY=
X-Received: by 2002:a17:90b:384b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39b261e79f1mr34240199a91.13.1788795562857;
        Mon, 07 Sep 2026 08:39:22 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:22 -0700 (PDT)
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
Subject: [PATCH net-next v4 06/10] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Mon,  7 Sep 2026 23:37:09 +0800
Message-ID: <20260907153713.2572547-8-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
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
   negotiation process.

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0337e2bcc0125..50b9cdf94fdaa 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
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
@@ -1093,10 +1098,15 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 		return 0;
 	}
 
-	/* Clear AN complete status or interrupt */
-	if (state->an_complete)
+	if (state->an_complete) {
+		/* Clear AN complete status or interrupt */
 		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
 
+		/* Initiate the next round of AN */
+		xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+			    BMCR_ANRESTART);
+	}
+
 	return 0;
 }
 
-- 
2.47.3

