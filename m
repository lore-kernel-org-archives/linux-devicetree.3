Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504D3537FB
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037935; cv=none; b=sCmAtV51SJZSpsLSBxXbUryfUiJrYkRMNLJbvAxgNeFPp4KxZBeKabVk/dlEf2WYeFjnTRPoKB6jNeg2FvBsUO7RFZ4tDvos2mL2EynCfxkx8bo8meWIeBPYHPTCxjjiOvcYzZyD3lYRtHTzsdYrXjFbTWDPid7TIWvd9UntftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037935; c=relaxed/simple;
	bh=e9hk5Tsdquyr+5avHPEA7bcfLf2nOdnHsiLzbvu4On4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grD7W9BLcN5lF1YA4PAI8ZLDZoT7KvdA0pLMjcdYTGbZhsUbK0AOJjJS+8OmoYUC5X8G6yJQjS9iQNozEVGtUVGBK07mf2z4Nd2GeqMeR40s/VU1jr7dtTr8z0FSbTz/zKf49d3fwdOrI65gstxtHxsFMaKoDOESxLwKHAKvHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhM+It5m; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhM+It5m"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a3688a2so2514308b6e.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 17:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037931; x=1790642731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=PhM+It5mqLbZ7YhOvK2KNrTEoxni7WRnq6aPvlmblT4/+6t7xi1H3vYr57McO+ZVOh
         WfwVINiNC5hN+w7xIMVchq/6/ioDb0+uMvW8QCCb5F6EWRqObB7M0dOZxaBrCTMdRG06
         3msitVZ3cOXYhBzvpJPnRkMVNRhs3VlqFETsgIgbSUBgXWp16B39HnDoJ4NF7fQLJQsj
         eXyZCXczZ5Fp8QDkYgeoaWV0EJ1m/MJhNYyhgjw2trtFiGzpIP/gA8N3vyf2GwJ09urP
         0ES44kzChYAJH5ThjyYaeKoNzPRJJgOjpfvgz45cKPLpoinYM5Vsn49CrT5VYxi2njtu
         tOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037931; x=1790642731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=RtEtIxbBO6WpWrJ4WKP5hUdX0rlfCv9d/ufxyzxOCCMBHmcF3vIiL2eNgT27QRv9CH
         c8adXG2gOlvv8l16WaUA+yXmSvbYr3WO8tGR63rXt97Chq9spiBg3VEMLP8Rysu7nr5r
         CVGNIRffLix7C1aev+knTxj/Wk/dwU6X3ntbEXDWuavLrcm6m6oU5ZR4EEu87ymewCPH
         7H4XnQyU6F3GF7LzpYQR7Nc2CnZBP1va+XBa2iPGcSS2Dg9sBb7NW65a5y2eEuCB0Si5
         nOnAEXm4q2FO+b8qVa1pLzKAMxegPJjjhT1/mpKnz0DsZ3fuwgNLmKH7loI6xYDxLUKe
         56dA==
X-Forwarded-Encrypted: i=1; AKwUvBwfgKcxVwRAnxyrmRjf+KIPX43WhqyX2T7lZ3xPX+rdqYxzVtU4iU0sDLS7pqVq1+NARVjfQwu3j51M@vger.kernel.org
X-Gm-Message-State: AFuF++nApeOvhEY8BoDHt0jl/5KBXw3t8WduGVFwqlZGX77dSGGXrxF0
	ek2w7XvX5EQokAcNtAKN7mgLdZ9y3UgDcGuWTHjwLgvO82QwVUZSdo2Y
X-Gm-Gg: AYBFou02Rj/Pcg76nhWON6V2weateNoTar/HIEua1A6tRmwMY49FxuCds6Hlw7HhsZv
	67hUCGziIW1LP2G/J7osbpOoM1EkmK8NQFnfTc+LeLmNXAKXgepyhb188mcUNBCtQkv3fbkDy0o
	qyTwZHXKBcAuAYIiVKWQff5cPEgeKXt2qexbYwH1sABZi0P96OC5XKzFhBmZneJHBkR//Lluixl
	74Y1kvYkmXoKqj3sWalJAFOdn1TVxP83iPwSvXg+n9j8mCCyf0yXCZJOydDen/xe7vpJY9yikM6
	MxYY+Vial0MD5KWXsIfbzVFPeQ0S3ebWAq25Y/8UzjXPPzBzffwBnG3nxmWA9EHTGbKeYcCqKTV
	pkehVavzsj28Sp9tqs/jk1kkWXw52rEZxPkT2j1mnSrYMgWHsBsLa9MGGoO4AuWJ/9SIQwyM6tc
	ywKbqk+saut9Tk7bIWvavn9TD4ZUxKx3GVUpkVKxRxeg+MAoH2BQqAOefUdwFWJcFnU744hPjzm
	Z+lWL+KFgejzlspaJN2WxXXuyKG1A496jPKtPQH9cOgrekza8i0wyV8Hq8zZJK45qwsxR2Cc1U5
	2l2rfpCQR87H+pr/4Pq8OmN8PF2CJ8jdKohYtPfUGb2fF6uTu+Khy8QKoTuIYNWWcsMsBqr8m/C
	wfuqHWCslf6bIS/8vfxsiNKkNAUc9cmaD
X-Received: by 2002:a05:6808:1701:b0:4b9:a8ac:487 with SMTP id 5614622812f47-4ccf91570e3mr11567524b6e.37.1790037931601;
        Mon, 21 Sep 2026 17:45:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:26 -0600
Subject: [PATCH net-next v5 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-3-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
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
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 9598c386bb21..0ea1860cf203 100644
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
@@ -1277,6 +1291,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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

