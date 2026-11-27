Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765685;
	b=rQDxAkYsx4h1KZ+QAUjbmhbsVT7NfqOvuKy4vY4TtTuF/oNLWaj9GH57gOM541Ct7W+w
	 RTYclhMyu7Rvo5maa4Ax9H10RXq5HhBIStBP8flzLTm/Flff/CxxIHBdU94Saio5/5EdR
	 FiDG808DQBm909T0cNaEvoxZviarOKTejh9Iv3m/LOAgJklWYioAHg93mgjjRItql+2Z2
	 y9qx/kQ52vKgXRDGF0+RRrUuhmHs5UOPMdX8aK3hkhNRCPc6YMy4nd9mVEBqS0aPKYgCi
	 dMHd1u5aFNIifv9EjeNUzOj5hzOyq8MrTV8Re8Kdy8tc3a3dOOEP9ycwBJ8kGRmrW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
	b=CYS2jwSt2fIpFyuMTABP4ozXCB3V4BFBw4OhNZg8ACbZv+fO+eDG168nHEkAwfSPuLSx
	 deRAYD6P3GMQdnE6zyCr6UZIIsWw6tkHui+uokH9EuBOSQd+rWjQ6tv68pjSRm9RYj+3a
	 2WJdTcI1jLKNBYOeByi9gIf5waHSVt4C2W1ZpLBNaDhq20nduDqOozypCXogQl5+WdbFF
	 AyuZ2j4YKkkBlr2dUgebpVD9OBH6gvcGS8Yq3votSmvH74MdzxNA2DBnyIL0PSIM9d4u4
	 Cp2+1N4QBYG/UMWZEbgVquxlaglg9UjOMvSozTh1CpBYL4HW7UGY5EoOh9xBx8g1I1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OupVADoP;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D22606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D22606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OupVADoP
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-384d74c9dfdso1252945eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765684; x=1796370484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
        b=OupVADoPKnIg4AXXB37j4VL8B8rv5yYKq/difhtktuffMV9G6qJ3kjxV5pq8h8uMB3
         hY+qOJG5yWp6Jn9dOkuQoGLLfVx6FQ3uywqIXSeZy0NGT4o3gMMim4WXE0vc9rUpXKgf
         btJzUf8dGl8kYoV9+pYMhXNSO0QdjHscr4s9QeDSyBuX2XqjXP5+kLs4glM81+v9eTKH
         216+KvY0djEkKpmRdzFIKP2FncJqJlSlNLJB4d8vsBjeHmJMsOzNpEeQLw4ARloKoRP7
         E5/OgilZytF0Xbj1d7DIobGx1P0tTu8BYBIuO/Srp80dHrlbhMj6QisJq84vVRjyi6LV
         DRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765684; x=1796370484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHpEgxPbFinlelTShydiqMdXL6WmYaYuO85mjvtFPkY=;
        b=KDxEvgGNqIP+sJoSLf8xxAGfHoQRi5uaY58oNEUUjjB20x61CHHHA/XoQ77Y1Q39AW
         fCM1QfiqeMlIxy5LjTQQv3dKkgRpzWCln2YBsrA1ZgkFvfJqP8RZwueiDnPFd1EBsa4l
         IAuiZp9hmSlf5SJG51VrwzQqeHAz1dAOXfiEF4xr2tx6/ldpFyVClqVvXKXyNwMDqHhs
         qe82yck7UBfudlsRki5WItJR95Jj1ftUXXiFm21wXmITvEoURQPcq6nACYQh2OAwDbJ5
         EnWIAISfk/dBzbNpYTrPOPVT+d9V/62VaoWfgoMs9LnA4KnYzcf85irPmt5r4InrfyUg
         0GdQ==
X-Forwarded-Encrypted: i=1; AL+hErETJzbkZafjTeCVjr6TOzKk/8ruh3SlTUzUTyMtw+IqVDovgVLodSiQdUAzSOBFypE6zEyIuYgJd4Tn@vger.kernel.org
X-Gm-Message-State: APuU4Z+G3rPA6X0tMuyjk8N29e2xDRYQZg4ko6xHnoZ825eZJpm5+Cs6
	h0uWmAbr+SjSUHBj0W3dUJmAtlOi2UPCixpyKcG8bGiZ5Id2B80AzHdm
