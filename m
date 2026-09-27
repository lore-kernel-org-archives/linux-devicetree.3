Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70864439F9C
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790535162; cv=none; b=alSjHL4wgCd6pX4UqZqeFp59h4NgJr7nxtZct8VnW7TR6CUmXyhCUiwG2Hy2KUgOypkZbIQBJVAX1BGdUtbUcJXmuKEicVwzNEeCNugowjMleRSSfZ9dK32hxRXiciTdVBhQueAZqnUTYs1yxFWCl8Bth2hWGwUGnwbxzsvSioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790535162; c=relaxed/simple;
	bh=LZU2UEoJoqXa5uqbCSIGcGZQwGpaf5s9d0O/6M07Sus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbaN+YQ3vN3Y56Fqb54Vuo4asofVU3/NpL3c3QJ2e5221myQg2VQjXr6wKDPq4v/vz1bFg5qPeU0XXzmDtyuVqyG6OBlGTsDLMAUGfbBfDbhHXlsWZbPCLmLpWNWIfeOpBjnZ6Kd4M9oQhb4iLj9Fbk5PtVLhfLpxHHfaMnkNNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRQkwFU8; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRQkwFU8"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so1511877fac.2
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535156; x=1791139956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AU4yKGQ6L9A+Mmj7ksqDUcZd7jKkYCDxeCg2XUTgNgQ=;
        b=HRQkwFU8K58eqFs0Van5D14EZYbIU5vdDXCQCpbmSlsXi1ZEXwOLNpg42ZpvkyTMcg
         drRRJ6Y6TfodgFE40aMC+kRj9SkpyH8StouIYqqSHJdPgrAa7IhaT3Z6PzEaX3V29oKZ
         HDGS51lGGkKUecxE/Hqe4ulopFDfMFVmRwdzSBoQE+IHDHwbJG4RgHffj6mJf+bz2GXL
         BZIxSgRvvIkx84BypzXJgp5BewSBv/D7hxMDSgpJzXb8iWOlIRLCeLYLAreZ4WUe/AGm
         dVwCME3tFdQYHOEVCT4geNvd/hTGS/nIn0F7j73CVIGed1fJtPEtvckUB22K8T5I/wfr
         arIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535156; x=1791139956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU4yKGQ6L9A+Mmj7ksqDUcZd7jKkYCDxeCg2XUTgNgQ=;
        b=X3dhlIGNrCGOjxc7sbypn01Woc7CAQFuSzm729B6rFo7ompw3mbenHdbnybOSZG4ch
         RTmbYO2PdMOvGYS2VHcOjSq07tTkDP0MKZ/XK5C+3znxxBLc7RJKRFiT4xh6bv0Ukpsn
         U9Nc0meITaB5NsTJtgdb/V3kH7c/50uZvSA6pr0LNXyrES6CaLPqCHUq0CwyxjaDtBlv
         oG9OCla9KPPI5hHsnBiXTKOEl6QxtTrDJ67yWjgGnRpO/S4T6ruoRN4RLb/xljF19FYw
         v2eUoPAzVCbMys/AisXVs1KbRqA4qU9M/6jK4YDTG9xXm7LJj160dk3KvEAzzHKdx55p
         ylxw==
X-Forwarded-Encrypted: i=1; AKwUvBwhs/MV5x78QBMBpuwgpT++0KnDlVa67QL9v2s4NHYvkEXXzfZlLlwTIann89qWKLvekoTl+k4uJ7RV@vger.kernel.org
X-Gm-Message-State: AFuF++lmKjlNKszYfmzqSm00RBwMXpBial27TshyQsa/FigTP48bqljB
	dSAvaDOGBjqqsRHETPkpO9zqf3u+hQ9r73gPGYz8W13jsz3O2W3rx5y+
X-Gm-Gg: AYBFou3RttqEiH+c+Cw0mxKHFMO773jkvpf0R0tW8xyxqMeAhX2SEGVihQyWZkNsG1D
	+ENm+kv0IRfKsN8SCzYguZ3tZOON0KfRWIBtNHTZ1Xkdk3xkNi8Kam0LoegxknueAgfzYimVxqJ
	+JVqZP7+M9NkP8RYUnFaec4VBl3AzS4sSecw18En2GRvRLZM+xcaltjhITKc0NNHIY4yEIzU4Qp
	swxyv691paZLUpAobh1lg9RIy1nz9bDc/hSvGg/Z4ZPGBfzvqyI1thZ+/wLnMwwjpkkWG7X3U68
	Yv4UBIK9DEM36wlcIB3TDLrCtRH6ZnbAazMfo0jPPYMLF6pcKV4+pwB653/1An94RzM20cwb/6d
	2fLgFPSZF1jGLEgZBQLJGCODO1rpYdkhj4VmIAEBhZQLurWgZlW0iS/s+RutQRZr8saoXuTP2oa
	COhOnqqYhJDil3QmdmZIY70sCrSdwRio6smp4ENWfEZSPEkb6smRAaAl3CuuMFKyf+NhruopvHN
	JLaGxh7AtOkqnSvz4xO1q1e0GWFTD9w+dltPWka6/nhIz1zLKZxcMCH8YV2Y0+PWKDh/PDLhahl
	EhevPFf/L2bs7mFyPS+uB8piHlyjNV4zvtouUV946D5Yc1vf1JIUJqNF1m2vBUQzw0zzGGi+mgh
	z8WIvhgUJDcjDE9CPu54W
X-Received: by 2002:a05:6871:1d2:b0:47b:dbb4:7cbb with SMTP id 586e51a60fabf-491e4f73b4bmr12418319fac.14.1790535156264;
        Sun, 27 Sep 2026 11:52:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 12:52:21 -0600
Subject: [PATCH net-next v6 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-h616-emac1-v1-v6-3-e64971f4e414@gmail.com>
References: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
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
index 5691da796454..47954537b29e 100644
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
@@ -1281,6 +1295,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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

