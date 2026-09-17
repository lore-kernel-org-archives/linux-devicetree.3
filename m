Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91351A12B
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667729; cv=none; b=W/Cbri3olThc3aCWy0QrfOpeDuHtLOVF4hkU/202J1V1gfqWTZB9uSQq9macBoTwpixnJ99UmnmeA/oTib8NqH7sDCodwkF7XFjJvFTlsT+Ebl6vKUoxpCgkP+gdnzd1yagG9zjWzaXDVp9ljyad/KgON8/PoDDg10iOX0OJpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667729; c=relaxed/simple;
	bh=TBZYNnslEgmqiIFbP9mDmQG8f/Ol4S/uoq75IjbY8ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqRcb/3cFw367ac0l+RvtVxe0byQuhotfJIfvKj7RND4AvIaR6sp1KZlkuB3stzhMaRBvnsCtfdzypycIpg7Acb2JsN6sAyi34a6BeMELOIyZYDmJsDX9J4p1ZmP4d0uOb0ZL0pfyKD3UhV3kunMTUGA2IWATokFh/LssULN1eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT5I6qAc; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT5I6qAc"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so446392fac.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667725; x=1790272525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=;
        b=nT5I6qAcfjrnW1Cn9I2u45erGUmT77vai/y0vAYBGJDagsAp9veTcsk/Azx87LFug0
         cl4MRzR9NoGJSTOBHii0lK/OovNpQI/wJvdA+GYjmuqASYZeXnAasrO5hqnOrag+drSY
         6TYVr8GTYNaLHQsnpdfuh5LRCdpw9vx6vIRMH3rd2TIGMEmx900nHc7yX4DTb6wRyQcY
         H2LHVaqXJ4y8ERUN79RJRld5BRu4lC8/qOgioBBjI0WpmfugC6vaFuZu5bdGKpNYUtgH
         NzVOCmcXiYGoIKzYYGke2P5Bv+ZtHz63XLQ2V1aMIvGCneCqxQHDEcbYrQ7qzs1diZcG
         V49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667725; x=1790272525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=;
        b=XGdSmPyGumdVzvujWjAsE2y0Y7yQGipXFO4Rjic6n3/qekfenalxmhKHXGbPI+D7+4
         j+l0z4Q4pmniuY+cwV6nE2PRC0N3iv1eEnFsl2LQg0tJfjAiFUSLKQf0I1zunpzvClLF
         fYGgKIb2cDU9/pajjEOz23sQbMx0/lRe3X5xNqQbIaGf2otryt+FPBQ0MyDp4rHpbliK
         QQ07TRXgyjGCVgEm8KelQlP0E1qjbRy24l2WzdA+YHZ6G4P57tMAojw+gBdx2oPO612f
         DXBBcPGsloUk7eKRJy1CAKBLOyt+Jl+HOUL+t9EZ80kN4Q7ZGCVC0dUMGcRe2J4WZ0m8
         6zRg==
X-Forwarded-Encrypted: i=1; AKwUvBx3kfJj7LZq3I7n2JvbQCu0HXBWj8+6k9r37FB0/ydAKMDNpTSJwy4P2UFGwUNL1b4ZhGu8MY/Z95rw@vger.kernel.org
X-Gm-Message-State: AFuF++miuSfYsde7j2Vj/mJzqZYWbVo2OT62VkvkqhSzfXaQFHR4JjTq
	z1T+AxsIkCv1q9iCANiwk1NAAO90VNEjDkaaL65TweKnACaR96qOkO0p
X-Gm-Gg: AYBFou1k74BHJeJ6zuKzBO8PrK1FRTUJwVEHfJlrhsM36ErVpc3lOEXa58ZnfnmSy+6
	lKa6f/j8zvj9oEJfznf3riTLvXQS5j0e+smXPlJ1HSPgm0XooK2PnPEu34E4nNweuQaL1uIFUp0
	d0wGl51wpld88yCdDercrlywF/gE+i3mRwNwozxsvqRbkl13J7RFHWUodGyNTMTFS2NMVHfshaP
	pwI3LraThqdZkjNh7cgHcO4zDF01fGwjdXsplqBJTfl5Utpmfeegm5e1oXKhY7OIKn1iqOchivq
	+0tedj6ItQidpiw5UBB/KSXt5zR97HitcMBmlPOyq25o7nAWcpSC9MeqCvze0eetauwVqOeGdDp
	zUtASHflR5grSnZJnkHY/aRITzUu59Zk0r7VXWHihoYIR/0f9WBJpz4Q26jFER58TfWuMHVYjmB
	X/bAlHYe4RuCQ9AGKOqeGLc8VnYXqyigEV0j9kZ04VsnMhVAhq9MqMYaQp2uYTby8g8MmvBb4Yz
	edhweYBgjWf3M3Wqv9E+veA78H67lLLZbzr2EI1Sa/3AqiipSriHxXuijzNdO82uw8YuEyXtJNU
	gc8W6RUX/6EabwiHNtF/Jcljv9nLbRQ/A62kxgr/gOE26ogyhRxgFqE6jWphrcT9++G/eLWMD64
	qjQTraP9VTsDvi5akJHne
X-Received: by 2002:a05:6870:1696:b0:46a:c0ff:feab with SMTP id 586e51a60fabf-484752f7f6fmr6824911fac.6.1789667724804;
        Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:14 -0600
Subject: [PATCH net-next v3 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-3-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4523a14f5e0c..1020168f1c3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1276,6 +1290,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0