X-Gm-Gg: AZFdTZf12E283aXQPszh2sOonp99eRum9RkLQGLYSs9cazkqiBAWdwr71bQ6OVq+Isb
	aOL9y2sZV1SBcKilkeAbLqg1emBHmSUCHt7jZuCzgfo2rFvG5G0XiZA0lJyDOp+MXzS61ih3lvr
	ls6hxwkXCigoAvjpABDm5dhXVrajHvNEq3WzIelZqYHkZ78nYbckLNVzhyfId440hReOkDWkEjW
	tCpMKoBswuXldqP9QUQXAfNUEjQRbkkeVb/WKo9fJpdTyZjKZtT6YODiED78vQWfQwOJflNifdc
	F3YzXsEiY2/LdAp67hV2toIQp5XCJbaVwgHyY7uD8doTupTAu/Ncn9w1f28xKgFH0is1ZAXFFyi
	v1iObTmE0Z0VQ6oiuXE+gU4tNzz6KrkfmhT8Wk56ndQ2Kt4kRoDkf2Y+CjGgo19FZwdLozctU4T
	NaQNJeX6Y61rlyEBSJiH/OxzHw7UzAQmxw1vBVLkz+AjJloYopNETGRFhYeuZMj/376kV9xko0j
	fBiR1czDppL5+hJHAq0esdwuelyHlLvad5dbcVmrtWk+Fi1NPYOTQYyqTsXbjWPmyJ4VldWCrBz
	pJA0oKH554bGtcypn1Fd1n3jzNn/mT6C+v3pJol+myV9ZpYuIdOLwK9BnPajok73OliJ+DbASu5
	uEfikHgkEtA2sR5Jt3v/UKg00hIckKKMEqCzZ7tynVg==
X-Received: by 2002:a05:7300:16a3:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-3856ef457b6mr33768253eec.2.1795765684101;
        Thu, 26 Nov 2026 23:48:04 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:03 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:40 +0800
Subject: [PATCH v8 4/9] phy: rockchip-samsung-dcphy: Always write the
 rate-dependent registers
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dcphy-rx-v1-v8-4-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=2791;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=jOoW884/QWxzl0iQgg361AUaX2tfS/RGrsDEUvgeOSs=;
 b=hPBLNjjuOTIc3cBAJzDu1xkrkYERbeogg9sjLO6cYL/B/adWhR2voAT0ohi5o9AAmx4T2DAYQ
 BnLtae7WCVIAWy0E6nd+AST0xO5XR/T4q9VdBMPusYv2+uqF2hwOj7t
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The lane timing init functions write DPHY_MC_ANA_CON1, the four data
lane ANA_CON1 registers and DPHY_MC_DESKEW_CON0 only above a data
rate threshold, and the registers have to be zero below it [1].

Today the APB reset at the start of every power_on provides the zero.

A later change moves that reset to runtime resume, so a power_on at a
lower rate after a higher one would keep the old values.

Write the registers on every power_on, with zero below the threshold.

[1] RK3588 TRM: sections 22.4.2 (reset values) and 22.4.3
    (DPHY_MC_ANA_CON1, DPHY_MC_DESKEW_CON0)

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 24 +++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index ce1bc62497c5..7a009d87a665 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1228,7 +1228,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MC_ANA_CON0, val);
 
 	if (lane_hs_rate >= 4500)
-		regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, 0x0001);
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, val);
 
 	val = 0;
 	/*
@@ -1259,7 +1262,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	 * under 1.5Gbps or equal to 1.5Gbps.
 	 */
 	if (lane_hs_rate > 1500)
-		regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, 0x9cb1);
+		val = 0x9cb1;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, val);
 }
 
 static void
@@ -1284,12 +1290,14 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON0, val);
 	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON0, val);
 
-	if (lane_hs_rate >= 4500) {
-		regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, 0x0001);
-	}
+	if (lane_hs_rate >= 4500)
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, val);
+	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, val);
 
 	val = 0;
 	/*

-- 
2.43.0

